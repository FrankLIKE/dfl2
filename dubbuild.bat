@cls
 
@echo  will get the dfl_debug debug version.....
 
dub  --force

cd dco
dub --force
cd..
cd dflexe
dub --force
cd..
@pause
