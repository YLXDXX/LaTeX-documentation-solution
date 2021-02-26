# Enter script code
system.exec_command("xkill -id `xprop -root _NET_ACTIVE_WINDOW | cut -d\# -f2` | echo 123")