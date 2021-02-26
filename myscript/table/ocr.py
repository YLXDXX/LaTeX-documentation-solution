# coding:utf-8
import urllib, urllib2, base64
import sys
from os.path import expanduser #使用Home目录

tokenfile_path = expanduser("~/.config/baidu-ocr/token.txt")

#The with statement automatically closes the file again when the block ends.
with open(tokenfile_path) as tokenfile: 
    access_token = tokenfile.readline().strip() 

url = 'https://aip.baidubce.com/rest/2.0/solution/v1/form_ocr/request?access_token=' + access_token
# 二进制方式打开图文件
f = open(sys.argv[1], 'rb')
# 参数image：图像base64编码
img = base64.b64encode(f.read())
params = {"image": img}
params = urllib.urlencode(params)
request = urllib2.Request(url, params)
request.add_header('Content-Type', 'application/x-www-form-urlencoded')
response = urllib2.urlopen(request)
content = response.read()

if (content):
    print(content)
