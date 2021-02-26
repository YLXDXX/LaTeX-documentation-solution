#!/bin/bash

#获取当前执行文件的绝对路径
basepath=$(cd `dirname $0`; pwd)


#获取token

access_token=$(cat ~/.config/baidu-ocr/token.txt | head -n 1)



cd $basepath

request_id=$(cat manual_info.txt | head -n 1)

#curl -i -k -H 'Content-Type:application/x-www-form-urlencoded' --data-urlencode "request_id=$request_id" 'https://aip.baidubce.com/rest/2.0/solution/v1/form_ocr/get_request_result?access_token=24.78536786cbd8e14b3a15cb0e54155040.2592000.1590973958.282335-16688699' | grep "result" | jq ".result.result_data" | sed 's/^"//' | sed 's/"$//' | xclip -selection clipboard 

curl -i -k -H 'Content-Type:application/x-www-form-urlencoded' --data-urlencode "request_id=$request_id" "https://aip.baidubce.com/rest/2.0/solution/v1/form_ocr/get_request_result?access_token=$access_token" | grep "result" | jq ".result.result_data" | sed 's/^"//' | sed 's/"$//'  | xclip -selection clipboard | echo 123


exit










