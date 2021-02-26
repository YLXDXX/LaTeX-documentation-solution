#!/bin/bash

#storedic="/home/shui/Desktop/秋季讲义/table"
#storedic="/home/shui/Desktop/化学讲义/table"
#storedic="/home/shui/Desktop/物理讲义/table"
#storedic="/home/shui/Desktop/英语讲义/table"
#storedic="/home/shui/Desktop/高三/提优专题/table"
#storedic="/home/shui/Desktop/高二秋季/习题/高二秋季/table"
#storedic="/home/shui/Desktop/高一秋季/习题/高一秋季/table"
#storedic="/home/shui/Desktop/2020七年级英语暑假班/table"

#自动获取路径
path_pre=$(xdotool getwindowfocus getwindowname | sed -n "s/\/1\/.\+.tex.\+//p")
if [ -z "$path_pre" ]; then 
    #变量为空
    #echo "STRING is empty" 
    zenity --error --text "请在TexStudio软件内正确操作"
    exit
fi

#存储路径
storedic=$path_pre"/table"

#生成临时文件夹
mkdir -p  /tmp/baidu-table-ocr
directory="/tmp/baidu-table-ocr"


cd $directory


name=$RANDOM #用随机名称，不再指定

<<'COMMENT'
...


cd /tmp
xclip -o -target 'XML Spreadsheet' -selection clipboard > table.xml
if [ $? -ne 0 ]; then

    zenity --error --text "剪贴板获取表格错误"
    
    exit

else 
   true
fi
libreoffice --convert-to ods table.xml
COMMENT


#新建表格复制
cp ~/.config/autokey/myscript/table/new.gnumeric "$name.gnumeric"

#gnumeric打开
gnumeric "$name.gnumeric" & 



#名字备份，供后面转LaTex表格用
echo "$name" > ~/.config/baidu-ocr/name.backup
if [ $? -ne 0 ]; then

    zenity --error --text "表格名称备份错误"
    
    exit

else 
   true
fi
#应对多样的文件名，采用新方法
#name1=$(sed -n '1p' "$storedic/name.txt")
#name=${name1:0:3} 去除末尾的换行

#name=$(sed -n '1p' "$storedic/name.txt" | perl -pe 'chomp if eof')
#name=$(sed -n '1p' "$storedic/name.txt" | xargs echo -n)
#echo -e "$name\c" | xsel -b | echo 123
#echo "$name\c" | xclip -selection clipboard | echo 123
#sed -i '1d' "$storedic/name.txt"
#mv table.tex "$storedic/$name.tex"
#rm table.xml
#rm table.ods
#zenity --error --text "表格转换完成"
exit

exit
