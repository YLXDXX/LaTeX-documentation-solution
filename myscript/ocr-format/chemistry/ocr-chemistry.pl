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



#化学表达式纠错

$contents =~ s/(C|Cu|Mn|H2)0/${1}O/gm;
$contents =~ s/fe/Fe/gm;
$contents =~ s/Fe203/Fe2O3/gm;
$contents =~ s/Fe304/Fe3O4/gm;
$contents =~ s/na/Na/gm;
$contents =~ s/[Ss][o0]/SO/gm;
$contents =~ s/A1/Al/gm;
$contents =~ s/co/CO/gm;
$contents =~ s/nh/NH/gm;
$contents =~ s/ca/Ca/gm;
$contents =~ s/si/Si/gm;
$contents =~ s/cu/Cu/gm;
$contents =~ s/([^A-Za-z])[nN][o0O]/${1}NO/gm;
$contents =~ s/[cC][Ll]/Cl/gm;
$contents =~ s/Fe34/Fe3O4/gm;
$contents =~ s/Fe23/Fe2O3/gm;
$contents =~ s/[oO][hH]/OH/gm;




#对化学式添加环境

#添加转义符号\\，供后面在正则匹配中使用
my $no="0-9A-Za-z\\+=\\-\\{\\}";

#下面将各化合物的名字放入数组中，后面新添加成员时
#需要将对有括号的添加转义符号\\，供后面在正则匹配中使用
my @compounds=("KMnO4","MnO2","KClO3","H2O2","Fe2O3","Fe3O4","NaCl","HCl","NaOH","KOH","Ca\\(OH\\)2","NaOH","\\(NH4\\)2SO4","KAl\\(SO4\\)2","K2CO3","CaCO3","CuSO4","Na2CO3","NaHCO3","CO2","NH4HCO3","CH3OH","CH3COOH","P2O5","Na2O","NO2","SiO2","SO2","SO3","Cu2O","NO","MgO","CuO","BaO","CO","H2O","FeO","Al2O3","WO3","Ag2O","PbO","KCl","MgCl2","CaCl2","CuCl2","ZnCl2","BaCl2","AlCl3","FeCl2","FeCl3","AgCl","H2SO4","HCl","HNO3","H3PO4","H2S","HBr","H2CO3","CuSO4","BaSO4","CaSO4","MgSO4","FeSO4","\\(Fe\\)2\\(SO4\\)3","Al2\\(SO4\\)3","NaHSO4","KHSO4","Na2SO4","NaNO3","KNO3","AgNO3","Mg\\(NO3\\)2","Cu\\(NO3\\)2","Ca\\(NO3\\)2","Na2CO3","NaNO3","CaCO3","MgCO3","K2CO3","NaOH","Ca\\(OH\\)2","Ba\\(OH\\)2","Mg\\(OH\\)2","Cu\\(OH\\)2","NaOH","KOH","Al\\(OH\\)3","Fe\\(OH\\)2","Fe\\(OH\\)3","CH4","C2H2","CH3OH","C2H5OH","CH3COOH","NH4NO3","\\(NH4\\)2SO4","NH4HCO3","MgO","P2O5","CaO","KCl","HgO","NH3","CH4","CO","CuO2","Al2O3","SO3","NO","Ba\\(NO3\\)2","NH4Cl","Ca\\(H2PO4\\)2","CO\\(NH2\\)2","Ca\\(ClO\\)2","HClO","CaF2","N2O","C2H4","NaClO","Na2O2","K2Cr2O7","ZnSO4","K2SO4","BaCO3","CH2O","C6H6","HCI","C15H22O5","K2MnO4","CH3CH2OH","HClO4","HClO3","NaNO2","Al\\(NO3\\)3","Cu2\\(OH\\)2CO3","C2H8N2","Na2SO3","Mn","Hg","S","Cu","Mg","O2","Fe","Al","H2","S","Zn","N2","Ag","O3","Na","Ca","He","Cl2","C60");


#其中(?<!^)表示不在行首
#其中(?!$)表示不在行尾
foreach my $compound (@compounds){
  $contents =~ s/([^${no}])($compound)([^${no}])/${1} \\ce{${2}} ${3}/gm;#先对中间的进行处理
  $contents =~ s/^($compound)([^$no])/\\ce{${1}} ${2}/gm;
  $contents =~ s/([^${no}])($compound)$/${1} \\ce{${2}}/gm;
  #print "$no\n";
}



#对化学式中的加号作分割
$contents =~ s/\+/ + /gm;



#特殊符号的处理
$contents =~ s/℃/ \\celsius /gm;


#下面对引号的处理，可能有误伤，但概率较小
$contents =~ s/“([><=A-D])([^”])/“\$ ${1} \$”${2}/gm;
$contents =~ s/([^“])([><=A-Da-d])”/${1}“\$ ${2} \$”/gm;
$contents =~ s/“(变大|变小|偏大|偏小|断开|闭合|短路|断路|保持不变|增大|减小|不合理|不相符|不可行|省力|费力|等臂|是|否|甲|乙|丙|丁|远大于|等于|远小于|固体|液体|气体|固液共存|多|少|变高|变低|升高|降低|实像|虚像|不能|相同|不同|非晶体|①|②|③|不正确|错误|左偏|右偏|偏左|偏右)([^”])/“${1}”${2}/gm;
$contents =~ s/([^“])(变大|变小|偏大|偏小|断开|闭合|短路|断路|保持不变|增大|减小|不合理|不相符|不可行|省力|费力|等臂|是|否|甲|乙|丙|丁|远大于|等于|远小于|固体|液体|气体|固液共存|多|少|变高|变低|升高|降低|实像|虚像|不能|相同|不同|非晶体|①|②|③|不正确|错误|左偏|右偏|偏左|偏右)”/${1}“${2}”/gm;
$contents =~ s/“(大于|小于)([^”])/“${1}”${2}/gm;#远小于、远大于 特殊处理
$contents =~ s/([^“远])(大于|小于)”/${1}“${2}”/gm;#远小于、远大于 特殊处理
$contents =~ s/“(左|右)([^”偏])/“${1}”${2}/gm;
$contents =~ s/([^“偏])(左|右)”/${1}“${2}”/gm;
$contents =~ s/“(合理|相符|可行|能|正确)([^”])/“${1}”${2}/gm;#不相符，不合理这种三个字的需要特殊处理
$contents =~ s/([^“不])(合理|相符|可行|能|正确)”/${1}“${2}”/gm;#不相符，不合理这种三个字的需要特殊处理
$contents =~ s/“(固|液|气)([^体液”])/“${1}”${2}/gm;#固液气三字需要特殊处理
$contents =~ s/([^“])(合理|相符)”/${1}“${2}”/gm;#固液气三字需要特殊处理
$contents =~ s/“(高|低)([^”])/“${1}”${2}/gm;#高、低需要特殊处理
$contents =~ s/([^“升变])(高|低)”/${1}“${2}”/gm;#高、低需要特殊处理
$contents =~ s/“(晶体)([^”])/“${1}”${2}/gm;#非晶体需要特殊处理
$contents =~ s/([^“非])(晶体)”/${1}“${2}”/gm;#非晶体需要特殊处理
$contents =~ s/“(不变)([^”])/“${1}”${2}/gm;#非晶体需要特殊处理
$contents =~ s/([^“持])(不变)”/${1}“${2}”/gm;#非晶体需要特殊处理



#选择题处理
$contents =~ s/([A-D]):/${1}\./gm;
$contents =~ s/^([a-d])\./${1}\./gm;



#上下标处理
$contents =~ s/([mkt])([1-5])/\$ ${1}_{${2}} \$/gm;




#单位的处理
$contents =~ s/([0-9])(mL|mg|kg|g|cm|kJ|L|s)/${1} ${2} /gm;
$contents =~ s/g ?\/cm3/\$ g\/cm^{3} \$/gm;
$contents =~ s/([0-9])ml/${1} mL /gm;#对ml单位的一个修正

#题目的分割
$contents =~ s/^(第[一二三四五六七八九十]节)/\n\n${1}/gm;

$contents =~ s/^([1-9][0-9]?)\./\n\n${1}\./gm;
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



#水印识别删除
$contents =~ s/.+pdfstudi.+//mg;
$contents =~ s/.+tudio.+//mg;
$contents =~ s/.+qoppa.+//mg;


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
