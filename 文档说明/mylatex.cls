\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[LaTex 文档化解决方案]
\LoadClass[UTF8,a4paper,winfonts,openright]{ctexart}



\usepackage{tikz}
\usetikzlibrary{mindmap,shadows}
\usepackage[top=2.5cm,bottom=2cm,left=2.5cm,right=2cm]{geometry}


\usepackage{listings}%代码展示宏包
%显示代码格式设置
\setmonofont{TeX Gyre Cursor} %设置等宽字体对应的字体
\lstset{
    %basicstyle=\ttfamily                                %等宽字体显示
    breaklines,                                          %自动换行
	columns=fixed,       
	numbers=left,                                        % 在左侧显示行号
	numberstyle=\tiny\color{gray},                       % 设定行号格式
	frame=none,                                          % 不显示背景边框
	backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
	keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
	numberstyle=\footnotesize\color{darkgray},           
	commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
	stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
	showstringspaces=false,                              % 不显示字符串中的空格
	texcl=true,                                          %  在代码中运用注释，且注释可用LaTex语法书写
	%language=Tex,                                       %  设置语言，常用语言  bash + Perl + TeX
}
