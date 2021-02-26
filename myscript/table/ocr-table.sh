#!/bin/bash
#最上面一句声明所用的解释器

#生成临时文件夹
mkdir -p  /tmp/baidu-table-ocr
directory="/tmp/baidu-table-ocr"

#获取当前执行文件的绝对路径
basepath=$(cd `dirname $0`; pwd)

#获取token

access_token=$(cat ~/.config/baidu-ocr/token.txt | head -n 1)


cd $directory

xclip -selection clipboard -t image/png -o > table.png
size=$(ls -l "table.png" | awk '{ print $5 }')
if [ "$size" -gt "905" ] 
then

    request1_id=$(python2 $basepath/ocr.py table.png | jq ".result[].request_id" | sed 's/^"//' | sed 's/"$//') 
    
    echo "$request1_id" > $basepath/manual_info.txt
    
    #request_id=$(cat manual_info.txt | head -n 1)
    
    #request_id="16688699_1170737"
    
    #sleep 1s
    
    #echo "$request_id"
sleep 7s
#curl -i -k -H 'Content-Type:application/x-www-form-urlencoded' --data-urlencode "request_id=16688699_1211633" 'https://aip.baidubce.com/rest/2.0/solution/v1/form_ocr/get_request_result?access_token=24.92f92695baf0dfd5c228bac5868af59b.2592000.1574921658.282335-16688699'

address=$(curl -i -k -H 'Content-Type:application/x-www-form-urlencoded' --data-urlencode "request_id=$request1_id" "https://aip.baidubce.com/rest/2.0/solution/v1/form_ocr/get_request_result?access_token=$access_token" | grep "result" | jq ".result.result_data" | sed 's/^"//' | sed 's/"$//')
#name1=$(sed -n '1p' "$basepath/name.txt")
name=$RANDOM #用随机名称，不再指定
#echo $address $request1_id a2.txt
curl -o "$name.xls" $address

#echo "curl -o $name.xls $address" > /home/shui/Desktop/898989.txt

#表格格式转换
ssconvert --export-type=Gnumeric_XmlIO:sax "$name.xls" "$name.gnumeric"

#/usr/bin/et "$name.xls" & #wps打开
#gnumeric打开
gnumeric "$name.gnumeric" & 

#名字备份，供后面转LaTex表格用
echo "$name" > ~/.config/baidu-ocr/name.backup

#sed -i '1d' "$basepath/name.txt"
   #echo "$res"
   
   #echo "$res" | xclip -selection clipboard
    
    #curl -i -k -H 'Content-Type:application/x-www-form-urlencoded' --data-urlencode "request_id=16688699_1172635"  'https://aip.baidubce.com/rest/2.0/solution/v1/form_ocr/get_request_result?access_token=24.ebf2702f1de333874074dc5a239e7b4b.2592000.1572245765.282335-16688699' | grep "result" | jq ".result.result_data" | sed 's/^"//' | sed 's/"$//' | xclip -selection clipboard
    
    #bash /home/shui/Desktop/study/ocr/shui/table/1.sh

    #echo shui | xsel -b |  | echo 123
    
    #echo shui | xclip -selection clipboard | echo 123
    
    #zenity --info --text "表格下载地址已复制到剪贴板"
    echo 123
    
    exit
exit

else 

   zenity --error --text "请将表格图片复制到剪贴板"
   
    exit
fi


exit



