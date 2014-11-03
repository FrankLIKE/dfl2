@cls
 
@echo  will get the  dfl debug and release version.....

cd dco\source
dmd dco.d -release
dco
cd..
cd..
cd source 
dco -lib -debug -c
dco -lib -release -c
cd..
cd dflexe
dco -con -release -c
cd..
cd example
dco
app
cd..
@pause
