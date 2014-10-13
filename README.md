dfl2
====
dfl2 is the gui controls on windows,it is based the D2 ,Now is D2.066.

the dfl.lib linker libs:ole32.lib oleAut32.lib gdi32.lib Comctl32.lib Comdlg32.lib advapi32.lib uuid.lib ws2_32.lib.

Now dfl can be used in Visual Studio .net,here is VS 2010. 

You can get the lib files by :

1、Open the dfl.sln,run the projects，get the libs and exe in 'debug' folder and 'release' folder.

2、Open the cmd.exe , input 'build.bat',then will get the 'debug' folder and 'release' folder,yours libs and exe in there. 

the dflexe.exe can get the bat file ,like the old the 'dfl.exe':

You can use it like :
  
  dflexe app.d

