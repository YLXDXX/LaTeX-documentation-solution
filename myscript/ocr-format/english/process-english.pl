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
#use Encode qw(decode encode);
#使用方法
#$characters = decode('UTF-8', $octets,     Encode::FB_CROAK);
#$octets     = encode('UTF-8', $characters, Encode::FB_CROAK);

#查找文件模块
#use File::Find;



#获取选中内容

chomp(my $keyword=`xclip -selection c -o`);#如果最后有换行符，则去除


if(!$keyword) {
   system 'zenity --error --text "未选择任何内容"';
   exit 1;
}


my $contents;


$contents = $keyword;












#去除行尾的换行
#chomp $contents;

#print "$contents read";

#正则匹配
#$contents =~ m/规则/模式;



#处理匹配的结果

#初步处理
$contents =~ s/\{|\}//gm;
$contents =~ s///gm;#特殊字符，影响编译
$contents =~ s///gm;#特殊字符，影响断行
$contents =~ s/ / /gm;#特殊字符，影响断行
$contents =~ s/ / /gm;#特殊字符，影响断行
$contents =~ s/∶/:/gm;#全角到半角的转换
$contents =~ s/＞/>/gm;
$contents =~ s/＜/</gm;
$contents =~ s/＝/=/gm;
$contents =~ s/\^//gm;
$contents =~ s/_+/ /gm;
$contents =~ s/\&/ \\\& /gm;
$contents =~ s/\$/ \\\$ /gm;
$contents =~ s/\%/ \\\% /gm;
$contents =~ s/([A-D])．/${1}./gm;
$contents =~ s/\Z/\n\n\n/m;
$contents =~ s/^ +| +$//gm;  # 去除行首和行尾空白
$contents =~ s/\t//gm;
$contents =~ s/ +/ /gm;
$contents =~ s/([A-D])．/${1}./gm;



#英文标点符号的处理
$contents =~ s/([,\.\!\?;:\)"])([a-zA-Z0-9])/${1} ${2}/gm;
$contents =~ s/([a-zA-Z0-9])\(/${1} (/gm;
#$contents =~ s/ ?\/ ?/\//gm;
#$contents =~ s/ ?\\ ?/\\\\/gm;
$contents =~ s/([a-zA-Z])([0-9])/${1} ${2}/gm;
$contents =~ s/([0-9])([a-zA-Z])/${1} ${2}/gm;
$contents =~ s/a \(n\)/a(n)/gm;
$contents =~ s/\."/\. "/gm;
$contents =~ s/([0-9])[,:\.] ([0-9])/${1},${2}/gm;#数字纠错
$contents =~ s/\.,/\. ,/gm;
$contents =~ s/\+/ \+ /gm;
$contents =~ s/……/ \$ \\cdots \$ /gm;
$contents =~ s/…\./ \$ \\cdots \$ /gm;
$contents =~ s/…/ \$ \\cdots \$ /gm;
$contents =~ s/=/ = /gm;
$contents =~ s/\’/'/gm;




#题号的处理
$contents =~ s/^\( *\) *([0-9]+)/\n\n${1}/gm;
$contents =~ s/^(\(?\) ?[0-9]+\.)/\n\n${1}/gm;
$contents =~ s/^(练习|单项选择|填空|听力|作业|完型填空|阅读理解|改写|进门考|【答案】)/\n\n${1}/gm;
$contents =~ s/^([0-9]+\.)/\n\n${1}/gm;










#智能纠错机制
$contents =~ s/ +/ /gm;#空格压缩
$contents =~ s/([0-9]) (th|s) /${1}${2} /gm;
$contents =~ s/([0-9]) (th|s)$/${1}${2}/gm;#行尾处理
$contents =~ s/([1-6]) G /${1}G /gm;
$contents =~ s/\( ?([a-zA-Z]+) ?\) G/\(${1}\)/gm;#括号中单词的边界




#水印识别删除
#$contents =~ s/.+pdfstudi.+//gm;
#$contents =~ s/.+tudio.+//gm;
#$contents =~ s/.+qoppa.+//gm;



#选择题生成所需格式
#
#根据实际情况选择是否使用
#
#四个选项选择题匹配
my sub fix_fourchoice_4;#4行选择题
my sub fix_fourchoice_2;#2行选择题
my sub fix_fourchoice_1;#1行选择题

#$contents =~ s/(A\..+\nB\..+\nC\..+\nD\..+)/fix_fourchoice_4($1)/megm;
#$contents =~ s/(A\..+B\..+\nC\..+D\..+)/fix_fourchoice_2($1)/megm;
#$contents =~ s/(A\..+B\..+C\..+D\..+)/fix_fourchoice_1($1)/megm;

#三个选项选择题匹配
my sub fix_threechoice_3;#3行选择题
my sub fix_threechoice_2;#2行选择题
my sub fix_threechoice_1;#1行选择题

#$contents =~ s/(A\..+\nB\..+\nC\..+)/fix_threechoice_3($1)/megm;
#$contents =~ s/(A\..+B\..+\nC\..+)/fix_threechoice_2($1)/megm;
#$contents =~ s/(A\..+B\..+C\..+)/fix_threechoice_1($1)/megm;


#$contents =~ s///gm;




system "echo \"$contents\" | xsel -b ";
system 'zenity --error --text "已复制到剪贴板"';
exit 0;





#定义函数来处理选择题的匹配的结果
sub fix_fourchoice_4
{
#如果只有一个参数可以使用shift
#如果多个参数可以用数组直接引用@_[1]
#也可以列表赋值
#my ($left_value, $operation, $right_value) = @_;
    my $my_contens=shift;
    my $choiceA=$my_contens;
    my $choiceB=$my_contens;
    my $choiceC=$my_contens;
    my $choiceD=$my_contens;
    my $fourchoice;

    $choiceA =~ s/A\.(.+)\nB\..+\nC\..+\nD\..+/${1}/m;
    $choiceA =~ s/^\s+|\s+$//gm;
    $choiceB =~ s/A\..+\nB\.(.+)\nC\..+\nD\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//gm;
    $choiceC =~ s/A\..+\nB\..+\nC\.(.+)\nD\..+/${1}/m;
    $choiceC =~ s/^\s+|\s+$//gm;
    $choiceD =~ s/A\..+\nB\..+\nC\..+\nD\.(.+)/${1}/m;
    $choiceD =~ s/^\s+|\s+$//gm;
    
    $fourchoice="\n\\fourchoices\n{$choiceA}\n{$choiceB}\n{$choiceC}\n{$choiceD}\n";

    return $fourchoice;
}
sub fix_fourchoice_2
{
#如果只有一个参数可以使用shift
#如果多个参数可以用数组直接引用@_[1]
#也可以列表赋值
#my ($left_value, $operation, $right_value) = @_;
    my $my_contens=shift;
    my $choiceA=$my_contens;
    my $choiceB=$my_contens;
    my $choiceC=$my_contens;
    my $choiceD=$my_contens;
    my $fourchoice;

    $choiceA =~ s/A\.(.+)B\..+\nC\..+D\..+/${1}/m;
    $choiceA =~ s/^\s+|\s+$//gm;
    $choiceB =~ s/A\..+B\.(.+)\nC\..+D\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//gm;
    $choiceC =~ s/A\..+B\..+\nC\.(.+)D\..+/${1}/m;
    $choiceC =~ s/^\s+|\s+$//gm;
    $choiceD =~ s/A\..+B\..+\nC\..+D\.(.+)/${1}/m;
    $choiceD =~ s/^\s+|\s+$//gm;
    
    $fourchoice="\n\\fourchoices\n{$choiceA}\n{$choiceB}\n{$choiceC}\n{$choiceD}\n";

    return $fourchoice;
}
sub fix_fourchoice_1
{
#如果只有一个参数可以使用shift
#如果多个参数可以用数组直接引用@_[1]
#也可以列表赋值
#my ($left_value, $operation, $right_value) = @_;
    my $my_contens=shift;
    my $choiceA=$my_contens;
    my $choiceB=$my_contens;
    my $choiceC=$my_contens;
    my $choiceD=$my_contens;
    my $fourchoice;

    $choiceA =~ s/A\.(.+)B\..+C\..+D\..+/${1}/m;
    $choiceA =~ s/^\s+|\s+$//gm;
    $choiceB =~ s/A\..+B\.(.+)C\..+D\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//gm;
    $choiceC =~ s/A\..+B\..+C\.(.+)D\..+/${1}/m;
    $choiceC =~ s/^\s+|\s+$//gm;
    $choiceD =~ s/A\..+B\..+C\..+D\.(.+)/${1}/m;
    $choiceD =~ s/^\s+|\s+$//gm;
    
    $fourchoice="\n\\fourchoices\n{$choiceA}\n{$choiceB}\n{$choiceC}\n{$choiceD}\n";

    return $fourchoice;
}

sub fix_threechoice_3
{
#如果只有一个参数可以使用shift
#如果多个参数可以用数组直接引用@_[1]
#也可以列表赋值
#my ($left_value, $operation, $right_value) = @_;
    my $my_contens=shift;
    my $choiceA=$my_contens;
    my $choiceB=$my_contens;
    my $choiceC=$my_contens;
    my $threechoice;

    $choiceA =~ s/A\.(.+)\nB\..+\nC\..+/${1}/m;
    $choiceA =~ s/^\s+|\s+$//gm;
    $choiceB =~ s/A\..+\nB\.(.+)\nC\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//gm;
    $choiceC =~ s/A\..+\nB\..+\nC\.(.+)/${1}/m;
    $choiceC =~ s/^\s+|\s+$//gm;
    
    
    $threechoice="\n\\threechoices\n{$choiceA}\n{$choiceB}\n{$choiceC}\n";

    return $threechoice;
}
sub fix_threechoice_2
{
#如果只有一个参数可以使用shift
#如果多个参数可以用数组直接引用@_[1]
#也可以列表赋值
#my ($left_value, $operation, $right_value) = @_;
    my $my_contens=shift;
    my $choiceA=$my_contens;
    my $choiceB=$my_contens;
    my $choiceC=$my_contens;
    my $threechoice;

    $choiceA =~ s/A\.(.+)B\..+\nC\..+/${1}/m;
    $choiceA =~ s/^\s+|\s+$//gm;
    $choiceB =~ s/A\..+B\.(.+)\nC\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//gm;
    $choiceC =~ s/A\..+B\..+\nC\.(.+)/${1}/m;
    $choiceC =~ s/^\s+|\s+$//gm;
    
    
    $threechoice="\n\\threechoices\n{$choiceA}\n{$choiceB}\n{$choiceC}\n";

    return $threechoice;
}
sub fix_threechoice_1
{
#如果只有一个参数可以使用shift
#如果多个参数可以用数组直接引用@_[1]
#也可以列表赋值
#my ($left_value, $operation, $right_value) = @_;
    my $my_contens=shift;
    my $choiceA=$my_contens;
    my $choiceB=$my_contens;
    my $choiceC=$my_contens;
    my $threechoice;

    $choiceA =~ s/A\.(.+)B\..+C\..+/${1}/m;
    $choiceA =~ s/^\s+|\s+$//gm;
    $choiceB =~ s/A\..+B\.(.+)C\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//gm;
    $choiceC =~ s/A\..+B\..+C\.(.+)/${1}/m;
    $choiceC =~ s/^\s+|\s+$//gm;
    
    
    $threechoice="\n\\threechoices\n{$choiceA}\n{$choiceB}\n{$choiceC}\n";

    return $threechoice;
}
