#!/usr/bin/zsh

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



cd /tmp
xclip -selection clipboard -t image/png -o > color-picture.png  #不能在这一步判断图像是否获取成功

#下面的90%是去除图片的底色的杂色(最暗的1%转为黑色，最亮的%10转为白色)   
convert color-picture.png -level 1%,94% color-change-picture.png 
if [ $? -ne 0 ]; then

    zenity --error --text "剪贴板获取图片错误"
    
    exit

else 
   true
fi

#上面的转换太粗暴，对于彩色图片而言会导致颜色的损失(颜色变淡)，采用下面的(保护颜色)
#转换成透明的背景
#convert color-picture.png -fuzz 6% -transparent white color-change-picture.png
#若不转化关闭alpha通道，彩色部分的识别会出问题
#convert color-change-picture.png -background white -alpha remove -alpha off color-change-picture.png

#图片转svg
#cat picture.pnm | mkbitmap | potrace -o picture.svg -b svg

#下面这个是为数学高斯讲义专门配置的参数，一般情况下采用上面默认即可
#其中-t参数为：set threshold for bilevel conversion (default 0.45) 设置阀值，-f参数：- apply highpass filter with radius n (default 4) 设置自动挖空的半径大小

python3 ~/.config/autokey/myscript/svg/color_trace-master/color_trace_multi.py -i color-change-picture.png -o color-picture.svg -c 7  -s -D 10 
if [ $? -ne 0 ]; then #此处判断有问题，使用 -ne 判断（不等于）不能正确识别，原因未知，改为相等

    zenity --error --text "图片处理出错" #不能在命令后面使用 | echo 123
    
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
mv color-picture.svg "$storedic/$name.svg"
#deepin-image-viewer "$storedic/$name.svg"
#zenity --question --text "是否编辑?"
#if [ $? -ne 0 ]; then
#    
#    exit
#
#else 
   inkscape "$storedic/$name.svg" &
#fi

echo 123

exit

