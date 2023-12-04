-- Setup terminal session shell commands
os.execute("chcp 65001")
os.execute("doskey ls=C:\\Users\\DanielTruong01\\AppData\\Local\\Programs\\Git\\usr\\bin\\ls.exe --color=auto".." $*")
os.execute("doskey l=ls --color=auto".." $*")
os.execute("doskey ll=ls -l --color=auto".." $*")
os.execute("doskey la=ls -la --color=auto".." $*")
