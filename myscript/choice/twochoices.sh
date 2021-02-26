#!/bin/bash
content=`xclip -out`
contentD=`xclip -out | grep -o -E 'D\..+$'`
if [ -z "$content" ]; then 
    #变量为空
    #echo "STRING is empty" 
    zenity --error --text "未选择任何内容"
    exit
fi

if [ -n "$contentD" ]; then 
    #变量为空
    #echo "STRING is empty" 
    zenity --error --text "有四个选项"
    exit
fi



#content=$(cat 321.txt)sed 's/^A\. \+\([a-zA-z]\)/A\.\1/'

choA=$(xclip -out | grep -o -E 'A\..+B\.' | sed 's/^A\. \+\(.\)/A\.\1/;s/^A\.//g;s/B\.$//g;s/ \{2,9\}/ /g;s/ $//')
#判断变量是否为空
if [ -z "$choA" ]; then 
    #变量为空
    #echo "STRING is empty" 
    choA=$(xclip -out | grep -o -E 'A\..+$' | sed 's/^A\. \+\(.\)/A\.\1/;s/^A\.//g;s/ \{2,9\}/ /g;s/ $//')
fi

if [ -z "$choA" ]; then 
    #变量不为空
    #echo "STRING is not empty" 
    zenity --error --text "A选项获取失败"
    exit
fi

choB=$(xclip -out | grep -o -E 'B\..+C\.' | sed 's/^B\. \+\(.\)/B\.\1/;s/^B\.//g;s/C\.$//g;s/ \{2,9\}/ /g;s/ $//')
#判断变量是否为空
if [ -z "$choB" ]; then 
    #变量为空
    #echo "STRING is empty" 
    choB=$(xclip -out | grep -o -E 'B\..+$' | sed 's/^B\. \+\(.\)/B\.\1/;s/^B\.//g;s/ \{2,9\}/ /g;s/ $//')
fi

if [ -z "$choB" ]; then 
    #变量为空
    #echo "STRING is empty" 
    choC=$(xclip -out | grep -o -E 'B\..+$' | sed 's/^C\. \+\(.\)/C\.\1/;s/^C\.//g;s/ \{2,9\}/ /g;s/ $//')
fi

if [ -z "$choB" ]; then 
    #变量不为空
    #echo "STRING is not empty" 
    zenity --error --text "B选项获取失败"
    exit
fi

#echo -e "清空剪贴板" | xclip -selection clipboard
#echo -e "\\\twochoices\n{$choA}\n{$choB}" | xclip -selection clipboard
echo -e "\\\twochoices\n{$choA}\n{$choB}" | xsel -b
echo ok
#conterw=$(echo -e "\\\fourchoices\n{$choA}\n{$choB}\n{$choC}\n{$choD}")
#自动填写内容
#windowid=$(xdotool getwindowfocus)
#sleep 0.1 && xdotool windowactivate --sync $windowid type "$conterw"
#xdotool key ctrl+alt+m
#sleep 0.065 &&xdotool windowactivate --sync $windowid key ctrl+v
exit
exit

choC=$(xclip -out | grep -o -E 'C\..+D\.' | sed 's/^C\. \+\(.\)/C\.\1/;s/^C\.//g;s/D\.$//g;s/ \{2,9\}/ /g;s/ $//')
#判断变量是否为空
if [ -z "$choC" ]; then 
    #变量为空
    #echo "STRING is empty" 
    choC=$(xclip -out | grep -o -E 'C\..+$' | sed 's/^C\. \+\(.\)/C\.\1/;s/^C\.//g;s/ \{2,9\}/ /g;s/ $//')
fi

if [ -z "$choC" ]; then 
    #变量不为空
    #echo "STRING is not empty" 
    zenity --error --text "C选项获取失败"
    exit
fi

echo -e "\\\threechoices\n{$choA}\n{$choB}\n{$choC}" | xclip -selection clipboard

exit
exit


choD=$(xclip -out | grep -o -E 'D\..+$' | sed 's/^D\. \+\(.\)/D\.\1/;s/^D\.//g;s/ \{2,9\}//g;s/ $//')
#判断变量是否为空
if [ -z "$choD" ]; then 
    #变量不为空
    #echo "STRING is not empty" 
    zenity --error --text "D选项获取失败"
    exit
fi






