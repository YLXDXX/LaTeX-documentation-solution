#!/bin/bash
#最上面一句声明所用的解释器
#使用 exit trap 能保证脚本不管在什么情况下退出都会调用注册的清理函数。
trap 'rm -f "$all" "$name" "$title" "$quotes" "$filename" "$test" ' EXIT
#mktemp生成临时文件
all=$(mktemp -t poem.XXXX)|| exit 1
name=$(mktemp -t poem.XXXX)|| exit 1
title=$(mktemp -t poem.XXXX)|| exit 1
quotes=$(mktemp -t poem.XXXX)|| exit 1
filename=$(mktemp -t poem.XXXX)|| exit 1
test=$(mktemp -t poem.XXXX)|| exit 1
#创建文件夹
mkdir -p poem-name
mkdir -p poem-title
mkdir -p poem-quotes

#名字生成
seq -f "poem-%04g" 1 9999 > $filename

#设置第一个参数默认值
number=${1:-"3"}
#随机诗句生成
shuf -n $number poem.csv -o $all
#名字、标题、名句
csvtool -t TAB col 1 $all -o $name
csvtool -t TAB col 2 $all -o $title
csvtool -t TAB col 3 $all -o $quotes

for((i=1;i<=$number;i++));  
do  
lastname=$(sed -n "${i}p" "$filename" | xargs echo -n);
crename=$(sed -n "${i}p" "$name" | xargs echo -n);
cretitle=$(sed -n "${i}p" "$title" | xargs echo -n);
crequotes=$(sed -n "${i}p" "$quotes" | xargs echo -n);
lengthname=$(echo "${#crename}*5.19"|bc);
lengthtitle=$(echo "${#cretitle}*5.19"|bc);
lengthquotes=$(echo "${#crequotes}*5.19"|bc);

#/dev/null：可以理解为linux下的回收站；

#通过符号“>”把标准输出进行重定向；

#2>&1：是把出错输出也重定向输出；

cat 2.svg | sed "s/秋/$crename/;s/5.19/$lengthname/;" > $test;
inkscape -p $test -D -o poem-name/$lastname.pdf > /dev/null 2>&1 ;

cat 2.svg | sed "s/秋/$cretitle/;s/5.19/$lengthtitle/;" > $test;
inkscape -p $test -D -o poem-title/$lastname.pdf > /dev/null 2>&1;

cat 2.svg | sed "s/秋/$crequotes/;s/5.19/$lengthquotes/;" > $test;
inkscape -p $test -D -o poem-quotes/$lastname.pdf > /dev/null 2>&1;


done




#echo "Our temp file is $all $name  $title $quotes $filename $test"


