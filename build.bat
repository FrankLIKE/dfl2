@cls
 
@echo  will get the dfl_debug debug version.....
 
dub  --force

cd source\dco
dub --force
cd..
cd..
cd othersource\dflexe
dub --force
cd..
cd..
@echo  dflexe will not use again.....
@pause
