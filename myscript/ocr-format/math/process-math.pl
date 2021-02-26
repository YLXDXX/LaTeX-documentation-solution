#!/usr/bin/perl
use utf8;#告诉perl，源码以utf8的方式编写
use strict;#让Perl编译器以严格的态度对待Perl程序
use warnings;#显示一些警告和错误
#Perl中可以通过反引号来执行操作系统中的命令
#$var=`date +"%F %T"`

use autodie;

=pod
多行注释
=cut

#所有标准输出都以UTF8的形式进行
#避免Wide character in print的输出警告
use open ':std', ':encoding(UTF-8)';
#上面那句话等于下面三句话
#binmode STDIN,  ':encoding(UTF-8)';
#binmode STDOUT, ':encoding(UTF-8)';
#binmode STDERR, ':encoding(UTF-8)';


#读取文件内容到相应的变量
#需要安装相应模块：perl -e'use CPAN; install "File::Slurper"'
use File::Slurper 'read_text';
#使用例如：my $contents = read_text("$my_name");

#其中find发现的文件名乱码，需要以utf-8的形式解码，才能正常使用
use Encode qw(decode encode);
#使用方法
#$characters = decode('UTF-8', $octets,     Encode::FB_CROAK);
#$octets     = encode('UTF-8', $characters, Encode::FB_CROAK);

#查找文件模块
#use File::Find;

#剪贴板模块
use Clipboard;



#获取剪贴板内容,以UTF-8格式编码

#my $contents=decode('UTF-8',Clipboard::paste,); #此处剪贴板有点问题，剪贴板存在几个

my $contents=`xclip -selection c -o`;

if(!$contents) {
   system 'zenity --error --text "剪贴板没有内容"';
   exit 1;
}




#去除行尾的换行
#chomp $contents;

#print "$contents read";

#正则匹配
#$contents =~ m/规则/模式;



#处理匹配的结果
$contents =~ s/^ +| +$//gm;  # 去除行首和行尾空白
$contents =~ s/\t//gm;


#简单修正

$contents =~ s/В/B/g;
$contents =~ s/А/A/g;
$contents =~ s/С/C/g;
$contents =~ s/^\([A-D]\):/${1}\./gm;
$contents =~ s/c:/C\./g;
$contents =~ s/\$\\quad\(\\quad\)\$$/ \\xzanswer{} /gm;
$contents =~ s/\$\\quad\$//g;
$contents =~ s/\$\(\\quad\)\$$/ \\xzanswer{} /gm;
$contents =~ s/\$ \\quad/\$ /g;
$contents =~ s/\$\\quad/\$/g;
$contents =~ s/\\mathrm\{\~?([a-zA-Z]+)\}/${1}/g;
$contents =~ s/^([A-D]\.)([0-9\(\)\[\],\.\+\- \{\}\\\\]+)$/${1}\$ ${2} \$/gm;

$contents =~ s/（）$/ \\xzanswer{} /gm;
$contents =~ s/[（\(]$/ \\xzanswer{} /gm;
$contents =~ s/^[（）\(\)]+$//gm;

$contents =~ s/ +/ /gm;



$contents =~ s/^\$([0-9]+) ?\.\$/${1}\./gm;
$contents =~ s/^([0-9]+\.) ?\$\(20.+(模拟|调研|期中|期末|联考|调|检|诊|卷|题|模|测)[\)）]/${1}/gm;
$contents =~ s/^([0-9]+\.) ?\$\\left\(20.+(模拟|调研|期中|期末|联考|调|检|诊|卷|题|模|测)[\)）]/${1}/gm;
$contents =~ s/^([0-9]+\.) ?[\(（].+(模拟|调研|期中|期末|联考|调|检|诊|卷|题|模|测)[\)）]/${1}/gm;


#纠错
$contents =~ s/(粗圆|标圆|傾圆|植圆|稍圆|陈圆|糊圆)/椭圆/gm;

$contents =~ s/(劣物线)/抛物线/gm;



#空行处理
$contents =~ s/^([0-9]+\.)/\n\n${1}/gm;
$contents =~ s/^(A\.)/\n${1}/gm;


#添加尾部空行
$contents =~ s/\Z/\n\n/m;


#发送到剪贴板

Clipboard->copy_to_all_selections($contents);



exit;


