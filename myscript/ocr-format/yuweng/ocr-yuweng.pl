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


my $file_input = "./ocr.txt";

my $file_ouput = "./mo-ocr.txt";


my $contents = read_text("$file_input");












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
$contents =~ s/_//gm;
$contents =~ s/\\//gm;
$contents =~ s/\&/\\&/gm;
$contents =~ s/([A-D])．/${1}./gm;
$contents =~ s/\Z/\n\n\n1\n12\n123\n\n\n/m;
$contents =~ s/^ +| +$//gm;  # 去除行首和行尾空白
$contents =~ s/\t//gm;
$contents =~ s/ +/ /gm;
$contents =~ s/([A-D])．/${1}./gm;


#拼音选择

$contents =~ s/\(([a-z]+)\)/ (\\pinyin{${1}}) \\quad /gm;
$contents =~ s/\(([a-z]+)/ (\\pinyin{${1}}) \\quad /gm;
$contents =~ s/([a-z]+)\)/ (\\pinyin{${1}}) \\quad /gm;
$contents =~ s/\\quad $//gm;

#选择题
$contents =~ s/([A-D]):/${1}./gm;
$contents =~ s/^([a-b])\./${2}./gm;



#对每个题空行的分割

$contents =~ s/^(【?答案】|例题|\(例题|测真题|考点|\(考点)/\n\n\n${1}/gm;
$contents =~ s/^(讲技巧|提能力|[0-9]+精华点拨|精华点拨|[0-9]+典例分析|典例分析)/\n\n\n${1}/gm;
$contents =~ s/^(题型|巅峰挑战|自我巩固|课堂落实|例题练习|第[一二三四五六七]节)/\n\n\n${1}/gm;


$contents =~ s/^(\([2-6]\))/\n${1}/gm;


#智能纠错机制
$contents =~ s/ +/ /mg;#空格压缩
$contents =~ s/^\$ :(.+\nB\..+\nC\..+\nD\..+)/A.\$${1}/gm;#对选择题选项进行补全
$contents =~ s/(A\..+)\n\$ :(.+\nC\..+\nD\..+)/${1}\nB.\$${2}/gm;
$contents =~ s/(A\..+\nB\..+)\n\$ :(.+\nD\..+)/${1}\nC.\$${2}/gm;
$contents =~ s/(A\..+\nB\..+\nC\..+)\n\$ :(.+)/${1}\nD.\$${2}/gm;
$contents =~ s/^:(.+\nB\..+\nC\..+\nD\..+)/A.${1}/gm;#对选择题选项进行补全
$contents =~ s/(A\..+)\n:(.+\nC\..+\nD\..+)/${1}\nB.${2}/gm;
$contents =~ s/(A\..+\nB\..+)\n:(.+\nD\..+)/${1}\nC.${2}/gm;
$contents =~ s/(A\..+\nB\..+\nC\..+)\n:(.+)/${1}\nD.${2}/gm;


#标点符号的一个修正,行首出现的问题
#这是以前的一个问题，现在基本不会出现
$contents =~ s/\$ ([。，、；])/\$${1}/g;;

#图编号的去除
$contents =~ s/^图$//gm;


#水印识别删除
$contents =~ s/.+pdfstudi.+//mg;
$contents =~ s/.+tudio.+//mg;
$contents =~ s/.+qoppa.+//mg;

#相邻合并
$contents =~ s/\$\$//g;

#空格压缩
$contents =~ s/ +/ /mg;

#选择题生成所需格式
#
#根据实际情况选择是否使用
#
#四个选项选择题匹配
my sub fix_fourchoice_4;#4行选择题
my sub fix_fourchoice_2;#2行选择题
my sub fix_fourchoice_1;#1行选择题

#$contents =~ s/(A\..+\nB\..+\nC\..+\nD\..+)/fix_fourchoice_4($1)/meg;
#$contents =~ s/(A\..+B\..+\nC\..+D\..+)/fix_fourchoice_2($1)/meg;
#$contents =~ s/(A\..+B\..+C\..+D\..+)/fix_fourchoice_1($1)/meg;

#三个选项选择题匹配
my sub fix_threechoice_3;#3行选择题
my sub fix_threechoice_2;#2行选择题
my sub fix_threechoice_1;#1行选择题

#$contents =~ s/(A\..+\nB\..+\nC\..+)/fix_threechoice_3($1)/meg;
#$contents =~ s/(A\..+B\..+\nC\..+)/fix_threechoice_2($1)/meg;
#$contents =~ s/(A\..+B\..+C\..+)/fix_threechoice_1($1)/meg;


#$contents =~ s///mg;




#存储内容

open(my $FH, '>', "$file_ouput") or die "Could not open file $_ because $!";
print $FH $contents;
close $FH;


exit;


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
    $choiceA =~ s/^\s+|\s+$//g;
    $choiceB =~ s/A\..+\nB\.(.+)\nC\..+\nD\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//g;
    $choiceC =~ s/A\..+\nB\..+\nC\.(.+)\nD\..+/${1}/m;
    $choiceC =~ s/^\s+|\s+$//g;
    $choiceD =~ s/A\..+\nB\..+\nC\..+\nD\.(.+)/${1}/m;
    $choiceD =~ s/^\s+|\s+$//g;
    
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
    $choiceA =~ s/^\s+|\s+$//g;
    $choiceB =~ s/A\..+B\.(.+)\nC\..+D\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//g;
    $choiceC =~ s/A\..+B\..+\nC\.(.+)D\..+/${1}/m;
    $choiceC =~ s/^\s+|\s+$//g;
    $choiceD =~ s/A\..+B\..+\nC\..+D\.(.+)/${1}/m;
    $choiceD =~ s/^\s+|\s+$//g;
    
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
    $choiceA =~ s/^\s+|\s+$//g;
    $choiceB =~ s/A\..+B\.(.+)C\..+D\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//g;
    $choiceC =~ s/A\..+B\..+C\.(.+)D\..+/${1}/m;
    $choiceC =~ s/^\s+|\s+$//g;
    $choiceD =~ s/A\..+B\..+C\..+D\.(.+)/${1}/m;
    $choiceD =~ s/^\s+|\s+$//g;
    
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
    $choiceA =~ s/^\s+|\s+$//g;
    $choiceB =~ s/A\..+\nB\.(.+)\nC\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//g;
    $choiceC =~ s/A\..+\nB\..+\nC\.(.+)/${1}/m;
    $choiceC =~ s/^\s+|\s+$//g;
    
    
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
    $choiceA =~ s/^\s+|\s+$//g;
    $choiceB =~ s/A\..+B\.(.+)\nC\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//g;
    $choiceC =~ s/A\..+B\..+\nC\.(.+)/${1}/m;
    $choiceC =~ s/^\s+|\s+$//g;
    
    
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
    $choiceA =~ s/^\s+|\s+$//g;
    $choiceB =~ s/A\..+B\.(.+)C\..+/${1}/m;
    $choiceB =~ s/^\s+|\s+$//g;
    $choiceC =~ s/A\..+B\..+C\.(.+)/${1}/m;
    $choiceC =~ s/^\s+|\s+$//g;
    
    
    $threechoice="\n\\threechoices\n{$choiceA}\n{$choiceB}\n{$choiceC}\n";

    return $threechoice;
}
