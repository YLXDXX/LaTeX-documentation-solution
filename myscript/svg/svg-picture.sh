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



cd /tmp
xclip -selection clipboard -t image/png -o > picture.png #不能在这一步判断图像是否获取成功
convert picture.png picture.pnm
#为了增强效果提高细节，进一步采取了锐化和Gama变换
#convert picture.png  -sharpen 6 -level 60%,99% picture.pnm #无水印时采用
#convert picture.png -level 1%,94% picture.pnm #无水印时采用
#采用颜色替换的方法处理水印
convert picture.png -alpha set -channel RGBA -fuzz 9% -fill "rgb(255,255,255)" -opaque "rgb(216,216,216)" picture.pnm
if [ $? -ne 0 ]; then

    zenity --error --text "剪贴板获取图片错误"
    
    exit

else 
   true
fi
#图片转svg
#cat picture.pnm | mkbitmap | potrace -o picture.svg -b svg

#下面这个是为数学高斯讲义专门配置的参数，一般情况下采用上面默认即可
#其中-t参数为：set threshold for bilevel conversion (default 0.45) 设置阀值，-f参数：- apply highpass filter with radius n (default 4) 设置自动挖空的半径大小
#cat picture.pnm | mkbitmap -t 0.38 -f 5.4 | potrace -o picture.svg -b svg --group --tight #数学高斯讲义专用
#用上面的阀值方法处理有点暴力，上面利用颜色替换进行处理，保留更多细节
cat picture.pnm | mkbitmap -f 5.4 | potrace -o picture.svg -b svg --group --tight
if [ $? -ne 0 ]; then

    zenity --error --text "图片处理出错"
    
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
mv picture.svg "$storedic/$name.svg"
#deepin-image-viewer "$storedic/$name.svg"
#gpicview "$storedic/$name.svg"
geeqie "$storedic/$name.svg"
zenity --question --text "是否编辑?"
if [ $? -ne 0 ]; then
    
    exit

else 
   inkscape "$storedic/$name.svg"
fi

exit

exit
