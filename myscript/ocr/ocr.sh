#!/bin/bash
#最上面一句声明所用的解释器
#使用 exit trap 能保证脚本不管在什么情况下退出都会调用注册的清理函数。
trap 'rm -rf "$directory" ' EXIT
#mktemp生成临时文件
directory=$(mktemp -d)|| exit 1

#获取当前执行文件的绝对路径
basepath=$(cd `dirname $0`; pwd)

cd $directory

xclip -selection clipboard -t image/png -o > ocr.png
size=$(ls -l "ocr.png" | awk '{ print $5 }')
if [ "$size" -gt "906" ] 
then

    #python2 ocr.py ocr.png | jq ".words_result[].words" | sed 's/^"//' | sed 's/"$//' | xclip -selection clipboard
    python2 $basepath/ocr.py ocr.png | jq ".words_result[].words" | sed 's/^"//' | sed 's/"$//' | xsel -b | echo 123
    
    zenity --info --text "文本内容已复制到剪贴板"
    
    exit

else 
   zenity --error --text "请将图片复制到剪贴板"
   
    exit
fi
#find *.jpg > info.txt

#imabase64=$(base64 "/home/shui/Desktop/a12.png")  

#echo '$imabase64' |tr -d '\n' |od -An -tx1|tr ' ' %
#curl -s -o /dev/null -w %{url_effective} --get --data-urlencode "image=$imabase64" ""

#urlencode $imabase64

#curl -i -k -H 'Content-Type:application/x-www-form-urlencoded' --data-urlencode "image=$imabase64"  'https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic?access_token=24.f41e38fd6209de06fa788993a2540e53.2592000.1569646294.282335-16688699'

#| grep "words_result" | jq ".words_result[].words" | sed 's/^"//' | sed 's/"$//' >> 123.txt

#exit
#imabase64=$(base64 "/home/shui/Desktop/1/$line")

#curl -s -i -k 'https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic?access_token=24.f41e38fd6209de06fa788993a2540e53.2592000.1569646294.282335-16688699' --data-urlencode "image=$imabase64" -H 'Content-Type:application/x-www-form-urlencoded' | grep "words_result" | jq ".words_result[].words" | sed 's/^"//' | sed 's/"$//' >> 123.txt
#python2 /home/shui/Desktop/1/ocr.py /home/shui/Desktop/1/a17.jpg | jq ".words_result[].words" | sed 's/^"//' | sed 's/"$//'

#cat info.txt|while read line; do

#python2 ocr.py ocr.png | jq ".words_result[].words" | sed 's/^"//' | sed 's/"$//' >> ocr.txt


#done

#rm info.txt

exit

