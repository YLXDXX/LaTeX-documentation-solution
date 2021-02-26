#!/bin/bash
mkdir -p  ~/.config/baidu-ocr
curl -i -k 'https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=你的帐号&client_secret=你的密码' | grep "access_token" | jq ".access_token" | sed 's/^"//' | sed 's/"$//' > ~/.config/baidu-ocr/token.txt

#| tr '\n' ' ' |  xclip -selection clipboard
