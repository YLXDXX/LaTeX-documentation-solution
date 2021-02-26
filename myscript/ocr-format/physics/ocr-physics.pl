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
$contents =~ s/([\{\}])/\\${1}/gm;
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
$contents =~ s/\\([^\{\}])/${1}/gm;
$contents =~ s/\&/\\&/gm;
$contents =~ s/([A-D])．/${1}./gm;
$contents =~ s/\Z/\n\n\n1\n12\n123\n\n\n/m;
$contents =~ s/^ +| +$//gm;  # 去除行首和行尾空白
$contents =~ s/\t//gm;
$contents =~ s/ +/ /gm;
$contents =~ s/([A-D])．/${1}./gm;


#数学公式处理
my $formula="+-=<>\.()≥≤≠√△|φΩμθ∵⊥∴∠°⊙∥αβπ±≌∥→∽℃~%×…≈·∝～ωλº●*★ⅢⅡⅠΔ∆ρ~σεηγ'′∙∞＋－τν∩∈ξA-Za-z0-9\{\}\\\\\[\\\]";


#去公式间的空格
#$contents =~ s/([$formula]) +([$formula])/${1}${2}/gm;
#如果只使用上面那句话，会导致匹配不完全，例如w w w这种，后一个空格不能去除
#这里涉及到匹配时指针的移动，下面暂且用循环凑合
my $i=0;
while($i<8)
{
   $contents =~ s/([$formula]) +([$formula])/${1}${2}/gm;
   $i += 1;
}



#对符号的处理公式的处理
$contents =~ s/[$formula]+/\$ $& \$/mg;

#对特殊符号的处理≥≤≠√△|φΩμθ∵⊥∴∠°⊙∥αβπ±≌∥→∽℃~%×…≈·∝～ωλº●*★ⅢⅡⅠΔρ~σεηγ'′∙
#此处可以使用两个数组加一个循环来做，后期再修改
$contents =~ s/≥/ \\geq /gm;
$contents =~ s/≤/ \\leq /gm;
$contents =~ s/≠/ \\neq /gm;
$contents =~ s/√([0-9]{1,3})/ \\sqrt { ${1} } /gm;
$contents =~ s/√([a-zA-Z])/ \\sqrt { ${1} } /gm;
$contents =~ s/△/ \\triangle /gm;
$contents =~ s/φ/ \\varphi /gm;
$contents =~ s/Ω/ \\Omega /gm;
$contents =~ s/μ/ \\mu /gm;
$contents =~ s/θ/ \\theta /gm;
$contents =~ s/∵/ \\because \\ /gm;
$contents =~ s/⊥/ \\perp /gm;
$contents =~ s/∴/ \\therefore \\ /gm;
$contents =~ s/∠/ \\angle /gm;
$contents =~ s/⊙/ \\odot /gm;
$contents =~ s/∥/ \/\/ /gm;
$contents =~ s/α/ \\alpha /gm;
$contents =~ s/β/ \\beta /gm;
$contents =~ s/π/ \\pi /gm;
$contents =~ s/±/ \\pm /gm;
$contents =~ s/≌/ \\cong /gm;
$contents =~ s/→/ \\rightarrow /gm;
$contents =~ s/∽/ \\sim /gm;
$contents =~ s/℃/ \\celsius /gm;
$contents =~ s/°C/ \\celsius /gm;
$contents =~ s/°/ \\degree /gm;
$contents =~ s/º/ \\degree /gm;
$contents =~ s/~/ \\sim /gm;
$contents =~ s/～/ \\sim /gm;
$contents =~ s/%/ \\% /gm;
$contents =~ s/×/ \\times /gm;
$contents =~ s/…/ \\cdots /gm;
$contents =~ s/≈/ \\approx /gm;
$contents =~ s/·/ \\cdot /gm;
$contents =~ s/∝/ \\propto /gm;
$contents =~ s/ω/ \\omega /gm;
$contents =~ s/λ/ \\lambda /gm;
$contents =~ s/●/ \\bullet /gm;
$contents =~ s/\*/ \\star /gm;
$contents =~ s/★/ \\star /gm;
$contents =~ s/Ⅲ/ \\lmd{3} /gm;
$contents =~ s/Ⅱ/ \\lmd{2} /gm;
$contents =~ s/Ⅰ/ \\lmd{1} /gm;
$contents =~ s/Δ/ \\Delta /gm;
$contents =~ s/∆/ \\Delta /gm;
$contents =~ s/ρ/ \\rho /gm;
$contents =~ s/σ/ \\sigma /gm;
$contents =~ s/ε/ \\varepsilon /gm;
$contents =~ s/η/ \\eta /gm;
$contents =~ s/γ/ \\gamma /gm;
$contents =~ s/'+/ ^{\\prime} /gm;
$contents =~ s/′+/ ^{\\prime} /gm;
$contents =~ s/∙/ \\cdot /gm;
$contents =~ s/∞/ \\infty /gm;
$contents =~ s/＋/+/gm;
$contents =~ s/－/-/gm;
$contents =~ s/τ/ \\tau /gm;
$contents =~ s/ν/ \\nu /gm;
$contents =~ s/∩/ \\cap /gm;
$contents =~ s/([A-Z\]\)])U([A-Z\(\[])/${1} \\cup ${2}/gm;#并集修正
$contents =~ s/∈/ \\in /gm;
$contents =~ s/ξ/ \\xi /gm;
#$contents =~ s/\|/ \\mid /gm;#集合相关符号
$contents =~ s/\\([\{\}])/ \\${1} /gm;#对括号特殊处理，加界定
$contents =~ s/([0-9])[xX]10/${1} \\times 10/gm;#科学记数法中的乘号

#对标点符号的处理主要是,.
$contents =~ s/\$ \. \$/\./gm;
$contents =~ s/\$ \./\.\$ /gm;
$contents =~ s/\. \$/ \$\./gm;
$contents =~ s/\$ \, \$/\,/gm;
$contents =~ s/\$ \,/\,\$ /gm;
$contents =~ s/\, \$/ \$\,/gm;
$contents =~ s/\$ \; \$/\;/gm;
$contents =~ s/\$ \;/\;\$ /gm;
$contents =~ s/\; \$/ \$\;/gm;
$contents =~ s/\$ ([\(\)]) \$/${1}/gm;
#下面对引号的处理，可能有误伤，但概率较小
$contents =~ s/“\$ ([><=A-D]) \$([^”])/“\$ ${1} \$”${2}/gm;
$contents =~ s/([^“])\$ ([><=A-Da-d]) \$”/${1}“\$ ${2} \$”/gm;
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

my sub my_choice_uc;#随后选择题大小写转换用
sub my_choice_uc
{
    my $my_contens=uc(shift);
    return "$my_contens.";
}

#对ABCDE选项的处理，条件可能有点宽
$contents =~ s/\$ ([A-E]\.) \$/${1}\. /gm;
$contents =~ s/\$ ([A-E]\.)/${1} \$ /gm;
$contents =~ s/\$ ([A-E])\. \$/${1}\./gm;
$contents =~ s/\$ ([A-E]) \$[\.．]/${1}\./gm;
$contents =~ s/\$ ([A-E])\./${1}\. \$ /gm;
$contents =~ s/（\$ ([A-E]) \$）/${1}./gm;
$contents =~ s/^\$ \(([A-E])\)/${1}.\$/gm;
$contents =~ s/^\$ ([a-e]) \$．/my_choice_uc(${1})/gme;
$contents =~ s/([A-E])[:．]/${1}./gm;#特殊处理





#对选择题后面答案括号的处理
#可根据实际情况选择采用的方式
#$contents =~ s/\$ \(\) \$$/ \\xzanswer{}\n/gm;
#$contents =~ s/\$ \(\) \$\.$/ \\xzanswer{}\n/gm;
#$contents =~ s/\(\) \$$/\$ \\xzanswer{}\n/gm;

$contents =~ s/\$ \(\) \$$/\$ ( \\ \\ ) \$/gm;
$contents =~ s/\$ \(\) \$\.$/\$ ( \\ \\ ) \$/gm;
$contents =~ s/\(\) \$$/ \$ \$ ( \\ \\ ) \$/gm;#引入一个额外的空格，防止后面$$处理的影响
$contents =~ s/\(\)/( \\ \\ )/gm;


#对括号的处理
$contents =~ s/\$ \( \$/\(/gm;
$contents =~ s/\( \$/ \$\(/gm;
$contents =~ s/\$ \) \$/\)/gm;
$contents =~ s/\$ \)/\)\$ /gm;
$contents =~ s/^（\$ ([1-9]) \$）/(${1})/gm;#对标号带括号的一个修正（全角括号）
$contents =~ s/^（\$ ([1-9]) \$）/(${1})/gm;#对小题标号的一个修正（全角括号）


#对函数的处理
$contents =~ s/(tan|sin|cos)/ \\${1} /gm;

#对罗马数字的处理
$contents =~ s/\$ +(\\lmd\{[0-9]\}) +\$/ ${1} /gm;

#坐标系标识纠错
$contents =~ s/x0y/xOy/gm;


#前面的处理数学物理等基本通用，后面的处理针对物理学科


#对物理上下标的简单处理,条件较宽松
$contents =~ s/\$ ([A-Za-z])([0-9]) \$/\$ ${1}_{${2}} \$/gm;
$contents =~ s/([UWISs])(OA|OB|OC|OD|OE|AB|AC|AD|BC|BD|CD|ab|ac|ad|bc|bd|cd|BA|CA|DA|CB|DB|DC|ba|ca|da|cb|db|dc)/ ${1}_{${2}} /gm;#电压的特殊匹配,位置需要在一般下角标匹配之前（例$ Uab $）
$contents =~ s/([qe])vB0/${1}v B_{0} /gm;#对洛仑兹力的表达式特殊处理
$contents =~ s/I2R/ I^{2} R/gm;#对焦耳热公式进行特殊处理
$contents =~ s/\/s2/\/s^{2} /gm;#对加速度单位进行特殊处理m/s^{2},位置需在一般匹配之前
$contents =~ s/([hvabtlqxOEUQPTfSxErRIWFLxyndsGABCMN])([1-4])/ ${1}_{${2}} /gm;
$contents =~ s/([^0-9])V([1-4])/${1} V_{${2}} /gm;#对电压V角标处理需注意匹配后面电压作为单位的处理
$contents =~ s/([fF])N/ ${1}_{N} /gm;
$contents =~ s/([qIxyXTRfHQPvSFWhGV])([A-D])/ ${1}_{${2}} /gm;
$contents =~ s/E([A-C])/ E_{${1}} /gm;#E进行特殊处理，需考虑LED
$contents =~ s/([^L])ED/${1} E_{D} /gm;
$contents =~ s/([NIUSnx])([a-d])/ ${1}_{${2}} /gm;
$contents =~ s/NA/ N_{A} /gm;#阿弗加德罗常数表述
$contents =~ s/([^\\])v([a-d])/${1} v_{${2}} /gm;#考虑命令\varphi，特殊处理
$contents =~ s/([^lam])m([a-d])/${1} m_{${2}} /gm;#考虑与罗马数字的兼容，例如\lmd{1},还有 \lambda \gamma
$contents =~ s/F([Tfn])/ F_{${1}} /gm;
$contents =~ s/([^pri])([xmlEhtRIPpvTBr])([o0])([^l])/${1} ${2}_{${3}} ${4}/gm;#注意一些命令的冲突，例如\propto \rho \varepsilon等,还有mol单位
$contents =~ s/([avVFWPhH])(max|min)/ ${1}_{${2}} /gm;
$contents =~ s/([vV])([xy0])/ ${1}_{${2}} /gm;
$contents =~ s/E([pma-d])/ E_{${1}} /gm;
$contents =~ s/([IUfvRF])m/ ${1}_{m} /gm;
$contents =~ s/([^i])([rBf])([a-d])([^d])/${1} ${2}_{${3}} ${4}/gm;#注意一些命令和单位冲突，例如rad/s、rad/min
$contents =~ s/([vfF])([MN])/ ${1}_{${2}} /gm;
$contents =~ s/\\omega ([A_C])/\\omega_{${1}} /gm;
$contents =~ s/([pPLFGtVWUIRms]) \$([甲乙丙丁])/ ${1}_{\\text{${2}}} \$/gm;
$contents =~ s/F \$ ?合/ F_{\\text{合}} \$/gm;
$contents =~ s/([^0-9\/cmd])m([A-C1-4])/${1} m_{${2}} /gm;#这里注意与毫安、立方米、平方米单位的冲突
$contents =~ s/(\\mu|\\theta|\\lambda|\\nu) ([0-3])/${1} _{${2}} /gm;
$contents =~ s/E(P|p1|p2|p|k1|k2|k3|ka|kb|kc|km|k|n)/ E_{${1}} /gm;#注意其中的顺序
$contents =~ s/([vV])n/ ${1}_{n} /gm;
$contents =~ s/U([R0])/ U_{${1}} /gm;
$contents =~ s/([RI])g/ ${1}_{g} /gm;
$contents =~ s/R([tz])/ R_{${1}} /gm;
$contents =~ s/R([xVL])/ R_{${1}} /gm;
$contents =~ s/W([fFG])/ W_{${1}} /gm;
$contents =~ s/([^hfsel\\])([tT])([A-Da-d])([^n])/${1} ${2}_{${3}} ${4}/gm;#注意与命令的冲突
$contents =~ s/\$ ([FW]) \$ ?([浮拉安])/\$ ${1}_{\\text{${2}}} \$/gm;
$contents =~ s/\$ G \$([排物液])/\$ G_{\\text{${1}}} \$/gm;
$contents =~ s/[pP] \$([水铝])\$ /\\rho_{\\text{${1}}} /gm;
$contents =~ s/F \$([浮拉])\$ /F_{\\text{${1}}} /gm;
$contents =~ s/c \$水\$ /c_{\\text{水}} /gm;


#对物理单位的处理,条件较宽松
#对电压的处理后面加空格(防止电压和瓦数一同出现时V的角标问题)

$contents =~ s/([xy0-9])(cm|dm|mm|m)([23])/${1} \\ ${2}^{${3}}/gm;#注意这里单位处理的顺序
$contents =~ s/\/(cm|m|dm|mm)([23])/\/${1}^{${2}} /gm;
$contents =~ s/[wW][ -\.]?h/W \\cdot h/gm;#有千瓦和瓦，可以合并到瓦单位上
$contents =~ s/mA[\.]?h/mA \\cdot h/gm;
#采用或匹配时是有匹配顺序的，将单字放在后面避免min、mm之类的单位出现空格
$contents =~ s/([xy0-9])(kg|cm|dm|nm|min|km|Km|mm|mA|uA|mol|atm|Hz|eV|MeV|kW|kV|imp|dB|Pa|kPa|rad|kJ|[VhmNJsgWAKT])/${1} \\ ${2} /gm;
$contents =~ s/ \/([mcd]?m\^\{3\}|h|min|s\^\{2\})/\/${1}/gm;#对kg/m^{3}这样的单位单独处理
$contents =~ s/([0-9])m\/s2/${1} \\ m\/s^{2}/gm;
$contents =~ s/m\/s2/m\/s^{2}/gm;
$contents =~ s/([0-9]) \\Omega/${1} \\ \\Omega/gm;
$contents =~ s/([0-9])k \\Omega/${1} \\ k\\Omega/gm;
$contents =~ s/([0-9]) \\mu A/${1} \\ \\mu A/gm;
$contents =~ s/([0-9])k[wW]/${1} \\ kW/gm;
$contents =~ s/([0-9]) \\celsius/${1} \\ \\celsius/gm;
$contents =~ s/([0-9])um/${1} \\ \\mu m/gm;
$contents =~ s/([0-9])r\/k[wW]/${1} \\ r\/kW/gm;
$contents =~ s/([0-9])r\/min/${1} \\ r\/min/gm;
$contents =~ s/([0-9])M \\Omega/${1} \\ M \\Omega/gm;
$contents =~ s/kg\. \\celsius /kg \\cdot \\celsius /gm;
$contents =~ s/([0-9])u/${1} \\ u/gm;#原子质量单位



#科学记数法顺序在单位处理之后，避免有些单位没有匹配上
$contents =~ s/\\times 10(-?[0-9]+)/\\times 10^{${1}} /gm; #科学记数法特殊顺序，单位处理之后

#题号的处理
$contents =~ s/^例\$ ([0-9]+) \$/例${1}/gm;
$contents =~ s/^例\$ ([0-9]+)\(1\) \$/例${1}\n(1)/gm;
$contents =~ s/^练\$ ([0-9]+\.[1-6]) \$/练${1}/gm;
$contents =~ s/^练\$ ([0-9]+\.[1-6])\(1\) \$/练${1}\n(1)/gm;
$contents =~ s/^\$ ([1-9][0-9]?\.)/${1}\$ /gm;
$contents =~ s/^\$ ([1-9][0-9]?\.) \$/${1}/gm;
$contents =~ s/^\$ ([1-9][0-9]?) \$\./${1}\./gm;
$contents =~ s/^\$ ([1-9][0-9]?) \$/${1}/gm;
$contents =~ s/^([1-9][0-9]?)．/${1}./gm;

#大题下的小题号(1)(2)等
$contents =~ s/^\$ (\([1-8]\)) \$/${1}/gm;
$contents =~ s/^\$ (\([1-5]\))/${1}\$ /gm;
$contents =~ s/^\$ (\([1-9]\))/${1}\$ /gm;
$contents =~ s/^\$ ([1-9])\) \$/(${1})/gm;
$contents =~ s/^\$ \(([1-9]) \$/(${1})/gm;
$contents =~ s/\$  \$//gm;
$contents =~ s/^\([1-9]\)$//gm;


#对每个题空行的分割

$contents =~ s/^(【?答案】|例题|\(例题|测真题|考点|\(考点)/\n\n\n${1}/gm;
$contents =~ s/^(讲技巧|提能力|[0-9]+精华点拨|精华点拨|[0-9]+典例分析|典例分析)/\n\n\n${1}/gm;
$contents =~ s/^(题型|巅峰挑战|自我巩固|课堂落实|例题练习|第[一二三四五六七]节)/\n\n\n${1}/gm;

$contents =~ s/^([一二三四五六七])([\.、])/\n\n${1}${2}/gm;
$contents =~ s/^([1-9][0-9]?)([^\.])/${1}\.${2}/gm;#特殊问题特殊处理
$contents =~ s/^([1-9][0-9]?)\./\n\n${1}\./gm;
$contents =~ s/^口口\$ ([0-9]+) \$\./\n\n${1}\./gm;
$contents =~ s/^\$ 0 \$口\$ ([0-9]+)\. \$/\n\n${1}\./gm;
$contents =~ s/^\$ 0 \$口\$ ([0-9]+) \$\./\n\n${1}\./gm;
$contents =~ s/^口\$ ([0-9]+)\. \$/\n\n${1}\./gm;
$contents =~ s/^口\$ ([0-9]+) \$\./\n\n${1}\./gm;
$contents =~ s/^(例[0-9]+)/\n\n${1}/gm;
$contents =~ s/^(练[0-9]+)/\n\n${1}/gm;
$contents =~ s/^(第[0-9]+讲)/\n\n${1}/gm;
$contents =~ s/^(\([2-6]\))/\n${1}/gm;


#智能纠错机制
$contents =~ s/ +/ /mg;#空格压缩
$contents =~ s/^\$ ([a-dA-D]):/${1}. \$ /gm;
$contents =~ s/^\$ ([A-D]) \$/${1}./gm;
#$contents =~ tr/^[a-d]./[A-D]./;
$contents =~ s/^([a-d]\.)/uc(${1})/gme;#使用函数将小写字母转为大写字母
$contents =~ s/m_\{A\} h/mA \\cdot h/gm;
$contents =~ s/m_\{A\} \\cdot h/mA \\cdot h/gm;
$contents =~ s/([A-D])\.\./${1}\./gm;
$contents =~ s/wt/\\omega t/gm;
$contents =~ s/BSw/BS\\omega /gm;
$contents =~ s/qv_\{B\}/qvB/gm;
$contents =~ s/\$ \/ \$/\//gm;
$contents =~ s/\$ ([pP])=[pP]gh \$/\$ ${1}=\\rho gh \$/gm;#液体压强表达式
$contents =~ s/([0-9])pa/${1} \\ Pa /gm;#压强单位处理补漏
$contents =~ s/\$ m([23]) \$/\$ m^{${1}} \$/gm;#前面遗漏补充
$contents =~ s/\$ ([cdm])m([23]) \$/\$ ${1}m^{${2}} \$/gm;#前面遗漏补充
$contents =~ s/^([0-9])\.([0-9])\./${1}${2}./gm;
$contents =~ s/\$ : \$/:/gm;
$contents =~ s/([0-9] \\ V) ([0-9\.]+ \\ )([WA])/${1} \\quad ${2}${3}/gm;#描述一些用电器的时候常用
$contents =~ s/^\$ :(.+\nB\..+\nC\..+\nD\..+)/A.\$${1}/gm;#对选择题选项进行补全
$contents =~ s/(A\..+)\n\$ :(.+\nC\..+\nD\..+)/${1}\nB.\$${2}/gm;
$contents =~ s/(A\..+\nB\..+)\n\$ :(.+\nD\..+)/${1}\nC.\$${2}/gm;
$contents =~ s/(A\..+\nB\..+\nC\..+)\n\$ :(.+)/${1}\nD.\$${2}/gm;
$contents =~ s/^:(.+\nB\..+\nC\..+\nD\..+)/A.${1}/gm;#对选择题选项进行补全
$contents =~ s/(A\..+)\n:(.+\nC\..+\nD\..+)/${1}\nB.${2}/gm;
$contents =~ s/(A\..+\nB\..+)\n:(.+\nD\..+)/${1}\nC.${2}/gm;
$contents =~ s/(A\..+\nB\..+\nC\..+)\n:(.+)/${1}\nD.${2}/gm;
$contents =~ s/ \$ +¢ */\^{\\prime} \$/gm;#对上标进行一个修正
$contents =~ s/^([A-E])\.、/${1}\./gm;#对选择题选项的一个修正
$contents =~ s/\$ \\times 10\^\{0\} \$/\$ \\times 100 \$/g;#对欧姆表选档的一个修正
$contents =~ s/10(-[0-9]+) \\ /10^{${1}} \\ /gm;#对科学记数法的一个修正
$contents =~ s/ \/c2/\/c^{2}/gm;#对单位的一个修正,例如 MeV/c^{2}
$contents =~ s//\$ \\alpha \$/gm;#对希腊字母的一个修正,α导出的问题
$contents =~ s//\$ \\gamma \$/gm;#对希腊字母的一个修正,γ导出的问题


#标点符号的一个修正,行首出现的问题
#这是以前的一个问题，现在基本不会出现
$contents =~ s/\$ ([。，、；])/\$${1}/g;;

#图编号的去除
$contents =~ s/图\$ [0-9]{1,2}-[0-9]{1,2}/图\$ /gm;
$contents =~ s/图\$ [0-9]{1,2}-[0-9]{1,2}-[0-9]{1,2}/图\$ /gm;
$contents =~ s/\$ +\$//g;
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
