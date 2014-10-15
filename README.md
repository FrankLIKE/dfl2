dfl2
====
dfl2 is the GUI controls on windows,which is based on D2 ,now D2.066.

linker libs:
====
ole32.lib oleAut32.lib gdi32.lib Comctl32.lib Comdlg32.lib advapi32.lib uuid.lib ws2_32.lib.

The latest features:
====
1、dfl can be used in Visual Studio .net (here VS 2010)， whose intellisense will help you very well(to look at the Screenshot).

2、dfl can be used in DUB. 

How to get the libs or exe files:
====
1、Open the dfl.sln, and run the projects to get them in 'debug' folder and 'release' folder.

2、Double click the cmd.exe, and input 'build.bat' to get them in 'debug' folder and 'release' folder.



New thing(only for test):  dflexe.exe 

'dflexe.exe' can create the batch processing info ,like the old the 'dfl.exe':

How to use the 'dflexe':
====  
  dflexe app.d


  Screenshot:
====
  ![dfl's intellisense in VS2010](https://raw.githubusercontent.com/FrankLIKE/dfl2/master/Images/dflpart.png)

