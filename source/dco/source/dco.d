///	
// Written in the D programming language.
/**
This is a build tool,compile *.d to exe or lib,now by dmd,and help to build dfl2 gui.

Copyright: Copyright FrankLIKE 2014-.

License:   $(LGPL-3.0).

Authors:   FrankLIKE

Source: $(dco.d)

version: v0.0.1
Created Time:2014-10-27
*/
module dco;
/// dco 
import std.stdio;
import std.datetime;
import std.process; 
import std.string;

string strAddArgs,strAddArgsdfl = "-de -w -property -X ";
string strDebug,strDebugDefault=" -debug";
string strWindow,strConsole=" -L/su:console:4 ";
string strDflLib="dfl_debug.lib",strWinLib=" ole32.lib oleAut32.lib gdi32.lib Comctl32.lib Comdlg32.lib advapi32.lib uuid.lib ws2_32.lib ";
string strDFile;
string strAddLib;
string strOtherArgs;
string strImport,strImportDfl = " -X -I$(DMDInstallDir)windows\\import ";
string strLib,strLibDefault=" -lib ";
bool   bUseDfl =false,bBuildDfl =false;


void main(string[] args)
{
	if(args.length <2 || (args.length == 2 && (args[1]=="-h" || args[1]=="-help")))
	{
		ShowUsage();
		return;
	}
	buildExe(args);
}

void buildExe(string[] args)
{
	string c;
	int p;
	foreach(int i,arg;args)
	{
		c = toLower(arg);
		p = c.indexOf('-');
		if(p != -1)
		{
			c = c[p+1 .. c.length];
		}
		switch(c)
    	{
			case "gui","windows","winexe":
				strWindow =" -L/SUBSYSTEM:WINDOWS ";
				bUseDfl = true;
    			strAddArgs = strAddArgsdfl;
				break;

    		case "debug":
				strDflLib = "dfl_debug.lib";
				break;
			case "release":
				strDflLib = "dfl.lib";
				strDebug =" -"~c.idup;
				break;
		
    		case "console","con","exe":
    			strWindow =strConsole;
    			break;
			case "all":
				bUseDfl = false;
				strAddLib = strWinLib;
    			strAddArgs = strAddArgsdfl;
    			strImport = strImportDfl;
    			strWindow =strConsole;
    			break;
			case "addlib":
    			strAddLib = strWinLib~" ";
    			strImport = strImportDfl;
    			strWindow =strConsole;
    			break;
			case "arg":
    			strAddArgs = strAddArgsdfl;
    			break;
			case "lib":
				strLib = strLibDefault;
				break;
			case "dfllib":
				 bBuildDfl = true;
				break;
    		default:
    		if(i ==0) continue;
				if(c.indexOf(".d") != -1)
				{
					strDFile~=" ";
					strDFile~=arg;
				}
				else
				{
					strOtherArgs~=" ";
					strOtherArgs~=arg;
				}
    		break;
    	}
	}
 
    if(strDFile == "")
	{
		writeln("Please input *.d file");
		return;
	}

	if(bUseDfl)
	{
		strAddLib = strDflLib~strWinLib;
	}
	
	buildExe();
	
    if(bBuildDfl)
    {
	  buildDFLLib();
	}
}
void buildExe()
{
	string strDmd ="dmd "~strLib;
	string strCommon = strAddLib~strWindow~strDFile~strDebug;
    string buildstr =strDmd~strAddArgsdfl~strImportDfl~strCommon~"\r\n";
	buildstr = bUseDfl ? buildstr :strDmd~strAddArgs~strOtherArgs~strImport~strCommon;
	writeln(buildstr);
 
	StopWatch sw;
	sw.start();
	system(buildstr);
	sw.stop();

	writeln("\nCompile time :" , sw.peek().msecs/1000.0,"secs");
	writeln("End.");
}
void buildDFLLib()
{
	writeln("Err,nothing done,please waiting FrankLIKE to do the work,thank you ...");
}
 
void ShowUsage()
{
	writeln("\n dco written by FrankLIKE.\n");
	writeln("Usage:\n"
		"   dco [<switches...>] <files...>\n\n"
		~" for example: dco app.d \n\n");
	writef("Switches:\n"
		"   -release   Build files's Release version(Default version is 'debug').\n"
		"   -gui       Make a Windows GUI exe without a console(the same to -winexe,-windows).\n"
		"   -lib       Build lib files(Default no dfl_debug.lib).\n"
		"   -dfllib    Build DFL lib files(Default gets dfl_debug.lib).\n"
		"   -all       Build files by args,libs(Default no dfl_debug.lib) in Console.\n"
		"   -arg       Build files by args(-de -w -property -X).\n"
		"   -addlib    Build files by add libs(ole32.lib oleAut32.lib gdi32.lib Comctl32.lib Comdlg32.lib advapi32.lib uuid.lib ws2_32.lib).\n");
} 