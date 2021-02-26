#!/usr/bin/perl
use utf8;#告诉perl，源码以utf8的方式编写
use strict;#让Perl编译器以严格的态度对待Perl程序
use warnings;#显示一些警告和错误
#Perl中可以通过反引号来执行操作系统中的命令
#$var=`date +"%F %T"`

use autodie;

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
use File::Find;


#关键词数组
#题目类型
my @probtype=("选择","实验","填空","作图","计算");


#题目难度
my @problever=("0","0.5","1","1.5","2","2.5","3","3.5","4","4.5","5","5.5","6","6.5","7","7.5","8","8.5","9","9.5","10");


#题目区域
my @probarea_1=("直线运动","相互作用","运动定律","曲线运动","万有引力","能量守恒","相对论","电场","电路","磁场","电磁感应","电磁波","动量","机械波","光学","分子动理论","热学","原子物理","波粒二象性");

my @probarea_2=("平抛","圆周","动能定理","机械能守恒","电场强度","电势能","电容器","楞次定律","电磁感应定律","变压器与高压输电","单摆","多普勒效应","波的干涉","热力学第一定律","热力学第二定律","理想气体状态方程","动量守恒","动量定理","安培力","磁场中带电粒子的运动","电场中带电粒子的运动","波的描述","光的折射","光的衍射","光的干涉","牛一律","牛二律","牛三律","超重失重","斜抛","功与功率");

#思想方法
my @probmethod=("思想方法","等效","类比","相似","微元","对称","极限","假设","比例","量纲","整体","隔离","函数","几何","参考系变换","小量近似");


#题目特征
my @probfeature=("题目特征","图像选择","图像分析","材料分析","计算练习","物理学史");

#获取选中关键词

chomp(my $keyword=`xclip -out`);#如果最后有换行符，则去除


if(!$keyword) {
   system 'zenity --error --text "未选择任何内容"';
   exit 1;
}

my $mycontent;
my $contents;
#遍历
#题目类型
foreach my $mykey (@probtype){
    if( $keyword eq $mykey ){
    $mycontent='%题目类型:'.$keyword;
    open(my $FH, '>', "/tmp/help-input.txt") or die "Could not open file $_ because $!";
    print $FH $mycontent;
    close $FH;
    exit 0;
    }
}

#题目难度
foreach my $mykey (@problever){
    if( $keyword eq $mykey ){
    $mycontent="\n%题目难度:".$keyword;
    open(my $FH, '>>', "/tmp/help-input.txt") or die "Could not open file $_ because $!";
    print $FH $mycontent;
    close $FH;
    exit 0;
    }
}


#题目区域:一级
foreach my $mykey (@probarea_1){
    if( $keyword eq $mykey ){
    $mycontent="\n%题目区域:".$keyword;
    open(my $FH, '>>', "/tmp/help-input.txt") or die "Could not open file $_ because $!";
    print $FH $mycontent;
    close $FH;
    exit 0;
    }
}

#题目区域:二级
foreach my $mykey (@probarea_2){
    if( $keyword eq $mykey ){
    $mycontent="\n%题目区域:".$keyword;
    open(my $FH, '>>', "/tmp/help-input.txt") or die "Could not open file $_ because $!";
    print $FH $mycontent;
    close $FH;
    exit 0;
    }
}


#思想方法
foreach my $mykey (@probmethod){
    if( $keyword eq $mykey ){
    if( $keyword eq "思想方法" ){
        $mycontent="\n%思想方法:";
    }
    else{
        $mycontent="\n%思想方法:".$keyword;
    }
    open(my $FH, '>>', "/tmp/help-input.txt") or die "Could not open file $_ because $!";
    print $FH $mycontent;
    close $FH;
    exit 0;
    }
}

#题目特征
foreach my $mykey (@probfeature){
    if( $keyword eq $mykey ){
     if( $keyword eq "题目特征" ){
        $mycontent="\n%题目特征:"."\n%题目备注:\n";
    }
    else{
        $mycontent="\n%题目特征:".$keyword."\n%题目备注:\n";
    }
    
    $contents = read_text("/tmp/help-input.txt");
    my $i=0;
    while($i<8)
    {
        $contents =~ s/(%题目区域:.+)\n%题目区域/${1}/m;#可能有多个关键词，重复几次，保证处理赶紧
        $i += 1;
    }
    $i=0;
    while($i<8)
    {
        $contents =~ s/(%思想方法:.+)\n%思想方法/${1}/m;#可能有多个关键词，重复几次，保证处理赶紧
        $i += 1;
    }
    #$contents =~ s/%题目区域:/%题目难度:\n%题目区域:/m;#已加入难度选项，不在需要
    $contents = $contents . $mycontent;
    
    if(! $contents =~ m/%题目类型:/){
    system 'zenity --error --text "缺题目类型"';
    exit 1;
    }
     if(! $contents =~ m/%题目区域:/){
    system 'zenity --error --text "缺题目区域"';
    exit 1;
    }
    if(! $contents =~ m/%题目难度:/){
    system 'zenity --error --text "缺题目难度"';
    exit 1;
    }
     if(! $contents =~ m/%思想方法:/){
    system 'zenity --error --text "缺思想方法"';
    exit 1;
    }
     if(! $contents =~ m/%题目特征:/){
    system 'zenity --error --text "缺题目特征"';
    exit 1;
    }
     if(! $contents =~ m/%题目备注:/){
    system 'zenity --error --text "缺题目备注"';
    exit 1;
    }
    
    system "echo \"$contents\" | xsel -b ";
    system 'zenity --error --text "已复制到剪贴板"';
   exit 0;
    #open(my $FH, '>', "/tmp/help-input.txt") or die "Could not open file $_ because $!";
    #print $FH $contents;
    #close $FH;
    exit 0;
    }
}
{
system 'zenity --error --text "关键词无效"';
   exit 1;
}


exit 0 ;

 

