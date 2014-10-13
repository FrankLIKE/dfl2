@cls
 
@echo  will get the dfl debug version.....
 

dub --config=dfl_debug  --force
 
@echo  press any key ,will get the dfl Release version.....
@pause

dub --config=dfl  --force --build=release
dub --config=dflexe --force --build=release

@pause