@cls
 
@echo  will get the dfl_debug debug version.....
 
dub --config=dfl_debug  --force
dub --config=dfl  --force --build=release

cd source\dco
dub --force --build=release
cd..
cd..
cd othersource\dflexe
dub --force --build=release
cd..
cd..
@echo  dflexe will not use again.....
@pause
