dfl2
====
dfl2 is a GUI library for windows,which is based on D2 ,now D2.066.

linker libs:
---
ole32.lib oleAut32.lib gdi32.lib Comctl32.lib Comdlg32.lib advapi32.lib uuid.lib ws2_32.lib.

The latest features:
---
1、dfl can be used in Visual Studio .net (here VS 2010)， whose intellisense will help you very well(to look at the Screenshot).

2、dfl can be used in DUB:

3、dfl can be build by dco.

How to get the libs or exe files:
---
1、Double click the 'dcobuild.bat', and input 'dcobuild.bat',to get them in the folder.

2、dub fetch dfl2 --local and run the dubbuild.bat in the path, to get them in 'debug' folder and 'release' folder.
   or 
     dub fetch dfl2,and run the dubbuild.bat in the path(C:\Users\[yourUserName]\AppData\Roaming\dub\packages\dfl2-1.0.3)

3、Open the dfl.sln, and run the projects to get them in 'debug' folder and 'release' folder(Now,auto copy to the '$(DMDInstallDir)windows\lib' OR 'bin' folder ).
	 
note:  If you want to get the release version ,use dcobuild.bat. or vs2010 please.
---

New thing :  dco.exe
---
'dco.exe' can create the batch processing info :

How to use the 'dco':
--- 
  dco app.d

  dco app.d -gui

Now can debug in VD 0.3.39
---

  Screenshot:
---
   in dco:

  ![dfl2 In dco](https://raw.githubusercontent.com/FrankLIKE/dfl2/master/Images/dco_build.png)

   in DUB:

  ![dfl2 In DUB](https://raw.githubusercontent.com/FrankLIKE/dfl2/master/Images/dub_build.png)
   
   in VS2010

  ![dfl's intellisense in VS2010](https://raw.githubusercontent.com/FrankLIKE/dfl2/master/Images/dflpart.png)

