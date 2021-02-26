#!/bin/bash


#storedic="/home/shui/Desktop/语文讲义/picture/svg"
#storedic="/home/shui/Desktop/物理讲义/picture/svg"
#storedic="/home/shui/Desktop/化学讲义/picture/svg"
#storedic="/home/shui/Desktop/秋季讲义/picture/svg"
#storedic="/home/shui/Desktop/英语讲义/picture/svg"
#storedic="/home/shui/Desktop/高一秋季/习题/高一秋季/picture/svg"
#storedic="/home/shui/Desktop/高二秋季/习题/高二秋季/picture/svg"
#storedic="/home/shui/Desktop/高三/提优专题/picture/svg"
#storedic="/home/shui/Desktop/学而思秘籍-初中物理-培优课堂练习-八年级/文档化/picture/svg"

#自动获取路径
path_pre=$(xdotool getwindowfocus getwindowname | sed -n "s/\/1\/.\+.tex.\+//p")
if [ -z "$path_pre" ]; then 
    #变量为空
    #echo "STRING is empty" 
    zenity --error --text "请在TexStudio软件内正确操作"
    exit
fi



storedic=$path_pre"/picture/svg"





#name=$(sed -n '1p' "$storedic/name.txt" | perl -pe 'chomp if eof')
name=$(sed -n '1p' "$storedic/name.txt" | xargs echo -n)
cp ~/.config/autokey/myscript/svg/plain.svg "$storedic/$name.svg"
if [ $? -ne 0 ]; then

    zenity --error --text "图片创建出错"
    
    exit

else 
   true
fi
echo -e "$name\c" | xclip -selection clipboard | echo 123
sed -i '1d' "$storedic/name.txt"

inkscape "$storedic/$name.svg" & 

exit

exit
