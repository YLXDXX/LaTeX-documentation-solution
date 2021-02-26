#!/bin/bash
content=`xclip -out`

if [ -z "$content" ]; then 
    #变量为空
    #echo "STRING is empty" 
    zenity --error --text "未选择任何内容"
    exit
fi



#content=$(cat 321.txt)sed 's/^A\. \+\([a-zA-z]\)/A\.\1/'

choA=$(xclip -out | sed '1!d' | sed 's/\\/\\\\/g;')
#判断变量是否为空
if [ -z "$choA" ]; then 
    #变量为空
    #echo "STRING is empty" 
    choA=$(xclip -out | grep -o -E 'A\..+$' | sed 's/^A\. \+\(.\)/A\.\1/;s/^A\.//g;s/ \{2,9\}/ /g;s/ $//;s/\\qquad//g;s/\\/\\\\/g;s/^	\+//;s/ \+$//')
fi

if [ -z "$choA" ]; then 
    #变量不为空
    #echo "STRING is not empty" 
    zenity --error --text "A选项获取失败"
    exit
fi

choB=$(xclip -out | sed '2!d' | sed 's/\\/\\\\/g;')
#判断变量是否为空
if [ -z "$choB" ]; then 
    #变量为空
    #echo "STRING is empty" 
    choB=$(xclip -out | grep -o -E 'B\..+$' | sed 's/^B\. \+\(.\)/B\.\1/;s/^B\.//g;s/ \{2,9\}/ /g;s/ $//;s/\\qquad//g;s/\\/\\\\/g;s/^	\+//;s/ \+$//')
fi

if [ -z "$choB" ]; then 
    #变量不为空
    #echo "STRING is not empty" 
    zenity --error --text "B选项获取失败"
    exit
fi

choC=$(xclip -out | sed '3!d' | sed 's/\\/\\\\/g;')
#判断变量是否为空
if [ -z "$choC" ]; then 
    #变量为空
    #echo "STRING is empty" 
    choC=$(xclip -out | grep -o -E 'C\..+$' | sed 's/^C\. \+\(.\)/C\.\1/;s/^C\.//g;s/ \{2,9\}/ /g;s/ $//;s/\\qquad//g;s/\\/\\\\/g;s/^	\+//;s/ \+$//')
fi

if [ -z "$choC" ]; then 
    #变量不为空
    #echo "STRING is not empty" 
    zenity --error --text "C选项获取失败"
    exit
fi

choD=$(xclip -out | sed '4!d' | sed 's/\\/\\\\/g;')
#判断变量是否为空
if [ -z "$choD" ]; then 
    #变量不为空
    #echo "STRING is not empty" 
    zenity --error --text "D选项获取失败"
    exit
fi

#echo -e "清空剪贴板" | xclip -selection clipboard
#echo -e "\\\fourchoices\n{$choA}\n{$choB}\n{$choC}\n{$choD}" | xclip -selection clipboard
echo -e "\\\fourchoices\n{$choA}\n{$choB}\n{$choC}\n{$choD}" | xsel -b
echo ok
#conterw=$(echo -e "\\\fourchoices\n{$choA}\n{$choB}\n{$choC}\n{$choD}")
#自动填写内容
#windowid=$(xdotool getwindowfocus)
#sleep 0.1 && xdotool windowactivate --sync $windowid type "$conterw"
#xdotool key ctrl+alt+m
#sleep 0.065 &&xdotool windowactivate --sync $windowid key ctrl+v
#echo "\fourchoices{$choA}{$choB}{$choC}{$choD}" | xclip -selection clipboard
exit
exit






