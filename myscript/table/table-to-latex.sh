#!/bin/bash


#storedic="/home/shui/Desktop/秋季讲义/table"
#storedic="/home/shui/Desktop/化学讲义/table"
#storedic="/home/shui/Desktop/物理讲义/table"
#storedic="/home/shui/Desktop/英语讲义/table"
#storedic="/home/shui/Desktop/高三/提优专题/table"
#storedic="/home/shui/Desktop/高二秋季/习题/高二秋季/table"
#storedic="/home/shui/Desktop/高一秋季/习题/高一秋季/table"
#storedic="/home/shui/Desktop/语文讲义/table"
#storedic="/home/shui/Desktop/初中-英语-中考宝典/文档化/table"


#自动获取路径
path_pre=$(xdotool getwindowfocus getwindowname | sed -n "s/\/1\/.\+.tex.\+//p")
if [ -z "$path_pre" ]; then 
    #变量为空
    #echo "STRING is empty" 
    zenity --error --text "请在TexStudio软件内正确操作"
    exit
fi



storedic=$path_pre"/table"

mkdir -p /tmp/baidu-table-ocr

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

cd /tmp/baidu-table-ocr/

filename=$(cat ~/.config/baidu-ocr/name.backup | head -n 1)
ssconvert --export-type=Gnumeric_html:latex $filename.gnumeric $filename.tex
if [ $? -ne 0 ]; then

    zenity --error --text "表格处理错误"
    
    exit

else 
   true
fi
#应对多样的文件名，采用新方法
#name1=$(sed -n '1p' "$storedic/name.txt")
#name=${name1:0:3} 去除末尾的换行

#name=$(sed -n '1p' "$storedic/name.txt" | perl -pe 'chomp if eof')

name=$(sed -n '1p' "$storedic/name.txt" | xargs echo -n)
#echo -e "$name\c" | xsel -b | echo 123
echo -e "$name\c" | xclip -selection clipboard | echo 123
sed -i '1d' "$storedic/name.txt"
mv $filename.tex "$storedic/$name.tex"
#rm table.xml
#rm table.ods
zenity --error --text "表格转换完成"
exit

exit
