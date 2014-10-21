module dflexe;
///come from the old 'dflexe.d'
import std.stdio;
import std.path;
import std.stream;
import dfl.application;
import std.conv;
private import dfl.internal.winapi, dfl.internal.utf;//dfl.all, 

alias dfl.internal.winapi.ShellExecuteA ShellExecuteA;
alias dfl.environment.Environment Environment;


private extern(Windows)
{
	DWORD GetLogicalDriveStringsA(DWORD nBufferLength,LPSTR lpBuffer);
	UINT GetDriveTypeA(LPCTSTR lpRootPathName);
	DWORD GetShortPathNameA(LPCSTR lpszLongPath, LPSTR lpszShortPath, DWORD cchBuffer);


enum: UINT
{
	DRIVE_FIXED = 3,
}
	alias DWORD function(LPCWSTR lpszLongPath, LPWSTR lpszShortPath, DWORD cchBuffer) GetShortPathNameWProc;
}


enum Flags: DWORD
{
	NONE = 0,

	INSTALLED = 1, // Everything is setup.
}


string importdir,startpath, basepath;
string dmdpath, dmdpath_windows = "\0";
string strDebug="-debug";
void main(string[] args)
{
	startpath = getshortpath(Application.startupPath);
	if(args.length <2 || (args.length == 2 && (args[1]=="-h" || args[1]=="-help")))
	{
		ShowUsage();
		return;
	}
	 
	buildExe(args);
}

void buildExe(string[] args)
{
	string batfilepath = std.path.buildPath(startpath, "exe.bat");

	scope batf = new BufferedFile(batfilepath, FileMode.OutNew);
	
	if(args.length ==3)
	{
		strDebug =args[2];
	}
 
    string buildstr ="dmd -de -w -property -X -I$(DMDInstallDir)windows\\import dfl_debug.lib ole32.lib oleAut32.lib gdi32.lib Comctl32.lib Comdlg32.lib advapi32.lib uuid.lib ws2_32.lib -L/SUBSYSTEM:WINDOWS "~args[1]~" "~strDebug~"\r\n";// 
	batf.writeString(buildstr);
	batf.writeString("\r\n");
	batf.close();
 
	 std.process.system(batfilepath);

	std.file.remove(batfilepath);

}

string getshortpath(string fn)
{
	if(dfl.internal.utf.useUnicode)
	{
		version(STATIC_UNICODE)
		{
			alias GetShortPathNameW proc;
		}
		else
		{
			const string NAME = "GetShortPathNameW";
			static GetShortPathNameWProc proc = null;

			if(!proc)
			{
				proc = cast(GetShortPathNameWProc)GetProcAddress(GetModuleHandleA("kernel32.dll"), NAME.ptr);
				if(!proc)
					throw new Exception("GetShortPathNameW not found");
			}
		}

		DWORD len;
		wchar[MAX_PATH] s;
		len = proc(dfl.internal.utf.toUnicodez(fn), s.ptr, s.length);
		return to!string(s[0..len]);
	}
	else
	{
		DWORD len;
		char[MAX_PATH] s;
		len = GetShortPathNameA(dfl.internal.utf.toAnsiz(fn), s.ptr, s.length);
		return to!string(s[0..len]);
	}
} 

void ShowUsage()
{
	writeln("\ndflexe written by FrankLIKE,and study by Christopher E. Miller\n");
	writeln("Usage:\n"
		"   dflexe [<switches...>] <files...>\n\n"
		~" for example: dflexe app.d \n\n");
	writeln("Switches:\n"
		"   -release   Build files's Release version(Default version is 'debug').\n");
}
 
