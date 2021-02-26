#!/bin/bash
path_pre=$(xdotool getwindowfocus getwindowname | sed -n "s/\/1\/.\+.tex.\+//p")
if [ -z "$path_pre" ]; then 
    #变量为空
    #echo "STRING is empty" 
    zenity --error --text "请在TexStudio软件内正确操作"
    exit
fi

#只输出一行（有时一个图片环境里面有多张图片默认打开编辑第一张图片）
path_suf=$(xclip -out | sed -n "s/^.\+cludesvg.\+]{//p" | head -n 1 | sed "s/}.\+/.svg/" | sed  "s/}$/.svg/")
if [ -z "$path_suf" ]; then 
    #变量为空
    #echo "STRING is empty" 
    zenity --error --text "请选择正确的svg图片相关内容"
    exit
fi

path=$path_pre"/"$path_suf

inkscape $path &
if [ $? -ne 0 ]; then

    zenity --error --text "打开图片失败"
    
    exit

else 
   true
fi


exit
