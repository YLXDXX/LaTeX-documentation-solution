\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[shui 自定义文档模板]

%基本设置

\LoadClass[UTF8,a4paper,fontset=windows,openright,zihao=5]{ctexbook}
%其中winfonts解决某些不常用字无法正确显示的问题，其中openright与twoside的效果一样
%Linux下默认使用的字体有些生僻字无法正常显示

\RequirePackage[top=2.6cm,bottom=2.6cm,left=2.5cm,right=4.4cm,marginparsep=19pt,marginparwidth=3.7cm,]{geometry}
%页边距 其中的marginparsep(页边注与正文的间隔)是为了todonotes宏包的注释距离而重新设定,marginparwidth页注的宽度


%宏包请求
%报错Undefined control sequence. }  (为没有请求相应宏包)

%\RequirePackage{gbt7714} %参考文献
%\RequirePackage[backend=biber,style=gb7714-2015]{biblatex} %参考文献，其中biber是参考文献的编译器，可自己选择
%\RequirePackage{cite}  %参考文献


\RequirePackage{mathdots} %添加斜向省略号

\RequirePackage{xcolor}%定义了一些颜色





%超链接
\RequirePackage[draft=false,colorlinks=true,CJKbookmarks=true,linkcolor=blue,citecolor=green,urlcolor=red,hyperindex]{hyperref}

\RequirePackage{enumerate} %列项序号编号
\RequirePackage{extarrows} %箭头等号上添加文字



\RequirePackage{amssymb} %数学公式符号
\RequirePackage{amsmath} %数学公式
\RequirePackage{mathtools} %数学公式扩展宏包,提供了公式编号定制和更多的符号、矩阵等。
\RequirePackage{cases} %使用括号对公式等进行并列排列
%\RequirePackage{amsthm}%证明定理等环境，与精细设定ntheorem有冲突
\RequirePackage{amsfonts} %用来输入各种符号的特殊形态，例如字母的花体、空心体等，配合amssymb使用
\RequirePackage{mathrsfs} %数学中的花体(不是太花的)



\RequirePackage{graphicx} %图片
%\RequirePackage[linguistics]{forest} %画树形图
%\RequirePackage{luatex85} %画分形menger-sponge用
%\RequirePackage{subfig} %排列子图
%\RequirePackage{overpic} %图上做标记
%\RequirePackage{epsfig} 
%\RequirePackage{tikz} %画图
%\RequirePackage{mathpazo} %画图
%\RequirePackage{pgfplots} %画图
%\RequirePackage{pstricks} %画图
%\usetikzlibrary{shapes,arrows} %tikz图形库
%\usetikzlibrary{calc,intersections,through,backgrounds} %tikz图形库
%\usepgfplotslibrary{fillbetween} %图像的填充
%\usetikzlibrary{patterns}	%作图相关
%\RequirePackage{listings}   %插入代码




%\RequirePackage{longtable} %长表格
%\RequirePackage{colortbl,booktabs}%第二个包定义了几个*rule，画表格用
%\RequirePackage{multirow} %支持合并多行单元格。
%\RequirePackage{tabu} %提供排版复杂格式表格的 tabu 环境




%\RequirePackage{float}
%\lstset{language=Mathematica}%这条命令可以让LaTeX排版时将Mathematica键字突出显示
%\lstset{extendedchars=false}%这一条命令可以解决代码跨页时，章节标题，页眉等汉字不显示的问题



%\RequirePackage[numbers,sort&compress]{natbib} %参数代表：数字和排序与压缩，与biblatex有冲突

\RequirePackage{textcomp} %摄氏度符号
%\usepackage{ccmap} %pdf中文复制
%\RequirePackage{color} %gnuplot彩色文字
%\RequirePackage{indentfirst}


%\RequirePackage{xltxtra}
%\RequirePackage{bm}
%\RequirePackage{pdfpages}
\RequirePackage{fancyhdr} %页眉排版相关

\graphicspath{{picture/}} %图片存放目录,可直接引用，不用填路径名


\RequirePackage[font=small,labelfont={bf,color=main}]{caption,subcaption}%对图片表格标题和子标题的控制
\RequirePackage[explicit]{titlesec} %设置目录格式 %参数[explicit] 进一步精确定制
\RequirePackage{titletoc}

\RequirePackage{indentfirst} %段落缩进包
%\RequirePackage{setspace}    %设置行间距包 此包与脚注的超链接有冲突，设置摘要的行间距使用,暂时使用别的方法替代设置
\RequirePackage[bodytextleadingratio=1.9]{zhlineskip} %采用新包进行行间距设置，要求正文宋体小4号，12磅，行间距23磅，约为1.917倍
% 采用带圈数字符号代替*号脚注
\xeCJKsetcharclass{`①}{`⑩}{1}

%翻页控制(左翻页)去掉空页页眉
%其中page的计数器的改变是修正空白页后的页码，空白页不计入页码编号\addtocounter{page}{-1}
\renewcommand{\cleardoublepage}{\relax
  \clearpage
  \if@twoside \ifodd\c@page\relax\else
  \hbox{}\thispagestyle{empty}\newpage\fi\fi}



%页面页眉页脚样式


%新样式
%页眉页脚
\setCJKfamilyfont{hwxk}{HYXiaoLiShuJ}             %使用STXingkai华文行楷字体
\newcommand{\myfonta}{\CJKfamily{hwxk}}
\usepackage{atbegshi}
\usepackage{lmodern}
\usepackage{tikzpagenodes}
\definecolor{myupcolour01}{RGB}{180, 199, 231}
\definecolor{myupcolour02}{RGB}{197, 224, 180}
\definecolor{myupcolour03}{RGB}{20, 35, 52} %钢青
\definecolor{mydowncolour01}{RGB}{175, 171, 171}
\definecolor{mydowncolour02}{RGB}{118, 113, 113}
\definecolor{mydowncolour03}{RGB}{46, 49, 124}%满天星紫
\definecolor{myedgecolour}{RGB}{65, 113, 156}

%控制logo的显示
\newif\iflogo

%定义新的计数器，采用四位数的格式
\newcounter{poem}
\renewcommand*{\thepoem}{%
		\ifnum\value{poem}<1000 0\fi
		\ifnum\value{poem}<100 0\fi
		\ifnum\value{poem}<10 0\fi
		\arabic{poem}%
}


\refstepcounter{poem}

\newlength{\myymength}
%定义奇数页页眉
\newcommand{\Headerodd}{%
	\begin{tikzpicture}[remember picture,overlay]
	
	\fill[myupcolour01]
	%画第一道线
	([yshift=-2cm,xshift=2.5cm]current page.north west) -- ([yshift=-2cm,xshift=12.5cm]current page.north west) -- ([yshift=-1.8cm,xshift=12.5cm]current page.north west) --
	([yshift=-1.8cm,xshift=2.5cm]current page.north west) --cycle;
	%画第二道线
	\fill[myupcolour02]
	([yshift=-1.3cm,xshift=2.5cm]current page.north west) -- ([yshift=-1.3cm,xshift=6cm]current page.north west) -- ([yshift=-1.1cm,xshift=6cm]current page.north west) --
	([yshift=-1.1cm,xshift=2.5cm]current page.north west) --cycle;
	
	%页眉标语
	%\node[font=\color{myupcolour03!80},anchor=west] at ([yshift=-1.25cm,xshift=6.5cm]current page.north west){\fontsize{11}{11}\selectfont 页眉标语};
	

    \iflogo
    %添加logo
    \node[inner sep=0pt,anchor=east] (whitehead) at ([yshift=-1.3cm,xshift=-1.5cm]current page.north east)
        {\def\svgwidth{0.4\linewidth}\input{picture/logo_svg-tex.pdf_tex}};
    \else
    %\setcounter{poem}{\thepage}
    \setcounter{poem}{\numexpr\value{page}+1\relax}%若直接采用上面的方法，会在目录第一次编译的时候出问题
    \node [anchor=west,inner sep=0] at ([yshift=-1.17cm,xshift=6.3cm]current page.north west) {\includegraphics[height=1em]{poem/poem-quotes/poem-\thepoem.pdf}};%
    \node [anchor=west,inner sep=0] (name) at ([yshift=-1.85cm,xshift=12.8cm]current page.north west) {	\includegraphics[height=0.8em]{poem/poem-name/poem-\thepoem.pdf}};%
    \node [anchor=west,inner sep=0] (title) at ([yshift=0cm,xshift=0.35cm]name.east) {\includegraphics[height=0.8em]{poem/poem-title/poem-\thepoem.pdf}};%
    \fi
	
	
	%画页脚的第一道线
	\fill[mydowncolour01]
	([yshift=1.6cm,xshift=2.5cm]current page.south west) -- ([yshift=1.6cm,xshift=-1.5cm]current page.south east) -- ([yshift=1.7cm,xshift=-1.5cm]current page.south east) --
	([yshift=1.7cm,xshift=2.5cm]current page.south west) --cycle;
	
	%页脚标语
	\node[font=\color{mydowncolour03!80},anchor=west] at ([yshift=1.1cm,xshift=3.5cm]current page.south west)
	{\fontsize{9}{9}\selectfont 培优系列};
	

	
	%画页脚的第二道线
	\fill[mydowncolour02]
	([yshift=1.9cm,xshift=2.5cm]current page.south west) -- ([yshift=1.9cm,xshift=-1.5cm]current page.south east) -- ([yshift=2cm,xshift=-1.5cm]current page.south east) --
	([yshift=2cm,xshift=2.5cm]current page.south west) --cycle;
	
	
	
%画页脚的第一个方框
    \draw[mydowncolour02,rounded corners=0.15cm,line width=0.1cm,fill=white,anchor=east] ([yshift=1.45cm,xshift=-3.8cm]current page.south east) rectangle ++(0.7,0.7);   
%画页脚的第二个方框    
     \draw[mydowncolour01,rounded corners=0.07cm,line width=0.1cm,fill=white,anchor=west] ([yshift=2.22cm,xshift=-4.1cm]current page.south east) rectangle ++(0.4,0.4);      

%虚线页边虚线
\draw[loosely dash dot,myedgecolour,line width=2pt,anchor=east] ([yshift=2.8cm,xshift=-3.7cm]current page.south east) -- ([yshift=-2.5cm,xshift=-3.7cm]current page.north east);

%页边批注
\node[font=\color{red!90},anchor=west] at ([yshift=-2.45cm,xshift=-3.5cm]current page.north east)
{\fontsize{21}{21}\myfonta\selectfont 札记};

%页码
%需要设置anchor=west不然遇到页数位数增多出问题
\node[font=\color{blue!60},anchor=west] at ([yshift=2.3cm,xshift=-2.7cm]current page.south east)
{\fontsize{12}{12}\myfonta\selectfont \thepage};

%页脚标题
\node[font=\color{mydowncolour03!80},anchor=east] at ([yshift=1.1cm,xshift=-4.5cm]current page.south east)
{\fontsize{9}{9}\selectfont  \leftmark};

	\end{tikzpicture}%
}
%定义偶数页页眉
\newcommand{\Headereven}{%
	\begin{tikzpicture}[remember picture,overlay]
	\fill[myupcolour01]
%画第一道线
([yshift=-2cm,xshift=-2.5cm]current page.north east) -- ([yshift=-2cm,xshift=-12.5cm]current page.north east) -- ([yshift=-1.8cm,xshift=-12.5cm]current page.north east) --
([yshift=-1.8cm,xshift=-2.5cm]current page.north east) --cycle;
%画第二道线
\fill[myupcolour02]
([yshift=-1.3cm,xshift=-2.5cm]current page.north east) -- ([yshift=-1.3cm,xshift=-6cm]current page.north east) -- ([yshift=-1.1cm,xshift=-6cm]current page.north east) --
([yshift=-1.1cm,xshift=-2.5cm]current page.north east) --cycle;

%页眉标语
%\node[font=\color{myupcolour03!80},anchor=east] at ([yshift=-1.25cm,xshift=-6.5cm]current page.north east){\fontsize{11}{11}\selectfont 页眉标语};

\iflogo
%添加logo
\node[inner sep=0pt,anchor=west] (whitehead) at ([yshift=-1.3cm,xshift=1.5cm]current page.north west)
{\def\svgwidth{0.4\linewidth}\input{picture/logo-even_svg-tex.pdf_tex}};
\else
%\setcounter{poem}{\thepage}
\setcounter{poem}{\numexpr\value{page}+1\relax}%若直接采用上面的方法，会在目录第一次编译的时候出问题
\node [anchor=east,inner sep=0] at ([yshift=-1.17cm,xshift=-6.3cm]current page.north east) {\includegraphics[height=1em]{poem/poem-quotes/poem-\thepoem.pdf}};%
\node [anchor=east,inner sep=0] (title) at ([yshift=-1.85cm,xshift=-12.8cm]current page.north east) {\includegraphics[height=0.8em]{poem/poem-title/poem-\thepoem.pdf}};%
\node [anchor=east,inner sep=0] (name) at ([yshift=0cm,xshift=-0.35cm]title.west) {\includegraphics[height=0.8em]{poem/poem-name/poem-\thepoem.pdf}};%
\fi



%画页脚的第一道线
\fill[mydowncolour01]
([yshift=1.6cm,xshift=-2.5cm]current page.south east) -- ([yshift=1.6cm,xshift=1.5cm]current page.south west) -- ([yshift=1.7cm,xshift=1.5cm]current page.south west) --
([yshift=1.7cm,xshift=-2.5cm]current page.south east) --cycle;

%页脚标语
\node[font=\color{mydowncolour03!80},anchor=east] at ([yshift=1.1cm,xshift=-3.5cm]current page.south east)
{\fontsize{9}{9}\selectfont 培优系列};



%画页脚的第二道线
\fill[mydowncolour02]
([yshift=1.9cm,xshift=-2.5cm]current page.south east) -- ([yshift=1.9cm,xshift=1.5cm]current page.south west) -- ([yshift=2cm,xshift=1.5cm]current page.south west) --
([yshift=2cm,xshift=-2.5cm]current page.south east) --cycle;



%画页脚的第一个方框
\draw[mydowncolour02,rounded corners=0.15cm,line width=0.1cm,fill=white,anchor=east] ([yshift=1.45cm,xshift=3.05cm]current page.south west) rectangle ++(0.7,0.7);   
%画页脚的第二个方框    
\draw[mydowncolour01,rounded corners=0.07cm,line width=0.1cm,fill=white,anchor=east] ([yshift=2.22cm,xshift=3.65cm]current page.south west) rectangle ++(0.4,0.4);      

%虚线页边虚线
\draw[loosely dash dot,myedgecolour,line width=2pt,anchor=west] ([yshift=2.8cm,xshift=3.7cm]current page.south west) -- ([yshift=-2.5cm,xshift=3.7cm]current page.north west);

%页边批注
\node[font=\color{red!90},anchor=east] at ([yshift=-2.45cm,xshift=3.5cm]current page.north west)
{\fontsize{21}{21}\myfonta\selectfont 札记};

%页码
%需要设置anchor=west不然遇到页数位数增多出问题
\node[font=\color{blue!60},anchor=east] at ([yshift=2.3cm,xshift=2.7cm]current page.south west)
{\fontsize{12}{12}\myfonta\selectfont \thepage};

%页脚标题
\node[font=\color{mydowncolour03!80},anchor=west] at ([yshift=1.1cm,xshift=4.5cm]current page.south west)
{\fontsize{9}{9}\selectfont  \leftmark};

	\end{tikzpicture}%
}

%\pagestyle{empty}

%定义plain奇数页页眉
\newcommand{\Headeroddplain}{%
	\begin{tikzpicture}[remember picture,overlay]
	
	\fill[myupcolour01]
	%画第一道线
	([yshift=-2cm,xshift=2.5cm]current page.north west) -- ([yshift=-2cm,xshift=12.5cm]current page.north west) -- ([yshift=-1.8cm,xshift=12.5cm]current page.north west) --
	([yshift=-1.8cm,xshift=2.5cm]current page.north west) --cycle;
	%画第二道线
	\fill[myupcolour02]
	([yshift=-1.3cm,xshift=2.5cm]current page.north west) -- ([yshift=-1.3cm,xshift=6cm]current page.north west) -- ([yshift=-1.1cm,xshift=6cm]current page.north west) --
	([yshift=-1.1cm,xshift=2.5cm]current page.north west) --cycle;
	
	%页眉标语
	%\node[font=\color{myupcolour03!80},anchor=west] at ([yshift=-1.25cm,xshift=6.5cm]current page.north west){\fontsize{11}{11}\selectfont 页眉标语};
	
	
	

    \iflogo
    %添加logo
    \node[inner sep=0pt,anchor=east] (whitehead) at ([yshift=-1.3cm,xshift=-1.5cm]current page.north east){\def\svgwidth{0.4\linewidth}\input{picture/logo_svg-tex.pdf_tex}};
    \else
    %\setcounter{poem}{\value{page}}
    %\setcounter{poem}{\thepage}
    \setcounter{poem}{\numexpr\value{page}+1\relax}%若直接采用上面的方法，会在目录第一次编译的时候出问题
    \node [anchor=west,inner sep=0] at ([yshift=-1.17cm,xshift=6.3cm]current page.north west) {\includegraphics[height=1em]{poem/poem-quotes/poem-\thepoem.pdf}};%
    \node [anchor=west,inner sep=0] (name) at ([yshift=-1.85cm,xshift=12.8cm]current page.north west) {	\includegraphics[height=0.8em]{poem/poem-name/poem-\thepoem.pdf}};%
    \node [anchor=west,inner sep=0] (title) at ([yshift=0cm,xshift=0.35cm]name.east) {\includegraphics[height=0.8em]{poem/poem-title/poem-\thepoem.pdf}};%
    \fi
	

	%画页脚的第一道线
	\fill[mydowncolour01]
	([yshift=1.6cm,xshift=2.5cm]current page.south west) -- ([yshift=1.6cm,xshift=-1.5cm]current page.south east) -- ([yshift=1.7cm,xshift=-1.5cm]current page.south east) --
	([yshift=1.7cm,xshift=2.5cm]current page.south west) --cycle;
	
	%页脚标语
	\node[font=\color{mydowncolour03!80},anchor=west] at ([yshift=1.1cm,xshift=3.5cm]current page.south west)
	{\fontsize{9}{9}\selectfont 培优系列};
	

	
	%画页脚的第二道线
	\fill[mydowncolour02]
	([yshift=1.9cm,xshift=2.5cm]current page.south west) -- ([yshift=1.9cm,xshift=-1.5cm]current page.south east) -- ([yshift=2cm,xshift=-1.5cm]current page.south east) --
	([yshift=2cm,xshift=2.5cm]current page.south west) --cycle;
	
	
	
%画页脚的第一个方框
  %  \draw[mydowncolour02,rounded corners=0.15cm,line width=0.1cm,fill=white,anchor=east] ([yshift=1.35cm,xshift=-3.8cm]current page.south east) rectangle ++(1,1);   
%画页脚的第二个方框    
 %    \draw[mydowncolour01,rounded corners=0.1cm,line width=0.1cm,fill=white,anchor=west] ([yshift=2.38cm,xshift=-4.2cm]current page.south east) rectangle ++(0.5,0.5);      

%虚线页边虚线
%\draw[loosely dash dot,myedgecolour,line width=2pt,anchor=east] ([yshift=3.1cm,xshift=-3.8cm]current page.south east) -- ([yshift=-2.5cm,xshift=-3.8cm]current page.north east);

%页边批注
%\node[font=\color{red!90},anchor=west] at ([yshift=-2.7cm,xshift=-3.5cm]current page.north east){\fontsize{23}{23}\myfonta\selectfont 札记};

%页码
%需要设置anchor=west不然遇到页数位数增多出问题
\node[font=\color{blue!60},anchor=west] at ([yshift=2.3cm,xshift=-2.7cm]current page.south east)
{\fontsize{12}{12}\myfonta\selectfont \thepage};

%页脚标题
\node[font=\color{mydowncolour03!80},anchor=east] at ([yshift=1.1cm,xshift=-4.5cm]current page.south east)
{\fontsize{9}{9}\selectfont  \leftmark};

	\end{tikzpicture}%
}
%定义plain偶数页页眉
\newcommand{\Headerevenplain}{%
	\begin{tikzpicture}[remember picture,overlay]
	\fill[myupcolour01]
%画第一道线
([yshift=-2cm,xshift=-2.5cm]current page.north east) -- ([yshift=-2cm,xshift=-12.5cm]current page.north east) -- ([yshift=-1.8cm,xshift=-12.5cm]current page.north east) --
([yshift=-1.8cm,xshift=-2.5cm]current page.north east) --cycle;
%画第二道线
\fill[myupcolour02]
([yshift=-1.3cm,xshift=-2.5cm]current page.north east) -- ([yshift=-1.3cm,xshift=-6cm]current page.north east) -- ([yshift=-1.1cm,xshift=-6cm]current page.north east) --
([yshift=-1.1cm,xshift=-2.5cm]current page.north east) --cycle;

%页眉标语
%\node[font=\color{myupcolour03!80},anchor=east] at ([yshift=-1.25cm,xshift=-6.5cm]current page.north east){\fontsize{11}{11}\selectfont 页眉标语};





\iflogo
%添加logo
\node[inner sep=0pt,anchor=west] (whitehead) at ([yshift=-1.3cm,xshift=1.5cm]current page.north west)
{\def\svgwidth{0.4\linewidth}\input{picture/logo_svg-tex.pdf_tex}};
\else
%\setcounter{poem}{\value{page}}
%\setcounter{poem}{\thepage}
\setcounter{poem}{\numexpr\value{page}+1\relax}%若直接采用上面的方法，会在目录第一次编译的时候出问题
\node [anchor=east,inner sep=0] at ([yshift=-1.17cm,xshift=-6.3cm]current page.north east) {\includegraphics[height=1em]{poem/poem-quotes/poem-\thepoem.pdf}};%
\node [anchor=east,inner sep=0] (title) at ([yshift=-1.85cm,xshift=-12.8cm]current page.north east) {\includegraphics[height=0.8em]{poem/poem-title/poem-\thepoem.pdf}};%
\node [anchor=east,inner sep=0] (name) at ([yshift=0cm,xshift=-0.35cm]title.west) {\includegraphics[height=0.8em]{poem/poem-name/poem-\thepoem.pdf}};%
\fi


%画页脚的第一道线
\fill[mydowncolour01]
([yshift=1.6cm,xshift=-2.5cm]current page.south east) -- ([yshift=1.6cm,xshift=1.5cm]current page.south west) -- ([yshift=1.7cm,xshift=1.5cm]current page.south west) --
([yshift=1.7cm,xshift=-2.5cm]current page.south east) --cycle;

%页脚标语
\node[font=\color{mydowncolour03!80},anchor=east] at ([yshift=1.1cm,xshift=-3.5cm]current page.south east)
{\fontsize{9}{9}\selectfont 培优系列};



%画页脚的第二道线
\fill[mydowncolour02]
([yshift=1.9cm,xshift=-2.5cm]current page.south east) -- ([yshift=1.9cm,xshift=1.5cm]current page.south west) -- ([yshift=2cm,xshift=1.5cm]current page.south west) --
([yshift=2cm,xshift=-2.5cm]current page.south east) --cycle;



%画页脚的第一个方框
%\draw[mydowncolour02,rounded corners=0.15cm,line width=0.1cm,fill=white,anchor=east] ([yshift=1.35cm,xshift=2.9cm]current page.south west) rectangle ++(1,1);   
%画页脚的第二个方框    
%\draw[mydowncolour01,rounded corners=0.1cm,line width=0.1cm,fill=white,anchor=east] ([yshift=2.38cm,xshift=3.75cm]current page.south west) rectangle ++(0.5,0.5);      

%虚线页边虚线
%\draw[loosely dash dot,myedgecolour,line width=2pt,anchor=west] ([yshift=3.1cm,xshift=3.8cm]current page.south west) -- ([yshift=-2.5cm,xshift=3.8cm]current page.north west);

%页边批注
%\node[font=\color{red!90},anchor=east] at ([yshift=-2.7cm,xshift=3.5cm]current page.north west){\fontsize{23}{23}\myfonta\selectfont 札记};

%页码
%需要设置anchor=west不然遇到页数位数增多出问题
\node[font=\color{blue!60},anchor=east] at ([yshift=2.3cm,xshift=2.7cm]current page.south west)
{\fontsize{12}{12}\myfonta\selectfont \thepage};

%页脚标题
\node[font=\color{mydowncolour03!80},anchor=west] at ([yshift=1.1cm,xshift=4.5cm]current page.south west)
{\fontsize{9}{9}\selectfont  \leftmark};

	\end{tikzpicture}%
}


%页脚
\usepackage{fancyhdr}


\fancypagestyle{mypagestyle}{%
	\fancyhf{}% Clear header/footer

	\fancyhead[O]{\protect\Headerodd}% Author on Odd page, Centred
	\fancyhead[E]{\protect\Headereven}% Title on Even page, Centred
	%\fancyfoot[C]{\thepage}%
	\renewcommand{\headrulewidth}{0pt}% Header rule of .4pt
}

\pagestyle{mypagestyle}

\fancypagestyle{plain}{
	\fancyhf{}% Clear header/footer

\fancyhead[O]{\protect\Headerodd}% Author on Odd page, Centred
\fancyhead[E]{\protect\Headereven}% Title on Even page, Centred
%\fancyfoot[C]{\thepage}%
\renewcommand{\headrulewidth}{0pt}% Header rule of .4pt
}

%为目录页眉专门设置
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{mycontentstly}}} 
\fancypagestyle{mycontentstly}{
	\fancyhf{}% Clear header/footer

\fancyhead[O]{\protect\Headeroddplain}% Author on Odd page, Centred
\fancyhead[E]{\protect\Headerevenplain}% Title on Even page, Centred
%\fancyfoot[C]{\thepage}%
\renewcommand{\headrulewidth}{0pt}% Header rule of .4pt
}







%需要放在页眉设置之后

%\newcommand{\mypagenote}{}
%chapter的页眉参数的改写，使用\leftmark引用
\iffalse
\renewcommand\chaptermark[1]{%
	\markboth{\CTEXthechapter \quad #1}}

%section的页眉数的改写，使用\rightmark引用
\renewcommand\sectionmark[1]{%
	\markright{\CTEXifname{\CTEXthesection——}{}#1}}
\fi




%目录格式
%设置目录深度
\setcounter{tocdepth}{1} %设置在 ToC 的显示的章节深度
%\setcounter{secnumdepth}{5} %设置章节的编号深度,chapter，subsection等
%以前的
\iffalse
\titlecontents{part}
         [0em] %目录页的左间距，不能省
         {\heiti \zihao{4} \addvspace{1em}} %设置标题的整体格式，如字体、字体尺寸、与上一个标题的垂直距离等。该参数可空置
         {\contentslabel{1.5em}} %设置标题标志的格式,如序号格式、序号宽度、序号与标题内容之间的间距等，不能为空
         {}%
         {
            %\titlerule*[0.5pc]{$\cdot$}\contentspage\thecontentslabel\hspace*{0em}
          }

\titlecontents{chapter}
         [5.5em] %目录页的左间距，不能省
         {\zihao{5} } %设置标题的整体格式，如字体、字体尺寸、与上一个标题的垂直距离等。该参数可空置
         {\contentslabel[\thecontentslabel]{4em}} %设置标题标志的格式,如序号格式、序号宽度、序号与标题内容之间的间距等，不能为空
         {}%
         {\titlerule*[0.5pc]{$\cdot$}\contentspage\hspace*{0em}}

\titlecontents{section}
         [3em]
         {\songti \zihao{-5} \addvspace{-1pt} }%其中的\addvspace{-1pt}是为调整二级标题在目录中的垂直距离而用，可根据排版效果自行改变
         {\contentslabel{2.5em}}
         {}%
         {\titlerule*[0.5pc]{$\cdot$}\contentspage\hspace*{0em}}

\renewcommand{\contentsname}{目 \quad 录}

\fi

\renewcommand{\contentsname}{目 \quad 录}

%
\definecolor{myblueii01}{RGB}{241,147,156}%春梅红
\definecolor{myblueii02}{RGB}{43,18,22}%李紫
%~~~~~~~~~~~~~~~~~Hyperref Settings~~~~~~~~~~~~~~~~~~~~~~
\hypersetup{%
	pdfborder = {0 0 0},
	colorlinks,
	citecolor=red,
	filecolor=green,
	linkcolor=structurecolor,
	urlcolor=cyan!50!black!90
}

%~~~~~~~~~~~~~~~~~~~~~Fancy ToC~~~~~~~~~~~~~~~~~~~~~~
\contentsmargin{2cm}
\titlecontents{chapter}[4cm]
{\addvspace{13pt}%
	\begin{tikzpicture}[remember picture, overlay]%
	\draw[fill=myblueii01,draw=myblueii01, rounded corners] (-3,-.1) rectangle (-0.8,.5);%
	%\pgftext[left,x=-2.7cm,y=0.2cm]{\color{white}\Large \chaptertitlename\ \thecontentslabel};%%修改
	%\pgftext[left,x=-3cm,y=0.2cm]{\color{white}\Large   \thecontentslabel };%
    \pgftext[left,x=-2.7cm,y=0.2cm]{\color{white}\Large \thecontentslabel};%%修改
	\end{tikzpicture}\color{myblueii02}\large\bfseries}%
{\hspace*{-1em}}
{}
{}%

\titlecontents{section}[2.2cm]
{\color{myblueii02}
\addvspace{-2pt}
%以下为数学采用section标题调整
\color{myblueii02} \large\bfseries \thecontentslabel
 }
{
%一下为数学采用section标题调整
%\contentslabel[\thecontentslabel]{1.3cm}
}
{}
{\hspace*{0.2cm}\titlerule*[0.5pc]{$ \cdots $}\hspace*{2pt}\large\bfseries  \thecontentspage
	}


\iffalse
\makeatletter
\renewcommand{\tableofcontents}{%
	\section*{%
		\vspace*{10\p@}%
		\begin{tikzpicture}[remember picture, overlay]%
		%\pgftext[right,x=0cm,y=0cm]{\color{red}\Huge  目 \qquad 录};%
		\draw[fill=myblueii01,draw=myblueii01, rounded corners=15pt] (2,0) rectangle (15,1.2);%
		%\clip (2,0) rectangle (15,1);
		\pgftext[right,x=9cm,y=0.6cm]{\color{white}\Huge 目 \quad 录};%
		\end{tikzpicture}}%
	\@starttoc{toc}}
\makeatother
\fi

\newcommand{\mulucreat}{
\newgeometry{top=2.6cm,bottom=2.6cm,left=3cm,right=3cm}
\pagestyle{mycontentstly}
\pagenumbering{Roman}%目录页面使用罗马数字
\tableofcontents
%清页，奇数页保证，外加清除背景水印
\clearpage{\backgroundsetup{contents={}}\pagestyle{empty}\cleardoublepage}%
\setcounter{page}{0}
%计数器清零
\pagenumbering{arabic}%正文使用阿拉伯数字
\pagestyle{mypagestyle}
\restoregeometry
}


%特色标题格式
%前期定制的一个标题
\iffalse
\titleformat%
{\chapter}[hang]%
{\bfseries
\vspace{6cm}
}{%
	\begin{minipage}[t]{0.3\linewidth}  
		\vspace{0pt}% do not remove
		\begin{tikzpicture}
		\node[
		outer sep=0pt,
		text width=3.5cm,
		minimum height=3cm,
		fill=myblueii01,
		font=\color{white}\fontsize{80}{90}\selectfont,
		align=center
		] (num) {\S \thechapter};
		\node[
		outer sep=0pt,
		inner sep=0pt,
		anchor=south,
		font=\color{black}\Large\normalfont
		] at ([yshift=3pt]num.north) {\textsc{\CTEXthechapter}};
		\end{tikzpicture}  
	\end{minipage}%
}
{0pt}%
{%
	\begin{minipage}[t]{.7\linewidth}%
		\vspace{2pt} % do not remove
		\rule{\linewidth}{2.5pt}\\\vskip -1.75\baselineskip%
		\rule{\linewidth}{.7pt}
		\vspace{0.25cm}
		\begin{center}
			{\LARGE\textsf{#1}}
		\end{center}
	\vspace{0.3cm}
	\rule{\linewidth}{.7pt}\\\vskip -1.75\baselineskip
	\rule{\linewidth}{2.5pt}
	\vspace{2pt} % do not remove
	\end{minipage}%
}
\fi

\RequirePackage[toc,page,title,titletoc]{appendix}%附录宏包
\RequirePackage{apptools}%附录宏包设置，提供\IfAppendix命令




\titleformat{\chapter}[hang]{\bfseries\vspace{-2.3cm}}
{\filcenter\LARGE\enspace\bfseries{\color{structurecolor}\IfAppendix{附录~\thechapter}{\CTEXthechapter}\enspace}}{1pt}{\bfseries\color{structurecolor}\LARGE#1\filcenter\vspace{-0.7cm}}[]

\titleformat{\section}[hang]{\bfseries}{
  \Large\bfseries{\color{structurecolor}\CTEXthesection}\enspace}{1pt}{%
  \color{structurecolor}\Large\bfseries#1\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\CTEXthesubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries#1\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\CTEXthesubsubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries#1\filright}



%标题格式格式
\ctexset{
	part ={
                format = \centering \heiti \LARGE,
               pagestyle = empty,
		name = {第,章},
		number = \chinese{part},
                aftername = { \qquad },
	}
}

%标题格式格式
\ctexset{
	chapter ={
                format = \centering \heiti \LARGE,
               % pagestyle = empty,
		name = {第,讲},
		number = \arabic{chapter},
                aftername = {\quad},
	}
}
%
\ctexset{
	section ={
       %format = \centering \heiti \zihao{4},
		name = {,},
                aftername = { \ },
		number = \arabic{chapter}.\arabic{section},
	}
}

%%%%

\ctexset{
	subsection ={
		format = \raggedright \heiti \zihao{-4},
        name = {,},
        aftername = { \ },
		number = \arabic{chapter}.\arabic{section}.\arabic{subsection},
	}
}
\ctexset{
	subsubsection ={
		format = \raggedright \heiti \zihao{-4},
        name = {(,)},
		number = \arabic{subsubsection},
	}
}



%各个标题的设置


%分部标题
\newcounter{counter0}
\newcommand{\bt}[1]{
	\refstepcounter{counter0}
    \clearpage{\pagestyle{empty}\cleardoublepage}%%清页，奇数页保证，外加清除背景水印
    %\addcontentsline{toc}{part}{第\chinese{counter0}章 \  #1}
    %\chaptermark{第\chinese{counter0}章 \ #1}
	\part{#1}
    \setcounter{chapter}{0} %part计数器与chapter不相关，手动清零
    \renewcommand{\mypagenote}{#1}
    %\part*{#1}
}
%一级标题
\newcounter{counter1}[counter0]
\newcommand{\bta}[1]{
    %\NoBgThispage
    %\clearpage{\backgroundsetup{contents={}}\pagestyle{empty}\cleardoublepage}%其中的\NoBgThispage是使水印不显示\backgroundsetup{contents={}}控制分页多出的空白页不显示水印
	\refstepcounter{counter1}
\pagestyle{mypagestyle}
    \chapter{#1}
	%\chapter*{第\chinese{counter1}节 \qquad #1}
	%\addcontentsline{toc}{chapter}{#1}
	%\chaptermark{第\chinese{counter1}节 \ \ #1}
    %\renewcommand{\mypagenote}{#1}
	%\songti
	%\zihao{5}
\answxsim{\refstepcounter{answerchp}\setcounter{enumi}{0}}{}
\answxsim{
\item[]
\begin{center}
\color{structurecolor}\zihao{-3}第 \theanswerchp 讲
\end{center}
}{}
}
%二级标题
\newcounter{counter2}[counter1]
\newcommand{\btb}[1]{
    %\clearpage{\backgroundsetup{contents={}}\pagestyle{empty}\cleardoublepage}%其中的\NoBgThispage是使水印不显示
	\refstepcounter{counter2}
    \section{#1}
    %\chaptermark{第\chinese{counter2}节 \ \ #1}
	%\section*{(\chinese{counter2} ) #1}
	%\addcontentsline{toc}{section}{(\chinese{counter2}) #1 }
	%\songti
	%\zihao{5}
}
%%%%%%
%三级标题
\newcounter{counterA}[counter2]
\newcommand{\btc}[1]{
	\refstepcounter{counterA}
    \subsection{#1}
        %\songti
        %\zihao{5}
}
%四级标题
\newcounter{counterB}[counterA]
\newcommand{\btd}[1]{
	\refstepcounter{counterB}
        %\subsubsection*{ (\arabic{counterB}) \!\! {#1}}
        \subsubsection{#1}
        %\songti
        %\zihao{5}
}

%有时候当计数器关联过后，需要在关联的计数器刷新的时候同时刷新下面的计数器
	
	
\numberwithin{equation}{chapter} %令公式的计数器与章节挂钩
	
\numberwithin{figure}{chapter} %令图片的计数器与章节挂钩


\numberwithin{table}{chapter} %令表格的计数器与章节挂钩

%\usepackage{caption}%使用这个宏包，可对图表等标题进行定制


%可以对图片表格等多种属性进行集中设置
\DeclareCaptionLabelFormat{mycaplabelformat}{#1\,#2~}
\captionsetup[figure]{%
  %font={color=red!70!black,bf,it},
  labelformat=mycaplabelformat}


%图片编号，图片标题编号
\renewcommand{\thefigure}{\arabic{figure}}

%对子图的标号作设置
\renewcommand{\thesubfigure}{\text{$ \alph{subfigure} $}}


%\renewcommand{\thetable}{\thesection.\Alph{table}}
%\usepackage{graphicx} %插入图片的宏包
%\usepackage{float} %设置图片浮动位置的宏包
%\usepackage{subfigure} %插入多图时用子图显示的宏包
%\usepackage[]{caption2} %新增调用的宏包
%\renewcommand{\figurename}{Fig.} %重定义编号前缀词
%\renewcommand{\captionlabeldelim}{.~} %重定义分隔符
%\roman是罗马数字编号，\alph是默认的字母编号，\arabic是阿拉伯数字编号，可按需替换下一行的相应位置
%\renewcommand{\thesubfigure}{(\roman{subfigure})}%此外，还可设置图编号显示格式，加括号或者不加括号
%\makeatletter \renewcommand{\@thesubfigure}{\thesubfigure \space}%子图编号与名称的间隔设置
%\renewcommand{\p@subfigure}{} \makeatother

%重定图片义分隔符
%\makeatletter
%\long\def\@makecaption#1#2{% % #2 is argument of \caption and \captionof command     
%	\vskip\abovecaptionskip
%	\sbox\@tempboxa{#2}        % place #2 into a scratch TeX box
%	\ifdim \wd\@tempboxa = 0pt % test if scratch box has zero width
%	\centering #1 \par       % if yes, typeset only #1 (the float's name and number)
%	\else                      % else, proceed with default definition
%	\sbox\@tempboxa{\setmainfont{Times New Roman} \heiti \zihao{5}{#1$ \ $ #2}} %设置图片表格标题样式
%	\ifdim \wd\@tempboxa >\hsize
%	#1: #2\par
%	\else
%	\global \@minipagefalse
%	\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%	\fi
%	\fi
%	\vskip\belowcaptionskip}
%\makeatother
%重定图片义分隔符

\newenvironment{myquote}{\begin{quote}\kaishu\small}{\end{quote}}	%对于引用话语，古籍等做的一个环境设定

%但若要更加精细的定理环境，例如修改编号，修改间距等，则需要安装包 ntheorem
\usepackage{ntheorem} %有问题，暂时不用，与amsthm有冲突
\theoremseparator{ :}
%定理环境
\newtheorem{theorem}{定理}[counter1]

%公理环境
\newtheorem{axiom}{公理}[counter1]

%定义环境
\newtheorem{definition}{定义}[counter1]

%引理环境
\newtheorem{lemma}{引理}[counter1]

%猜想环境
\newcounter{counterguess} %这组计数全局通用
\refstepcounter{counterguess}
\newtheorem{guess}{猜想}[counterguess]

%有时由于分页的问题，脚注会出问题可以使用下面的命令手调
%\setcounter{footnote}{3} %设置脚注

%\usepackage{ulem}

%
%上面的答案显示与隐藏的使用是：\answer{ABC}，其中的[1]为参数个数，#1代表参数
%	
\newcommand{\lmx}[1]{\romannumeral #1}	%罗马数字小写
\newcommand{\lmd}[1]{\uppercase\expandafter{\romannumeral #1}}	%罗马数字大写



%新增加的

%定义平行四边形
\usepackage{tikz}
\newcommand\ps{%
	\mathord{\text{%
			\tikz[baseline]
			\draw ( 0em, .1ex) -- ++ (.9em,0ex) -- ++(.2em, 1.2ex) -- ++(-.9em,0ex) -- cycle;}}}	

%\usepackage[backend=biber,style=gb7714-2015,gbfootbib=true]{biblatex} %backend是选择编译器，gbfootbib是使用国标的脚注显示
%\DeclareFieldFormat{howpublished}{\href{#1}{#1}} %用于参考网页文献网址中含有中文名字是添加正常显示
%\newcommand{\howpublished}[1]{howpublished= {\href{#1}{#1}}}
%\addbibresource{date/参考文献.bib}
%\usetikzlibrary{lindenmayersystems} %画分形图像用
%
%下面是答案的隐藏和显示，此处处理的答案不包括详解，详解部分需另外进行处理
%
\usepackage{multirow}
\usepackage{pdfpages}
\usepackage{wrapfig}
%
%
\usepackage[normalem]{ulem}%下划线\uline{XXX}
%\usepackage{soul}下划线的
\usepackage{diagbox}%斜线表头的制作
\newlength{\keylength}
\newif\ifanswer
\newboolean{print}
\setboolean{print}{true}


\newcommand{\tk}[1]{
	\ifanswer
	%\underline{~#1~}%
\answxsim{
\item
#1
}{}
	\else
	%\settowidth{\keylength}{~#1~}
	%\underline{\hspace{\keylength}}
    %\uline{\hspace{\keylength}}
%注意，此处不能使用\hspace{\keylength}进行填充(在刚好换行的时候会出问题)
%\uline{\hbox to 2cm{}}%长度的问题。暂时没找到解决办法
    %\textcolor{red}{\ul{#1}}
	\fi}


\newcommand{\xzanswer}[1]{%
	\ifanswer
	  $ ( \ \ \ \ ) $
\answxsim{
\item
#1
}{}% $ ( \quad ) $
	\else
      $ ( \quad ) $
	%\phantom{#1}%
	\fi}

%为兼容以前的选择题保留下面的\answer命令
\newcommand{\answer}[1]{%
	\ifanswer
			#1%
	\else
	%\phantom{#1}%
	\fi}
%
%
%
%\usepackage{xcolor}
\makeatletter
\newif\ifstudent
\studenttrue
\newenvironment{master}{%
	\ifstudent\def\@eqnnum{{\normalfont \color{white} (\theequation)}}\color{white}%
	\else\def\@eqnnum{{\normalfont \normalcolor (\theequation)}}\normalcolor%
	\fi}{}
\makeatother

\newcommand{\banswer}[1]{%
	\ifanswer
%    \par
%	%\fbox{%
%		\parbox{\linewidth}{%
%			\vspace{0.5em}
%			\noindent
%			{\heiti{\zihao{-4}解：}}
%			#1%
%			\vspace{0.5em}
%		}%
%	}
\answxsim{
\item
#1
}{}\vfill
    %\vfill %垂直分列，自动划分大题的空白
	\else
	%\phantom{#1}% 
\iffalse 
	\begin{master}
	\fbox{%
		\parbox{\textwidth}{%
			\vspace{0.5em}
			\noindent
			{\heiti{\zihao{-4}解：}}
			#1%
			\vspace{0.5em}
		}%
	}
    \end{master}
\fi
    \vfill %垂直分列，自动划分大题的空白
	\fi}


%题目出处
\newif\ifexwhere
\newcommand{\exwhere}[1]{%
	\ifexwhere
	(#1)%
	\else
	%\phantom{#1}%
	\fi}
%

%\tktrue  %显示填空题答案\printtrue；隐藏填空题答案\printfalse




%填空题填写答案示意：\underline{\hbox to 13mm{\answer{\text{答案}}}}
\usepackage{graphicx}
\usepackage{background}

%背景水印
\iffalse
\backgroundsetup{scale=1,angle=0,opacity=0.15,contents={
		\begin{tikzpicture}[remember picture,overlay]
		\node at ([yshift=300pt,xshift=-200pt]current page.center)
		{\includegraphics[width=10cm]{2.png}};
		\end{tikzpicture}
}}
\fi
\backgroundsetup{contents={}}


\usepackage{wrapfig} 
\usepackage{enumitem}
\usepackage{enumerate}
\newlength\baoxwidth
\setlength\baoxwidth{0ex}

\usepackage{svg}

%
%定义弧形
%
\iffalse
\usepackage{xwatermark}
\usepackage{arcs}
\usepackage{etoolbox}
\makeatletter
\providecommand\@gobblefour[4]{}
\patchcmd{\over@under@arc}
{\@gobbletwo}
{\@gobblethree}
{\@gobblefour}
{}{}{}
\makeatother
\fi

%上面定义的弧形不能使用角标，遂改成下面的形式
\makeatletter
\DeclareFontFamily{U}{tipa}{}
\DeclareFontShape{U}{tipa}{m}{n}{<->tipa10}{}
\newcommand{\arc@char}{{\usefont{U}{tipa}{m}{n}\symbol{62}}}%

\newcommand{\overarc}[1]{\mathpalette\arc@arc{#1}}

\newcommand{\arc@arc}[2]{%
  \sbox0{$\m@th#1#2$}%
  \vbox{
    \hbox{\resizebox{\wd0}{\height}{\arc@char}}
    \nointerlineskip
    \box0
  }%
}
\makeatother
%
%定义弧形
%

%\usepackage{longtable}

\usepackage{tabularx}

%
%表格内换行
%
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}} 
%
%引用格式\tabincell{c}{内容\\内容}
%

%
%对选择题的四个选项处理
%\usepackage{tasks}%也可以使用
%
\usepackage{multienum}%新加多列的列表环境
%前期使用enumerate作为四个选项四行的模式，再使用tabularx作为四个选项二行或者一行的模式
%此时有问题，例如选择题上下边距和左右边距的控制上不够统一
%采用multienumerate环境，或者tabularx环境，多栏环境，再或者tasks环境，等.均不合我意。

%下面是采用自己的方法，对选择题做了特别的适配
%测试环境为enumerate

%六个选项的处理
\newcommand{\sixchoices}[6]
{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#2\strut}%
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#3\strut}%
\\
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#4\strut}%
\\
\parbox[t]%
{1.5em}{\hfill E.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#5\strut}
	\\
\parbox[t]%
{1.5em}{\hfill F.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#6\strut}	
%\vspace{\parskip}
\par
}



%五个选项的处理
\newcommand{\fivechoices}[5]
{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#2\strut}%
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#3\strut}%
\\
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#4\strut}%
\\
\parbox[t]%
{1.5em}{\hfill E.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#5\strut}
%\vspace{\parskip}
\par
}

%四个选项的处理
\usepackage{xstring,xifthen}
\newlength{\choicelengtha}
\newlength{\choicelengthb}
\newlength{\choicelengthc}
\newlength{\choicelengthd}
\newlength{\choicelengthe}
\newlength{\maxlength}
\newcommand{\fourchoices}[4]
{
	\settowidth{\choicelengtha}{A.~#1~}
	\settowidth{\choicelengthb}{B.~#2~}
	\settowidth{\choicelengthc}{C.~#3~}
	\settowidth{\choicelengthd}{D.~#4~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\maxlength>0.49\linewidth}}%万事留一线(防止意外)
	{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#2\strut}%
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#3\strut}%
\\
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut%\raggedright%使用\raggedright会导致超长公式不能自动换行
	#4\strut}%
%\vspace{\parskip}
\par
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.24\linewidth}}%万事留一线(防止意外)
		{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#1}\hfill%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#2}
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#3}\hfill%
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\strut\raggedright%
	#4\strut}
%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
\par
		}
		{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#1}\hfill%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#2}\hfill%
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#3}\hfill%
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\strut\raggedright%
	#4\strut}
%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
\par
		}
	}
}



%对与四个选项为图像时进行特殊处理

\newcommand{\pfourchoices}[4]
{
	\settowidth{\choicelengtha}{A.~#1~}
	\settowidth{\choicelengthb}{B.~#2~}
	\settowidth{\choicelengthc}{C.~#3~}
	\settowidth{\choicelengthd}{D.~#4~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\maxlength>0.49\linewidth}}%万事留一线(防止意外)
	{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#2\strut}%
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#3\strut}%
\\
\parbox[t]%
{1.5em}{\hfill D.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#4\strut}%
%\vspace{\parskip}
\par
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.24\linewidth}}%万事留一线(防止意外)
		{
\par
\noindent
\begin{minipage}[h!]{0.49\linewidth}
 	\centering
 	#1\par
 	A.\vspace{1.5em}
\end{minipage}
 \hfill
\begin{minipage}[h!]{0.49\linewidth}
 	\centering
 	#2\par
 	B.\vspace{1.5em}
 \end{minipage}
\\
\begin{minipage}[h!]{0.49\linewidth}
 	\centering
 	#3\par
 	C.\vspace{0.9em}
\end{minipage}
 \hfil
\begin{minipage}[h!]{0.49\linewidth}
 	\centering
 	#4\par
 	D.\vspace{0.9em}
 \end{minipage}
%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
\par
		}
		{
\par
\noindent
\begin{minipage}[t]{0.245\linewidth}
 	\centering
 	#1\par
 	A.\vspace{0.9em}
 \end{minipage}
\begin{minipage}[t]{0.245\linewidth}
 	\centering
 	#2\par
 	B.\vspace{0.9em}
 \end{minipage}
\begin{minipage}[t]{0.245\linewidth}
 	\centering
 	#3\par
 	C.\vspace{0.9em}
 \end{minipage}
\begin{minipage}[t]{0.245\linewidth}
 	\centering
 	#4\par
 	D.\vspace{0.9em}
 \end{minipage}
%\vspace{\parskip} %这里，当有四个的时候自动会有parskip空行，原因未知
\par
		}
	}
}


%对选择题的三个选项处理
\newlength{\threechoicelengtha}
\newlength{\threechoicelengthb}
\newlength{\threechoicelengthc}
\newlength{\threemaxlength}
\newcommand{\threechoices}[3]
{
	\settowidth{\threechoicelengtha}{A.~#1~}
	\settowidth{\threechoicelengthb}{B.~#2~}
	\settowidth{\threechoicelengthc}{C.~#3~}
	\ifthenelse{\lengthtest{\threechoicelengtha>\threechoicelengthb}}{\setlength{\threemaxlength}{\threechoicelengtha}}{\setlength{\threemaxlength}{\threechoicelengthb}}
	\ifthenelse{\lengthtest{\threechoicelengthc>\threemaxlength}}{\setlength{\threemaxlength}{\threechoicelengthc}}{}
	\ifthenelse{\lengthtest{\threemaxlength>0.49\linewidth}}
	{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#2\strut}%
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#3\strut}%
%\vspace{\parskip}
\par
	}
	{
		\ifthenelse{\lengthtest{\threemaxlength>0.24\linewidth}}
		{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#1}\hfill%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#2}
\\
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\strut\raggedright%
	#3\strut}\hfill%
%\vspace{\parskip}
\par
		}
		{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#1}%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\raggedright%
	#2}%
\parbox[t]%
{1.5em}{\hfill C.}\hskip0.2em%
\parbox[t]{0.25\linewidth-1.7em}{\strut\raggedright%
	#3\strut}\hfill%
%\vspace{\parskip}
\par
		}
	}
}


%对于两个选项的设置
\newlength{\twochoicelengtha}
\newlength{\twochoicelengthb}
\newlength{\twomaxlength}
\newcommand{\twochoices}[2]{
\settowidth{\twochoicelengtha}{A.~#1~}
\settowidth{\twochoicelengthb}{B.~#2~}
\ifthenelse{\lengthtest{\twochoicelengtha>\twochoicelengthb}}{\setlength{\twomaxlength}{\twochoicelengtha}}{\setlength{\twomaxlength}{\twochoicelengthb}}

\ifthenelse{\lengthtest{\twomaxlength>0.49\linewidth}}
	{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#1\strut}%
\\
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{\linewidth-1.7em}{\strut\raggedright%
	#2\strut}%
%\vspace{\parskip}
\par
	}
	{
\par
\noindent
\parbox[t]%
{1.5em}{\hfill A.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\raggedright%
	#1}\hfill%
\parbox[t]%
{1.5em}{\hfill B.}\hskip0.2em%
\parbox[t]{0.5\linewidth-1.7em}{\strut\raggedright%
	#2\strut}
%\vspace{\parskip} %这里，当有二个的时候自动会有parskip空行，原因未知
\par
	}

}





%
%
%完型填空
%
\newcounter{counterwanxin}[enumi]
\newcommand{\cloze}{
\refstepcounter{counterwanxin}\uline{~~~\arabic{counterwanxin}~~~}~
}


%%



%
%下面的格式是为试卷设计用的，一般注释掉，采用试卷时可以将其打开
%
\iffalse
\usepackage{lastpage}%用于计算总页数
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
%\fancyfoot[CO,CE]{第~\thepage~页~~共~\pageref{LastPage}~页}
\fancyfoot[CO,CE]{第~\thepage~页}
\fancyhead[RE]{\leavevmode\vbox to0pt{
		\vss\rlap{\putzdxx }\vskip -26cm }} %奇数页眉的右边                       
\fancyhead[LO]{\leavevmode\vbox to0pt{
		\vss\rlap{\putzdx }\vskip -26cm }} %偶数页眉的左边 

\newsavebox{\zdxa}%装订线

\sbox{\zdxa}
{\parbox{27cm}{\centering \heiti \hspace{1cm}
		科~目：\underline{\makebox[30mm][c]{英语}}~~~ 班~级：\underline{\makebox[45mm][c]{}}~~~ 姓~名：\underline{\makebox[30mm][c]{}} \\
		\vspace{1mm}
%		请在所附答题纸上空出密封位置。并填写试卷序号、班级、学号和 姓名\\
		%答题时学号
%		\vspace{1mm}
	  \dotfill{} 密 \dotfill{} 封 \dotfill{} 装 \dotfill{} 订 \dotfill{} 线 \dotfill{} \\
}}
\newsavebox{\zdxb}%装订线
\sbox{\zdxb}
{\parbox{27cm}{\centering \heiti
		\vspace{30mm}
		\vspace{1mm}
		\dotfill{} 密 \dotfill{} 封 \dotfill{} 装 \dotfill{} 订 \dotfill{} 线 \dotfill{} \\
}}

\newcommand{\putzdx}{
		\hspace{-1.7cm}\parbox{1cm}{\vspace{-1.5cm}
			\rotatebox[origin=c]{90}{
				\usebox{\zdxa}
		}}
}
\newcommand{\putzdxx}{
	\hspace{0.3cm}\parbox{1cm}{\vspace{-1.5cm}
		\rotatebox[origin=c]{-90}{
			\usebox{\zdxb}
	}}
}
%
%试卷格式完
%
\fi


%
%还原短文(英语)
%
%下划线空段不要用\quad之类生成(在分行时无效)
%
\newcounter{counterduanweng}[enumi]
\newcommand{\clozeduan}{
\refstepcounter{counterwanxin}\arabic{counterwanxin}.~\uline{\hbox to 13mm{}}~
}

\newcounter{counterduanwengl}[enumi]
\newcommand{\clozeduanl}{
\refstepcounter{counterwanxin}\arabic{counterwanxin}.~\uline{\hbox to 33mm{}}~
}


%%
%

%仅作为填空题的位置,包含答案的请使用\tk{}
%
\newcommand{\underlinegap}{
\hspace{-0.33em}\uline{\hbox to 13mm{}}
}

%更小的短横线站位
\newcommand{\ulinesmallgap}{
\hspace{-0.33em}\uline{\hbox to 8mm{}}
}

%%


%选词填空
%

\newcommand{\xctk}[1]{
%\vspace{-2em}%是在列表环境中使用的补丁
\begin{center}
%\spaceskip=1em %%设置空格长度(字间距)
%\refstepcounter{enumi}
\fbox{
\shortstack[c]{	%添加这个是为了在盒子里面实现换行
#1	
}
}
\end{center}
}

%%

%首字母提示填空
%
%
%下划线空段不要用\quad之类生成(在分行时无效)
%
\newcounter{firstlettertk}[enumi]
\newcommand{\firstlettertk}[1]{
\refstepcounter{firstlettertk}\arabic{firstlettertk}.~\uline{#1 \hbox to 13mm{}}
}
%\setcounter{enumi}{\value{enumi}+1}这句话是为了跟enumi的更新同步所设置的，视情况修改
%%


%\usepackage{tipa}%音标与特殊字符 与使用\chapter命令有冲突
%\usepackage{tipx}%音标与特殊字符 与使用\chapter命令有冲突


%
%可以定义双栏虚线表示
%
\iffalse
\usepackage{xpatch}
\makeatletter
\xpatchcmd{\@outputdblcol}{\vrule\@width\columnseprule}{\rotatebox{90}{\parbox{\textheight}{\dotfill}}}{}{}
\makeatother
\fi
%
%

%
\usepackage{multicol} %用于实现在同一页中实现不同的分栏 \columnseprule=1pt %实现插入分隔线
%设置文中双栏的分隔符
\makeatletter
\def\columnseprulecolor\vrule\@width\columnseprule{%
	\vbox to \ht\mult@rightbox{\leaders\vbox{\kern2pt\hbox{.}\kern2pt}\vfill}}
\makeatother
%
%

%\usepackage{longtable}%单栏长表格用
%\usepackage{supertabular}%双栏长表格用

%
%英文试卷中的对话环境
%
\usepackage{xparse} %指定命令参数「类型」
%由xparse定义新命令
%\newlength{\transcriptlen}
\NewDocumentCommand {\setspeaker} { mo } {%
	\IfNoValueTF{#2}
	{\expandafter\newcommand\csname#1\endcsname{\item[#1 :]}}%
	{\expandafter\newcommand\csname#1\endcsname{\item[#2 :]}}%
	%\IfNoValueTF{#2}
	%{\settowidth{\transcriptlen}{#1}}%
	%{\settowidth{\transcriptlen}{#2}}%
}
%
%参数设定方式\setspeaker{A}[shui]，在enumerate环境中直接应用就 \A 引用(\C被系统内部不用，不要用C作为参数)
%

%田字格
%\begin{tikzpicture} 
%\draw  [dashed,step=1,line width =0.5pt](0,0)grid(2,2);
%\end{tikzpicture}
%田字格

%\RequirePackage{exam}

\usepackage{mhchem}%普通化学公式
%\usepackage{chemfig}%复杂有机化学公式
%化学中标化合价可以使用简便的方法\overset{}{}命令即可，也可以使用\stackrel{above}{under}
\usepackage{extarrows} % 箭头扩展(长箭头)
\newcommand{\changdenghao}[2]{
\text{$  \xlongequal[\text{#2}]{\text{#1}} $} %套用text环境，为了能在化学方程式里愉快使用对齐
}
\newcommand{\danhengxian}[1]{
	%\settowidth{\danhengxianlength}{~#1~}
\text{%
		\tikz[baseline]
		\draw ( 0em, .6ex) -- node[very thick,above,yshift=-0.4ex,font=\fontsize{10}{10}\selectfont]{\text{#1}}  (1.5em,.6ex);
	}
}

%到右边的下横线
\newcommand{\hfullline}{\hrulefill \ }

\usepackage{gensymb} %定义温度单位\celsius ，度单位\degree。电阻单位\ohm，千分号\perthousand，

%电流表
\newcommand{\ammetermytikz}{%
  \begin{tikzpicture}[baseline=-0.4em]
    \node[draw,circle,inner sep=1.6pt, outer sep=1.6pt] (4,0) {{\zihao{-5}A}};
  \end{tikzpicture}
}

%电压表
\newcommand{\voltmetermytikz}{%
  \begin{tikzpicture}[baseline=-0.4em]
    \node[draw,circle,inner sep=1.6pt, outer sep=1.6pt] (4,0) {{\zihao{-5}V}};
  \end{tikzpicture}
}


%微安表头
\newcommand{\uammetermytikz}{%
  \begin{tikzpicture}[baseline=-0.4em]
    \node[draw,circle,inner sep=1pt, outer sep=1pt] (4,0) {{\zihao{-6}$\mu$A}};
  \end{tikzpicture}
}

%毫安表头
\newcommand{\mammetermytikz}{%
  \begin{tikzpicture}[baseline=-0.4em]
    \node[draw,circle,inner sep=0.6pt, outer sep=0.6pt] (4,0) {{\zihao{-6}mA}};
  \end{tikzpicture}
}

%到右边的下横线(右边空0.3\linewidth)
\newcommand{\hthreefullline}[1][]{
\hrulefill \ #1 \hbox to 0.3\linewidth{}
}
%使用\hthreefullline 或者hthreefullline[;]
%可选参数示例
%\newcommand{\sec}[2][]{
%    \section*{#1
%        \ifsecondargument
%            and #2
%        \fi}
%    }
%}

\newcommand{\htwofullline}[1][]{
\hrulefill \ #1 \hbox to 0.2\linewidth{}
}

\newcommand{\honefullline}[1][]{
\hrulefill \ #1 \hbox to 0.1\linewidth{}
}



%定义自己的列表环境
\newlist{mylistnameabc}{enumerate}{3} %最后的数字3表示嵌套的层数
%名字后面的数字代表嵌套深度
\setlist[mylistnameabc,1]{label=你\themylistnameii..}
\setlist[mylistnameabc,2]{label=你\themylistnameii.}
\setlist[mylistnameabc,3]{label=w\themylistnameiii.}

%\usepackage{longtable}%长表格，跨页表格，没有作用，冲突待查
%\usepackage{supertabular}%长表格，跨页表格
\usepackage{lipsum} %产生英文的假文，使用 \lipsum[1]

%定义圆形，使用如\tikzcircle{2pt}，或者\tikzcircle[green, fill=blue]{1.5pt}
\newcommand{\tikzcircle}[2][red,fill=red]{\tikz[baseline=-0.5ex]\draw[#1,radius=#2] (0,0) circle ;}%

\usepackage{xpinyin} %拼音宏包
%\xpinyin [⟨options⟩] {⟨单个汉字⟩} {⟨拼音⟩}
%\xpinyin* [⟨options⟩] {⟨文字⟩} 自动注音
%\pinyin [⟨options⟩] {⟨拼音⟩} %拼音输出，用于输出拼音，为了输入的方便 ü 可以用 v 代替，例\pinyin{lv2zi}

%页注
\definecolor{todonotes01}{RGB}{0,128,128} 
\usepackage[backgroundcolor=todonotes01!18,bordercolor=todonotes01,linecolor=red!50,textsize=small,shadow]{todonotes} %边注(margin notes)小能手,其中的textwidth=3.6cm是根据页边线(竖线)与页边的距离设定，注意textwidth若在这里设置为由于奇偶分页导致偶数页的距离出问题，在前面进行设置即可
%\usepackage{xcolor}

\newcommand{\tipword}[1]{\colorlet{currentcolor}{.}{\color{red}\fbox{\color{currentcolor}#1}}}
\newcommand{\tipitself}[1]{\todo[backgroundcolor=white,bordercolor=red,fancyline]{#1}}
\newcommand{\makemargintip}[2]{\tipword{#1}\tipitself{#2}}

%\usepackage{soul} %不支持中文 %高亮文字用，如果没有加color包,那么 hl 命令就跟下划线命令一样. 通常hl是预设黄色的\hl{#1}



%前面已引用\usepackage[normalem]{ulem} % use normalem to protect \emph
\newcommand{\texthlight}{\bgroup\markoverwith
	{\textcolor{yellow!50}{\rule[-.5ex]{2pt}{2.5ex}}}\ULon}
\newcommand{\texthl}[1]{\IN{#1}\texthlight{#1}}
	
%对于文字的高亮也可以使用\colorbox{yellow!20}{使用colorbox包来实现高亮}
%使用\colorbox的话会有额外的空格产生，不推荐

%添加边注并高亮显示文字
%解决命令前面与后面可能产生的空格问题
%去掉命令前后的空格
%\newcommand{\hltodonote}[2]{\texthlight{#1}\todo{#2}}
%其中\ignorespaces是去掉后面的空格
%\unskip是去掉前面的空格
%\leavevmode是防止在行首或段首出现奇怪的问题
%添加边注并高亮显示文字
\newcommand{\hltodonote}[2]{%
\leavevmode\unskip%
\texthl{#1}\todo{#2}%
\ignorespaces%
}



%行类模式，可以在浮动体类使用
\newcommand{\todonotein}[1]{
\vspace{0.8em}
\todo[inline]{#1}
\vspace{0.3em}
}


\usepackage{framed}%高亮显示某一段文字，允许换页，需要xclor宏包颜色支持
\colorlet{shadecolor}{blue!18} %设置framed高亮的颜色

\newcommand{\hlparagraph}[1]{\begin{shaded}
#1
\end{shaded}}

%小提示
\newtheorem{snotes}{提示}[counter2]
%\renewcommand{\thesnotes}{1212}
\newcommand{\smallnotes}[1]{
\par
\vspace{0.6em}
\begin{minipage}[h!]{1\linewidth}
\begin{shaded}
\setlength{\parindent}{0em} %设置缩进
%notes : \\%\uwave{波浪线} \usepackage{ulem}
\small
\begin{snotes}
	\uline{#1}
\end{snotes}
\end{shaded}
\end{minipage}
\par}


%Example \hlfix{wrong text}{fix text}~continues here.

%需要缩进的地方使用(例如完型填空，阅读理解等)
\newcommand{\indentsj}[1]{
{
	\setlength{\parindent}{2em}
#1
}
}


%五级标题题号说明
%题目说明环境设置(例如填空、解答、根据句意填写出所缺的单词(每小题2分,共10分))
%由于没有\subsubsubsection，需要自己定义，下面的定义依赖于\usepackage{titlesec}
\titleclass{\subsubsubsection}{straight}[\subsection]

\newcounter{subsubsubsection}[subsubsection]

\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\renewcommand\theparagraph{\thesubsubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph{\theparagraph.\arabic{subparagraph}}

\titleformat{\subsubsubsection}
  {\normalfont\small\bfseries}{\thesubsubsubsection}{1em}{}
\titlespacing*{\subsubsubsection}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@paragraph{6}
\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
\def\l@paragraph{\@dottedtocline{5}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{6}{14em}{6em}}
\@addtoreset{subsubsubsection}{section}
\@addtoreset{subsubsubsection}{subsection}
\@addtoreset{paragraph}{subsubsubsection}
\makeatother
\newcounter{counterC}[counterB]

%定义好了\subsubsubsection后，开始定义文中使用的命令
\newcommand{\bte}[1]{
\refstepcounter{counterC}
\subsubsubsection*{\Roman{counterC}.  #1}
}

%听力填空
%
%
%下划线空段不要用\quad之类生成(在分行时无效)
%
\newcounter{listentk}[counterC]
\newcommand{\listentk}{
\refstepcounter{listentk}\arabic{listentk}.~\uline{ \hbox to 13mm{}}
}
%\setcounter{enumi}{\value{enumi}+1}这句话是为了跟enumi的更新同步所设置的，视情况修改
%%


%打勾可使用\checkmark，打叉可用\times
%表示循环小数上的点可用\dot{}或者\overset[]{}

%定义行内插入图形命令(采用一般插入的会导致上下间距不协调)
\newcommand{\hlinepicture}[1]{\tikz[baseline=-0.7ex]\node at (0,0) {#1};}%

%下面是ulem提供的一些实用命令：
% \uline{下划线} \
% \uuline{双下划线} \	
% \dashuline{虚下划线} \	
% \dotuline{点下划线} \
% \uwave{波浪线} \
% \sout{删除线} \
% \xout{斜删除线}
%上面的那些对于中文来说不太好使，对于中文可采用\usepackage{CJKfntef}
\usepackage{CJKfntef}
%加点\CJKunderdot{中文}
%下划线\CJKunderline{中文}
%波浪线\CJKunderwave{中文}
%删除线\CJKxout{中文}
%双下划线\CJKunderdblline{中文}

%使用tikz绘制带圈的数字
%如果需要用在列表中，则因为「脆弱命令」的问题，需要处理一下。这里我们选择使用 etoolbox 宏包提供的 \robustify 来处理一下，可结合 enumitem 宏包使用，
\usepackage{etoolbox}
\newcommand{\decircled}[2][]{\tikz[baseline=(char.base)]
	{\node[shape = circle, draw, inner sep = 1pt]
		(char) {\phantom{\ifblank{#1}{#2}{#1}}};%
		\node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\decircled}

%对于例题练习题采用特殊的颜色方框
\definecolor{exmp}{RGB}{106, 186, 73}
%例题标号格式
\newcommand{\examplelabA}{\renewcommand{\labelenumi}{\colorbox{exmp}{\textcolor{white}{\ 例\arabic{enumi}\ }}}}
%练习标号格式
\newcommand{\examplelabB}{\renewcommand{\labelenumi}{\colorbox{violet!60}{\textcolor{white}{\ 例\arabic{enumi}\ }}}}

\usepackage{bm}%粗斜体，印刷向量的时候用，使用\bm{}
\usepackage{esvect}%矢量加箭头，使用  \vec{a} 或者 \vv{a}

%使用Gnumeric生成的LaTeX2e表格
\def\inputGnumericTable{}
\usepackage{ucs}
\usepackage{inputenc} 
\usepackage{color}
\usepackage{array} 
\usepackage{longtable} 
\usepackage{calc}  
\usepackage{multirow} 
\usepackage{hhline} 
\usepackage{ifthen} 
\usepackage{lscape}                    

%新行间距
\newcommand{\newlinespread}[2]
{
{\linespread{#1}\selectfont            %1.5倍行距
#2
\par}
}



%基于elegantbook模板的一些样式控制
%颜色的定义
\definecolor{structurecolor}{RGB}{60,113,183}
\definecolor{main}{RGB}{0,166,82}%
\definecolor{second}{RGB}{255,134,24}%
\definecolor{third}{RGB}{0,174,247}%

%彩色文本框，主要有想一想、定理、定律
\RequirePackage[most]{tcolorbox}
% \newlength{\normalparindent}
% \setlength{\normalparindent}{\parindent}
  \tcbset{
    common/.style={
      fontupper=\kaishu,
      lower separated=false,
      % before upper={\setlength{\parindent}{\normalparindent}},
      coltitle=white,
      colback=gray!5,
      boxrule=0.5pt,
      fonttitle=\bfseries,
      enhanced,
      breakable,
      top=8pt,
      before skip=8pt,
      attach boxed title to top left={
        yshift=-0.11in,
        xshift=0.15in},
      boxed title style={
        boxrule=0pt,
        colframe=white,
        arc=0pt,
        outer arc=0pt},
      separator sign={.},},
    defstyle/.style={
      common,
      colframe=main,  
      colback=main!5,
      colbacktitle=main, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{main}{$\clubsuit$}};}},
    thmstyle/.style={
      common,
      colframe=second,  
      colback=second!5,
      colbacktitle=second, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{second}{$\heartsuit$}};}},
    propstyle/.style={
      common,
      colframe=third,  
      colback=third!5,
      colbacktitle=third, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{third}{$\spadesuit$}};}},}
 % \newtcbtheorem[auto counter,number within=chapter]{definition}{\definitionname}{defstyle}{def}
\DeclareTColorBox[auto counter,number within=chapter]{thinks}{ o t\label g }{
  common,defstyle,
  IfValueTF={#1}{title={想一想}}{title=想一想},
  IfBooleanTF={#2}{label=#3}{}} 


\DeclareTColorBox[auto counter,number within=chapter]{theorem}{ o t\label g }{
    common,thmstyle,
    IfValueTF={#1}{title={#1}}{title=定理},
    IfBooleanTF={#2}{label=#3}{}}

\DeclareTColorBox[auto counter,number within=chapter]{law}{ o t\label g }{
  common,propstyle,
  IfValueTF={#1}{title={#1}}{title=定律},
  IfBooleanTF={#2}{label=#3}{}}

\DeclareTColorBox[auto counter,number within=chapter]{add}{ o t\label g }{
  common,propstyle,
  IfValueTF={#1}{title={#1}}{title=补充~\thetcbcounter},
  IfBooleanTF={#2}{label=#3}{}}

%下面主要是题中的一些标号，主要有性质、结论、笔记等
\usepackage{manfnt}%其中的manfnt提供\textdbend的一个图形命令。包中还有很多图形命令
\newenvironment{note}{
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\textdbend~}
    \textbf{\color{second}笔记}~\kaishu}{\par}
\newenvironment{conclusion}{\par\noindent\textbf{\color{third}结论} \kaishu}{\par}
\newenvironment{property}{\par\noindent\textbf{\color{third}性质} \kaishu}{\par}

%置于每章开头前的一些简短介绍
\RequirePackage{multicol}%多行排列
\tcbset{
  introductionsty/.style={
    enhanced,
    breakable,
    colback=structurecolor!10,
    colframe=structurecolor,
    fonttitle=\bfseries,
    colbacktitle=structurecolor,
    fontupper=\kaishu,
    attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
    boxrule=0pt,
    toprule=0.5pt,
    bottomrule=0.5pt,
    top=8pt,
    before skip=8pt,
    sharp corners
  },
}


\RequirePackage{bbding}%提供\SquareShadowBottomRight这一个方框图形，包中还有很多图形

\newenvironment{introduction}[1][内容摘要]{
  \begin{tcolorbox}[introductionsty,title={#1}]
    \begin{multicols}{2}
      \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]
\setlength{\itemsep}{-0.5em}
}{
      \end{itemize}
    \end{multicols}
  \end{tcolorbox}}

\renewcommand{\chaptername}{第~\zhnumber{\arabic{chapter}}~章}

%课后练习环境
%\RequirePackage{hyperref}%这个包跟超链接有关
%其中的\phantomsection命令，是为了让超链接能够正确链接，一般是加入目录用
\RequirePackage{adforn}%这也是一个图形的宏包，习题标题中的\adftripleflourishleft和\adftripleflourishright
\newenvironment{problemset}[1][习 \quad 题]{
  \begin{center}
  \vspace*{0.5em}
    \phantomsection\addcontentsline{toc}{section}{\texorpdfstring{习 \quad 题}{习 \quad 题}}
    \textcolor{structurecolor}{\Large\bfseries\adftripleflourishleft~#1~\adftripleflourishright}
  \end{center}
  \vspace{1em}
  \begin{enumerate}
  \examplelabA
\renewcommand{\labelenumii}{\color{structurecolor}(\arabic{enumii})}
}{
  \end{enumerate}}

%修改历史环境
% add the list of change history
\newcommand{\updatename}{更新：}
\newcommand{\dateinfoline}[2]{
  \noindent\makebox[3em][r]{%
  \makebox[-5em][r]{%
    \textbf{\textcolor{structurecolor}{#1}}}\quad}%
  {\kaishu\updatename\ignorespaces#2}}

\newcommand{\datechange}[2]{%
  \noindent{\makebox[\textwidth][r]{\color{structurecolor}\rule{1.1\textwidth}{.4pt}}}
  \dateinfoline{#1}{#2}
  \addcontentsline{dates}{section}{#1 -- #2}}

%下面这个是以目录的方式列出改变项，在我这里有点小问题，等待修复
\iffalse
\newcommand{\listofchanges}{%
  \begingroup
    %\renewcommand{\contentsname}{修改历史}
    \let\old@starttoc\@starttoc
    \def\@starttoc##1{
      \old@starttoc{dates}}
    \tableofcontents%
  \endgroup}
% https://tex.stackexchange.com/questions/472931/list-of-all-dates-in-a-document
\fi

%带圆圈的数字
%\usetikzlibrary{backgrounds,calc,shadows}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
%  https://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers



\newenvironment{change}{
  \begin{enumerate}[label=\small\protect\circled{\arabic*}]}{
  \end{enumerate}}

\newcommand{\changdate}{
%\pagestyle{mycontentstly}
\fancyhf{}
\fancyfoot[c]{\color{structurecolor}-~\thepage~-}
\begin{center}
  \vspace*{0.5em}
    %\phantomsection\addcontentsline{toc}{chapter}{\texorpdfstring{更改日志}{更改日志}}
    \textcolor{structurecolor}{\Large\bfseries\adftripleflourishleft~更改日志~\adftripleflourishright}
  \end{center}
  \vspace{2.5em}
}


%文中有一个希腊词语，需要显示
\usepackage{fontspec}%字体设定宏包
\newfontfamily\greecesymbolsfont{Calibri}
\newcommand{\greecesymbols}[1]{{\greecesymbolsfont#1}}

%使用{\greecesymbols 希腊词语}
%同理，如果需要使用音标，引入音标字体直接粘贴复制即可
\newfontfamily\fontipafont{Gentium Plus}
\newcommand{\fontipa}[1]{{\fontipafont#1}}

%对于附录的标号单独设置
\newcommand{\fululable}
{
\ctexset{
	section ={
		%format = \centering \heiti \zihao{4},
		name = {,},
		aftername = { \ },
		number = \Alph{chapter}.\arabic{section},
	}
}
\ctexset{
	subsection ={
		%format = \centering \heiti \zihao{4},
		name = {,},
		aftername = { \ },
		number = \Alph{chapter}.\arabic{section}.\subarabic{section},
	}
}
}



%注：为图片或者表格添加标题（在浮动体里面插入图片和表格）
%\captionof{figure}{name}


\usepackage{wrapfig}%图片浮动宏包

\usepackage{tablefootnote}%在表格中引入脚注，使用命令为\tablefootnote{内容}

%important part starts here
%下面两个是开启在浮动体中使用边注的命令，不过如果边注内容较多又挨得紧，会出现内容重叠的情况
%\usepackage{marginnote}
%\renewcommand{\marginpar}{\marginnote}


%下面是手动设置浮动体内的页边注
%里面设置了一个位置高度可选参数用于内容重叠时的手动调整
%使用方法\floatmarginnote[-3cm]{浮动体边注}
\usepackage{ifoddpage}%奇偶数页判断
\usetikzlibrary{tikzmark}
\usepackage{calc}
%新的计数器，用于\tikzmarknode的命名
\newcounter{floatmargintikz}
%一个彩色文本框，与todo的一致
\newtcolorbox{mybox}{breakable, width=0.98\marginparwidth,colframe=todonotes01,colback=todonotes01!18,boxrule=0.5pt,arc=4pt,
	boxsep=-3pt,left=6pt,right=6pt,top=6pt,bottom=6pt,}

\newcommand{\floatmarginnote}[2][0pt]{%
\checkoddpage%
\ifoddpage%
\refstepcounter{floatmargintikz}%
\tikzmarknode{marginfist\thefloatmargintikz}{}%
\begin{tikzpicture}[remember picture,overlay]%
%\coordinate (here) at (0,0);
\draw ([yshift=#1,xshift=1.5pt]current page.east |- marginfist\thefloatmargintikz) node[left]{
\begin{mybox}
\zihao{-5}
#2
\end{mybox}
};%
\draw[line width=0.85pt,red!50,] ([yshift=#1,xshift=-\marginparwidth]current page.east |- marginfist\thefloatmargintikz) -- ++(-6.6pt,0pt)-- ++ (0pt,0pt) |- ([yshift=-1.6pt,xshift=0pt]marginfist\thefloatmargintikz.south);%
\end{tikzpicture}%
\else
\refstepcounter{floatmargintikz}%
\tikzmarknode{marginfist\thefloatmargintikz}{}%
\begin{tikzpicture}[remember picture,overlay]%
%\coordinate (here) at (0,0);
\draw ([yshift=#1,xshift=-1.5pt]current page.west |- marginfist\thefloatmargintikz) node[right]{
\begin{mybox}
\zihao{-5}
#2
\end{mybox}
};%
\draw[line width=0.85pt,red!50,] ([yshift=#1,xshift=\marginparwidth]current page.west |- marginfist\thefloatmargintikz) -- ++(+6.1pt,0pt)-- ++ (0pt,0pt) |- ([yshift=-1.6pt,xshift=0pt]marginfist\thefloatmargintikz.south);%
\end{tikzpicture}%
\fi
}



%索引系统的建立
\definecolor{indexocre}{HTML}{F16723}
\newcommand*{\IndexDotfill}{%
  \nobreak\dotfill\ \nobreak
}
\renewcommand*{\indexspace}{%
  \par
  \vspace{25pt plus 6pt minus 4pt}%
}
\newcommand*{\IndexHeading}[1]{%
  \tikz\node[
    rounded corners=5pt,
    draw=indexocre,
    fill=indexocre!10,
    line width=1pt,
    inner sep=5pt,
    align=center,
    font=\sffamily\bfseries\large,
    minimum width=\linewidth-\pgflinewidth,
  ] {#1};%
  \nopagebreak
  \par
  \vspace{2mm}%
}

%上面定义的几个命令是来定制索引格式的
%这里对物理关键词进行索引设置的格式为shuoying.ist文件
\iffalse
delim_0 "\\IndexDotfill "
delim_1 "\\IndexDotfill "
headings_flag 1
heading_prefix "  \\IndexHeading{"
heading_suffix "}\n"
\fi
%使用下面的命令自动生成相应的文件
\RequirePackage{filecontents}
\begin{filecontents*}{shuoying.ist}
delim_0 "\\IndexDotfill "
delim_1 "\\IndexDotfill "
headings_flag 1
heading_prefix "  \\IndexHeading{"
heading_suffix "}\n"
\end{filecontents*}

\usepackage{imakeidx}
\makeindex[name=Pkeyword,title=关键词索引,intoc,columns=3,columnseprule=true,columnsep=35pt,options={-s shuoying.ist -z pinyin}]

\makeindex %索引声明



%让索引🈶️有超链接
\newcommand{\BH}[1]{\small\textbf{\hyperpage{#1}}\normalsize}
\newcommand{\IN}[1]{\index[Pkeyword]{#1|BH}}


%对索引的页眉页脚进行处理
\usepackage[index]{kantlipsum}
\indexsetup{firstpagestyle=mycontentstly}


\newcommand{\shuoying}[1]{
\newgeometry{top=2.6cm,bottom=2.6cm,left=3cm,right=3cm}
\pagestyle{mycontentstly}
\printindex[Pkeyword]
\pagestyle{mycontentstly}
}


\iffalse
\usepackage{xpatch}%补丁宏包
%给\todo打补丁：忽略后面的空格
\makeatletter
\xpretocmd{\todo}{\leavevmode\unskip}{}{}%前面的空格
\xapptocmd{\todo}{\ignorespaces}{}{} %后面的空格
\makeatother
\fi




%表格颜色设置
%定义颜色
\definecolor{darkblue}{cmyk}{1,0,0,0}%纯蓝
\definecolor{lightblue}{cmyk}{0.15,0,0,0}%浅蓝


\usepackage{colortbl}%表格线颜色设置宏包，表格竖排颜色设置宏包

%设置表格线的颜色
\arrayrulecolor{darkblue}

%表头同一采用淡蓝,命令\rowcolor{lightblue}



%对参考答案进行定制
%参考答案有两种方法
%一个是直接放在文中
%另一个是集中放在文末

%可用xsim实现只不过其不能使用\include的命令，弃之
\iffalse
\usepackage{xsim}

\xsimsetup{
%练习显示否
%exercise/print=false,
%答案显示否
%solution/print=false,
%除了上面的设置之外，在具体的某一个环境中也可以加参数print=false来控制显示
%辅助文件存放位置（相对位置）
path = {assist/},
%计数器设置
%exercise/ the-counter =\thesection.A,
%exercise/within = section,
}

%\usepackage{tcolorbox}
%\tcbuselibrary{most}

%定义物理习题和答案环境
%定义计数器，设置相应格式
\newcounter{physics}[chapter]

%对应的答案样式
%\renewcommand\thephysics{\arabic{section}.\arabic{physics}}

\DeclareExerciseEnvironmentTemplate{pplaintext}
{%素颜%
\noindent%
{\large\textbf{%
	\GetExerciseProperty{counter}%
	\GetExercisePropertyT{subtitle}{ (\PropertyValue)}}%
}
}
{\par\addvspace{\baselineskip}}





\DeclareExerciseType{physics}{
%环境引用名称
exercise-env= pexercise ,
solution-env= psolution ,
%环境显示名称
exercise-name=physics exercise ,
exercises-name=physics exercises  ,
solution-name= physics solution ,
solutions-name=physics solutions ,
%template用于版式定制,采用前面的素颜
%template=pplaintext ,
exercise-template = pplaintext ,
solution-template = pplaintext ,
%计数器改变
%exercises hcounter
counter = physics,
%solution-counter=section,
%the-counter=\thesection.\arabic{exercise}
}
%
%对physics环境进行一些属性的设置
%
\xsimsetup{
	pexercise/print=false,
	pexercise/ the-counter =\arabic{chapter}.\arabic{physics},
	psolution/print=false,
}



%\usepackage{multicol} %用于实现在同一页中实现不同的分栏
\newcommand{\answerall}{
\newpage
%
\begin{center}
	%\rule{0em}{0em}
	\vspace*{2em}
	%\bigskip
	{\zihao{-2}\heiti 参 \ 考 \ 答 \ 案}
	\vspace{2em}
\end{center}

\begin{multicols}{2}
\newcounter{answerall}[chapter]
%加减乘除代数运算需要放在\numexpr和\relax之间
%相当于while循环
\loop
\ifnum\value{answerall}<\numexpr\value{chapter}\relax
\refstepcounter{answerall}

\begin{center}
	\heiti \zihao{3} 第\arabic{answerall}讲
\end{center}
\printsolutionstype[headings=false,chapter=\value{answerall}]{physics}
\repeat
\printsolutionstype[headings=false]{physics}
\end{multicols}
}	

\fi


%答案效果采用自定义实现

\newcounter{answerchp}
%\newcounter{answernum}{answerchp}

%文件创建
\newwrite\myoutput
\immediate\openout\myoutput=answerall.output
\newcommand\answxsim[2]{%
	%\immediate\openout\myoutput=answerall.output
	%\immediate\write\myoutput{1: #1}
	\immediate\write\myoutput{\unexpanded{#1}#2}
	%\immediate\write\myoutput{#2}
	%\immediate\write\myoutput{ and 3: #3}
	%\immediate\closeout\myoutput
}



\newcommand{\answerall}{
\newpage
\newgeometry{top=2.6cm,bottom=2.6cm,left=3cm,right=3cm}
\pagestyle{mycontentstly}
\begin{center}
	%\rule{0em}{0em}
	\vspace*{2em}
	%\bigskip
	\phantomsection\addcontentsline{toc}{chapter}{\texorpdfstring{\hspace*{-1em}参考答案}{\hspace*{-1em}参考答案}}%其中缩进是为了目录对齐
	\markboth{参考答案}{参考答案}%改变 \leftmark 标签，使得页脚标签显示为参考答案
	{\color{structurecolor}\zihao{-2}\heiti 参 \ 考 \ 答 \ 案}
	\vspace{2em}
\end{center}

\begin{multicols}{2}
\begin{enumerate}
\renewcommand{\labelenumi}{\color{structurecolor}\arabic{answerchp}.\arabic{enumi}}
\renewcommand{\labelenumii}{\color{structurecolor}(\arabic{enumii})}
\input{answerall}
\end{enumerate}
\end{multicols}
\immediate\closeout\myoutput
%文件复制，两次编译，可得修改后的正确结果
\newwrite\copyfile  % open the file to write to
\immediate\openout\copyfile=answerall.tex

\newread\file      % open the file to read from
\openin\file=answerall.output

\begingroup\endlinechar=-1
\loop\unless\ifeof\file
  \read\file to\fileline  % Read one line and store it into \fileline
  %\fileline\par                   % print the content into the pdf
  \immediate\write\copyfile{\unexpanded\expandafter{\fileline}}  % print the content to copy.txt
\repeat
\endgroup
}	


\usepackage{listings}%代码展示宏包
%显示代码格式设置
\lstset{
    breaklines,                                           %自动换行
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


\usetikzlibrary{mindmap,shadows} %脑图mindmap
\usepackage{circuitikz}%利用tikz画电路图



%带圈数字的排序
\usepackage{textcircle-cid}%该宏包提供了很好的命令显示带圈字符
\newfontfamily\fontdiaquan{KozMinPr6N-Regular}%该字体可以很好的显示从0-100的带圈字符
\newcommand{\mydaiquan}[1]{{\fontdiaquan\CIDtextcircled{#1}}} %\fontdiaquan 空心 %\CIDtextblackcircled实心



%\usepackage{siunitx}%国际单位制
\usepackage{circuitikz} %画电路图
%设定使用的图形风格样式
\ctikzset{
	european resistors ,%电阻风格
	cute inductors  ,%电感风格
	american voltages  ,%电压标注风格
	%上面是集中设置，可用inductor=american对某个物体进行单独设置
	bipoles/cutechoke/cthick=1.5,%电感上面横线厚度
	%bipoles/thickness=4, %临时增加线的宽度，画电容时可用
	bipoles/length=1cm,%统一设置各元件的大小
	inductors/scale=1.5,%单独增加电感元件的大小
}




%tikz画图相关
\usetikzlibrary{intersections} %求交点坐标
\usetikzlibrary{arrows.meta}%箭头形状
\usetikzlibrary{angles}%角度标注，直角标注
\usetikzlibrary{quotes}%用引号标注，可较为方便的输入某些参数
\usetikzlibrary{decorations.pathreplacing}%两点间括号标注
\tikzset{
	mygrid/.style={very thin,step=0.1,color=red!30,},%设置网格格式
	>=Latex,%设置箭头格式
}
\usetikzlibrary{decorations.markings}%tikz标记位置，例如箭头位置等



%实验仪器演示

\RequirePackage{tikz,tikz-3dplot} 
\usetikzlibrary{3d,calc}

\RequirePackage[nomessages]{fp}%进行高精度运算


%\usepackage{stringstrings}%对字符串进行操作
\RequirePackage{xstring}%对字符串进行操作

%定义高精度取模运算
\newcommand{\mymod}[2]{
\FPset\MODNUMBERA{#1}
\FPset\MODNUMBERB{#2}
\FPdiv\MODQUA{\MODNUMBERA}{\MODNUMBERB} 
\FPifint\MODQUA %判断是否整除
\FPset\MODresult{0}
\else
\FPeval\MODmultiple{trunc(\MODQUA:0)}
\FPeval\MODresult{clip(\MODNUMBERA-\MODNUMBERB*\MODmultiple)}
\fi 
%\MODresult %作为结果引用
}


%螺旋测微仪
%请使用毫米作为单位



\newcommand{\Micrometer}[1]{
%初始坐标的视角，相当于球坐标系中的确定方向
%第一个参数绕x旋转，第二个绕z轴旋转
\tdplotsetmaincoords{00}{00}
%采用欧拉角来实现旋转
%第一个参数绕z轴旋转，第二个绕y轴，第三个绕z轴，注意顺序
\tdplotsetrotatedcoords{00}{5}{00}
\begin{tikzpicture}[tdplot_rotated_coords,font=\sffamily,scale=0.85]


%长度变量
\pgfmathsetmacro{\VernierLength}{#1} 
%前缀，主刻度尺
\pgfmathsetmacro{\VernierLengthPre}{#1-Mod(#1,0.5)}
%后缀，副刻度尺
\pgfmathsetmacro{\VernierLengthSuf}{Mod(#1,0.5)}

%\begin{scope}[xshift=-5cm]
%\draw[-latex] (0,0,0) -- (1,0,0) node[pos=1.1]{$x$};
%\draw[-latex] (0,0,0) -- (0,1,0) node[pos=1.1]{$y$};
%\draw[-latex] (0,0,0) -- (0,0,1) node[pos=1.1]{$z$};
%\end{scope}
  
%画一个方框来确定画面整体的范围大小
%\path[tdplot_screen_coords,use as bounding box] (-2,--2) rectangle (5,3);
%\path[tdplot_screen_coords] (5,3) node[anchor=north east] 
%{$\mathsf{L}=\VernierLength$}; 

%进入螺旋测微仪的绘制中
\begin{scope}


%在yz平面内画了个半圆的弧，圆心在原点，为M1
\begin{scope}[canvas is yz plane at x=0]
\path (0,0) coordinate (M1);
\draw[red!30] (180:1) arc (180:0:1);
\end{scope}

%旋转部分的外框，定义四个端点下(TL,TR) 、下(BL,BR)
\begin{scope}[canvas is yz plane at x=1.5]
\path (0,0) coordinate (M2);
\draw [red!30]
let 
\p1=($(M2)-(M1)$),
\n1={0*atan2(\y1,\x1)+atan2(1,1.5)/2.5} 
in
($(M1)+(-\n1/2:1)$) coordinate (TL) -- ($(M2)+(-\n1/2:2)$) coordinate (TR)
($(M1)+(180+\n1/2:1)$) coordinate (BL) -- ($(M2)+(180+\n1/2:2)$) coordinate (BR)
(BR) arc(180+\n1/2:-\n1/2:2);
\end{scope}

%前端，主刻度
\begin{scope}
%最左端的截面圆
\draw [fill=brown!40,brown!30] plot[variable=\t,domain=0:360,smooth] 
(-\VernierLength/2-0.4,{cos(\t)},{sin(\t)});



%表头的边框部分
\draw[brown,fill=brown!5] plot[variable=\t,domain=0:180,smooth,] 
(-\VernierLength/2-0.4,{cos(\t)},{sin(\t)})
-- plot[variable=\t,domain=180:0,smooth] 
(0,{cos(\t)},{sin(\t)}) -- cycle;

%表头刻度部分主体
\draw[thick,brown!80] (-\VernierLength/2,0,1) -- (0,0,1) 
plot[variable=\t,domain=60:110,smooth] 
(-\VernierLength/2,{cos(\t)},{sin(\t)});


%表头下部分刻度

%零刻度线
\path let 
\p1=($(-\VernierLength/2,{cos(120)},{sin(120)})-(-\VernierLength/2,{cos(110)},{sin(110)})$),
\n1={90+atan2(\y1,\x1)} 
in
 (-\VernierLength/2,{cos(120)},{sin(120)})
node[rotate=\n1,yscale={cos(30)},transform shape,brown]{0}; 

 %上下刻度线与标度
\pgfmathtruncatemacro{\Xmax}{\VernierLengthPre/0.5}
\ifnum\Xmax>0
\foreach \X in {1,...,\Xmax}
{\ifodd\X
\draw[brown!80] plot[variable=\t,domain=90:70,smooth] 
(-\VernierLength/2+0.25*\X,{cos(\t)},{sin(\t)});
     %\path let 
      % \p1=($(-\VernierLengthPre+0.5*\X,{cos(60)},{sin(60)})-(-\VernierL%engthPre+0.5*\X,{cos(70)},{sin(70)})$),
      % \n1={-90+atan2(\y1,\x1)}  
       %in (-\VernierLengthPre+0.5*\X,{cos(60)},{sin(60)})
        % node[right,rotate=\n1,yscale={cos(30)},transform shape]{\X};
\else
\draw[brown!80] plot[variable=\t,domain=90:110,smooth] 
(-\VernierLength/2+0.25*\X,{cos(\t)},{sin(\t)});
     \path let 
       \p1=($(-\VernierLength/2+0.25*\X,{cos(120)},{sin(120)})-(-\VernierLength/2+0.25*\X,{cos(110)},{sin(110)})$),
        \n1={90+atan2(\y1,\x1)} ,
        \n2={int(\X/2)}
        in (-\VernierLength/2+0.25*\X,{cos(120)},{sin(120)})
         node[rotate=\n1,yscale={cos(30)},transform shape,brown]{\n2};
\fi
}
\fi
\end{scope} 

%尾部方框
\begin{scope}[canvas is yz plane at x=3.5]
\path (0,0) coordinate (M3);
\draw[red!30,fill=red!5] (180:2) arc(180:0:2);
\draw[red!30] ($(M2)+(0:2)$) -- ($(M3)+(0:2)$)
($(M2)+(180:2)$) -- ($(M3)+(180:2)$);
\end{scope}

%副刻度，旋转部分
\pgfmathtruncatemacro{\Offset}{180+100*\VernierLengthSuf*7.2-12.45*7.2}
\pgfmathtruncatemacro{\Xmin}{100*\VernierLengthSuf+1-12.45}
\pgfmathtruncatemacro{\Xmax}{\Xmin+22}
\foreach \X [evaluate=\X as \Y using {int(mod(\X,5))},
evaluate=\X as \LX using {int(mod(\X,50))}] in {\Xmin,...,\Xmax}
{\ifnum\Y=0
\draw[thin,red!40] let 
\p1=($(0.6,{(1+0.4)*cos(\Offset-\X*7.2)},{(1+0.4)*sin(\Offset-\X*7.2)})-
(0,{cos(\Offset-\X*7.2)},{sin(\Offset-\X*7.2)})$),
\p2=($(0.6,{(1+0.4)*cos(\Offset-\X*7.2)},{(1+0.4)*sin(\Offset-\X*7.2)})-
(0.6,{(1+0.4)*cos(\Offset-\X*7.2+1)},{(1+0.4)*sin(\Offset-\X*7.2+1)})$),
\p3=($(0.6,{0},{(1+0.4)})-
(0.6,{(1+0.4)*cos(91)},{(1+0.4)*sin(91)})$),
\n1={atan2(\y1,\x1)},\n2={veclen(\x2,\y2)/veclen(\x3,\y3)} in
(0,{cos(\Offset-\X*7.2)},{sin(\Offset-\X*7.2)})
-- (0.6,{(1+0.4)*cos(\Offset-\X*7.2)},{(1+0.4)*sin(\Offset-\X*7.2)})
node[pos=1.5,rotate=\n1,yscale={\n2},transform shape,red!70]{\LX};
\else
\draw[thin,red!40] (0,{cos(\Offset-\X*7.2)},{sin(\Offset-\X*7.2)})
-- (0.3,{(1+0.2)*cos(\Offset-\X*7.2)},{(1+0.2)*sin(\Offset-\X*7.2)});
\fi}
\end{scope}
\end{tikzpicture}
}


%游标卡尺
%请使用毫米作为单位

%自动选择判断对下面的情况无效
%对于20分度和50分度有些值相同，无法自动区分
% .00 .10 .20 .30 .40 .50 .60 .70 .80 .90
%故将下面的情况自动归结到20分度值的范围内
%利用50分度值写数时，遇到上面提到的特殊情况，可手动添加50:5.800（示数前面加50:标记）




\newcommand{\Vernierscale}[1]{
%检查是否使用标记
\StrBefore{#1}{:}[\mydecimalpartfive]
%首先判断是否有标记
\ifx\mydecimalpartfive\empty
%为空，没有使用
%
%对输入的长度进行处理
\StrBehind{#1}{.}[\mydecimalpart]
\StrLen{\mydecimalpart}[\mydecimalleng]
\ifnum\mydecimalleng=1
%十分度
{
	\begin{tikzpicture}[scale=1.3]
		
		\pgfmathsetmacro{\X}{#1} 
		\pgfmathsetmacro{\VernierLength}{\X} 
		\mymod{\X}{1} %弃用自带的取模方式Mod(\X,1) 
		%前缀，主刻度尺
		\pgfmathsetmacro{\VernierLengthPre}{\X-\MODresult}
		%后缀，副刻度尺
		\pgfmathsetmacro{\VernierLengthSuf}{\MODresult}
		
		
		\clip ( \VernierLength mm - 1.6 cm ,-1) rectangle ( \VernierLength mm  + 2.6cm , 1) ;
		
		%直尺部分
		\draw[fill=red!5] (-0.5,0) rectangle (20.5,1);
		%% lower divisions
		\foreach \x in {0,1,...,20}{
			\draw   (\x,0) -- (\x,0.4)node[red!70,above]{$ \x $};
		}
		\foreach \x in {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3.0,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,6.0,6.1,6.2,6.3,6.4,6.5,6.6,6.7,6.8,6.9,7.0,7.1,7.2,7.3,7.4,7.5,7.6,7.7,7.8,7.9,8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9,9.0,9.1,9.2,9.3,9.4,9.5,9.6,9.7,9.8,9.9,10.0,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,10.9,11.0,11.1,11.2,11.3,11.4,11.5,11.6,11.7,11.8,11.9,12.0,12.1,12.2,12.3,12.4,12.5,12.6,12.7,12.8,12.9,13.0,13.1,13.2,13.3,13.4,13.5,13.6,13.7,13.8,13.9,14.0,14.1,14.2,14.3,14.4,14.5,14.6,14.7,14.8,14.9,15.0,15.1,15.2,15.3,15.4,15.5,15.6,15.7,15.8,15.9,16.0,16.1,16.2,16.3,16.4,16.5,16.6,16.7,16.8,16.9,17.0,17.1,17.2,17.3,17.4,17.5,17.6,17.7,17.8,17.9,18.0,18.1,18.2,18.3,18.4,18.5,18.6,18.7,18.8,18.9,19.0,19.1,19.2,19.3,19.4,19.5,19.6,19.7,19.8,19.9}{
			\draw (\x,0) -- (\x,0.2);
		}
		\foreach \x in {0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5,9.0,9.5,10.0,10.5,11.0,11.5,12.0,12.5,13.0,13.5,14.0,14.5,15.0,15.5,16.0,16.5,17.0,17.5,18.0,18.5,19.0,19.5}{
			\draw (\x,0) -- (\x,0.4);
		}
		

		
		%游标部分
		
		%十分度
		\pgfmathsetmacro{\verniernumtenmove}{\VernierLengthPre + 0.1*(\VernierLengthSuf/0.1)} 
		
		\begin{scope}[yshift=-1cm,xshift=\verniernumtenmove mm]
			\draw[fill=orange!5] (-0.2,0) rectangle (1.15,1);
			\foreach \x in {0.00,0.09,0.18,0.27,0.36,0.45,0.54,0.63,0.72,0.81,0.90}{
				\draw (\x,1) -- (\x,0.8);
			}
			\draw (0,1) -- (0,0.6) node[orange,below] {$ 0 $}
			(0.45,1) -- (0.45,0.6) node[orange,below] {$ 5 $}
			(0.9,1) -- (0.9,0.6) node[orange,below] {$ 10 $} ;
		\end{scope}
		
		
		
		
	\end{tikzpicture}
}
\else
%取得百分位小数
\mymod{#1}{0.1}
\FPeval\mydecimalbai{100*\MODresult}
\ifdim\mydecimalbai pt = 0 pt
%20分度
{
	\begin{tikzpicture}[scale=1.3]
		
		\pgfmathsetmacro{\X}{#1} 
		\pgfmathsetmacro{\VernierLength}{\X} 
		\mymod{\X}{1} %弃用自带的取模方式Mod(\X,1) 
		%前缀，主刻度尺
		\pgfmathsetmacro{\VernierLengthPre}{\X-\MODresult}
		%后缀，副刻度尺
		\pgfmathsetmacro{\VernierLengthSuf}{\MODresult}
		
		
		\clip ( \VernierLength mm - 1.6 cm ,-1) rectangle ( \VernierLength mm  + 3.5cm , 1) ;
		
		%直尺部分
		\draw[fill=red!5] (-0.5,0) rectangle (20.5,1);
		%% lower divisions
		\foreach \x in {0,1,...,20}{
			\draw   (\x,0) -- (\x,0.4)node[red!70,above]{$ \x $};
		}
		\foreach \x in {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3.0,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,6.0,6.1,6.2,6.3,6.4,6.5,6.6,6.7,6.8,6.9,7.0,7.1,7.2,7.3,7.4,7.5,7.6,7.7,7.8,7.9,8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9,9.0,9.1,9.2,9.3,9.4,9.5,9.6,9.7,9.8,9.9,10.0,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,10.9,11.0,11.1,11.2,11.3,11.4,11.5,11.6,11.7,11.8,11.9,12.0,12.1,12.2,12.3,12.4,12.5,12.6,12.7,12.8,12.9,13.0,13.1,13.2,13.3,13.4,13.5,13.6,13.7,13.8,13.9,14.0,14.1,14.2,14.3,14.4,14.5,14.6,14.7,14.8,14.9,15.0,15.1,15.2,15.3,15.4,15.5,15.6,15.7,15.8,15.9,16.0,16.1,16.2,16.3,16.4,16.5,16.6,16.7,16.8,16.9,17.0,17.1,17.2,17.3,17.4,17.5,17.6,17.7,17.8,17.9,18.0,18.1,18.2,18.3,18.4,18.5,18.6,18.7,18.8,18.9,19.0,19.1,19.2,19.3,19.4,19.5,19.6,19.7,19.8,19.9}{
			\draw (\x,0) -- (\x,0.2);
		}
		\foreach \x in {0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5,9.0,9.5,10.0,10.5,11.0,11.5,12.0,12.5,13.0,13.5,14.0,14.5,15.0,15.5,16.0,16.5,17.0,17.5,18.0,18.5,19.0,19.5}{
			\draw (\x,0) -- (\x,0.4);
		}
		
		%游标部分
		
		
		%二十分度
		\pgfmathsetmacro{\verniernumtenmove}{\VernierLengthPre + 0.05*(\VernierLengthSuf/0.05)} 
		
		\begin{scope}[yshift=-1cm,xshift=\verniernumtenmove mm]
			\draw [fill=orange!5] (-0.2,0) rectangle (2.15,1);
			\foreach \x in {0.000,0.095,0.190,0.285,0.380,0.475,0.570,0.665,0.760,0.855,0.950,1.045,1.140,1.235,1.330,1.425,1.520,1.615,1.710,1.805,1.900}{
				\draw (\x,1) -- (\x,0.8);
			}
			
			\foreach \x in {0,1,...,4}{
				\pgfmathsetmacro{\verniernumten}{int(5*\x)}
				\draw ({0.475*\x},1) -- ({0.475*\x},0.6) node[orange,below] {$ \verniernumten $} ;
			}
		\end{scope}
		
		
		
		
	\end{tikzpicture} 
}
\else
\ifdim \mydecimalbai pt = 5 pt
%20分度
{
	\begin{tikzpicture}[scale=1.3]
		
		\pgfmathsetmacro{\X}{#1} 
		\pgfmathsetmacro{\VernierLength}{\X} 
		\mymod{\X}{1} %弃用自带的取模方式Mod(\X,1) 
		%前缀，主刻度尺
		\pgfmathsetmacro{\VernierLengthPre}{\X-\MODresult}
		%后缀，副刻度尺
		\pgfmathsetmacro{\VernierLengthSuf}{\MODresult}
		
		
		\clip ( \VernierLength mm - 1.6 cm ,-1) rectangle ( \VernierLength mm  + 3.5cm , 1) ;
		
		%直尺部分
		\draw[fill=red!5] (-0.5,0) rectangle (20.5,1);
		%% lower divisions
		\foreach \x in {0,1,...,20}{
			\draw   (\x,0) -- (\x,0.4)node[red!70,above]{$ \x $};
		}
		\foreach \x in {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3.0,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,6.0,6.1,6.2,6.3,6.4,6.5,6.6,6.7,6.8,6.9,7.0,7.1,7.2,7.3,7.4,7.5,7.6,7.7,7.8,7.9,8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9,9.0,9.1,9.2,9.3,9.4,9.5,9.6,9.7,9.8,9.9,10.0,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,10.9,11.0,11.1,11.2,11.3,11.4,11.5,11.6,11.7,11.8,11.9,12.0,12.1,12.2,12.3,12.4,12.5,12.6,12.7,12.8,12.9,13.0,13.1,13.2,13.3,13.4,13.5,13.6,13.7,13.8,13.9,14.0,14.1,14.2,14.3,14.4,14.5,14.6,14.7,14.8,14.9,15.0,15.1,15.2,15.3,15.4,15.5,15.6,15.7,15.8,15.9,16.0,16.1,16.2,16.3,16.4,16.5,16.6,16.7,16.8,16.9,17.0,17.1,17.2,17.3,17.4,17.5,17.6,17.7,17.8,17.9,18.0,18.1,18.2,18.3,18.4,18.5,18.6,18.7,18.8,18.9,19.0,19.1,19.2,19.3,19.4,19.5,19.6,19.7,19.8,19.9}{
			\draw (\x,0) -- (\x,0.2);
		}
		\foreach \x in {0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5,9.0,9.5,10.0,10.5,11.0,11.5,12.0,12.5,13.0,13.5,14.0,14.5,15.0,15.5,16.0,16.5,17.0,17.5,18.0,18.5,19.0,19.5}{
			\draw (\x,0) -- (\x,0.4);
		}
		
		%游标部分
		
		
		%二十分度
		\pgfmathsetmacro{\verniernumtenmove}{\VernierLengthPre + 0.05*(\VernierLengthSuf/0.05)} 
		
		\begin{scope}[yshift=-1cm,xshift=\verniernumtenmove mm]
			\draw [fill=orange!5] (-0.2,0) rectangle (2.15,1);
			\foreach \x in {0.000,0.095,0.190,0.285,0.380,0.475,0.570,0.665,0.760,0.855,0.950,1.045,1.140,1.235,1.330,1.425,1.520,1.615,1.710,1.805,1.900}{
				\draw (\x,1) -- (\x,0.8);
			}
			
			\foreach \x in {0,1,...,4}{
				\pgfmathsetmacro{\verniernumten}{int(5*\x)}
				\draw ({0.475*\x},1) -- ({0.475*\x},0.6) node[orange,below] {$ \verniernumten $} ;
			}
		\end{scope}
		
		
		
		
	\end{tikzpicture} 
}
\else
%50分度
{
	\begin{tikzpicture}[scale=1.4]
		
		\pgfmathsetmacro{\X}{#1} 
		\pgfmathsetmacro{\VernierLength}{\X} 
		\mymod{\X}{1} %弃用自带的取模方式Mod(\X,1) 
		%前缀，主刻度尺
		\pgfmathsetmacro{\VernierLengthPre}{\X-\MODresult}
		%后缀，副刻度尺
		\pgfmathsetmacro{\VernierLengthSuf}{\MODresult}
		
		
		\clip ( \VernierLength mm - 1.6 cm ,-1) rectangle ( \VernierLength mm  + 6cm , 1) ;
		
		%直尺部分
		\draw[fill=red!5] (-0.5,0) rectangle (20.5,1);
		%% lower divisions
		\foreach \x in {0,1,...,20}{
			\draw   (\x,0) -- (\x,0.4)node[red!70,above]{$ \x $};
		}
		\foreach \x in {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3.0,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,6.0,6.1,6.2,6.3,6.4,6.5,6.6,6.7,6.8,6.9,7.0,7.1,7.2,7.3,7.4,7.5,7.6,7.7,7.8,7.9,8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9,9.0,9.1,9.2,9.3,9.4,9.5,9.6,9.7,9.8,9.9,10.0,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,10.9,11.0,11.1,11.2,11.3,11.4,11.5,11.6,11.7,11.8,11.9,12.0,12.1,12.2,12.3,12.4,12.5,12.6,12.7,12.8,12.9,13.0,13.1,13.2,13.3,13.4,13.5,13.6,13.7,13.8,13.9,14.0,14.1,14.2,14.3,14.4,14.5,14.6,14.7,14.8,14.9,15.0,15.1,15.2,15.3,15.4,15.5,15.6,15.7,15.8,15.9,16.0,16.1,16.2,16.3,16.4,16.5,16.6,16.7,16.8,16.9,17.0,17.1,17.2,17.3,17.4,17.5,17.6,17.7,17.8,17.9,18.0,18.1,18.2,18.3,18.4,18.5,18.6,18.7,18.8,18.9,19.0,19.1,19.2,19.3,19.4,19.5,19.6,19.7,19.8,19.9}{
			\draw (\x,0) -- (\x,0.2);
		}
		\foreach \x in {0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5,9.0,9.5,10.0,10.5,11.0,11.5,12.0,12.5,13.0,13.5,14.0,14.5,15.0,15.5,16.0,16.5,17.0,17.5,18.0,18.5,19.0,19.5}{
			\draw (\x,0) -- (\x,0.4);
		}
		
		%游标部分
		%五十分度部分
		\pgfmathsetmacro{\verniernumtenmove}{\VernierLengthPre + 0.02*(\VernierLengthSuf/0.02)} 
		
		\begin{scope}[yshift=-1cm,xshift=\verniernumtenmove mm]
			\draw [fill=orange!5] (-0.2,0) rectangle (5.15,1);
			\foreach \x in {0.000,0.098,0.196,0.294,0.392,0.490,0.588,0.686,0.784,0.882,0.980,1.078,1.176,1.274,1.372,1.470,1.568,1.666,1.764,1.862,1.960,2.058,2.156,2.254,2.352,2.450,2.548,2.646,2.744,2.842,2.940,3.038,3.136,3.234,3.332,3.430,3.528,3.626,3.724,3.822,3.920,4.018,4.116,4.214,4.312,4.410,4.508,4.606,4.704,4.802,4.900}{
				\draw (\x,1) -- (\x,0.8);
			}
			
			\foreach \x in {0,1,...,10}{
				\pgfmathsetmacro{\verniernumten}{int(5*\x)}
				\draw ({0.49*\x},1) -- ({0.49*\x},0.6) node[orange,below] {$ \verniernumten $} ;
			}
		\end{scope}
		
	\end{tikzpicture}
}
\fi
\fi
\fi 
\else
%不为空
\ifnum\mydecimalpartfive=50
%是50
%50分度
{\StrBehind{#1}{:}[\myinputnumber]
	\begin{tikzpicture}[scale=1.4]
		
		\pgfmathsetmacro{\X}{\myinputnumber} 
		\pgfmathsetmacro{\VernierLength}{\X} 
		\mymod{\X}{1} %弃用自带的取模方式Mod(\X,1) 
		%前缀，主刻度尺
		\pgfmathsetmacro{\VernierLengthPre}{\X-\MODresult}
		%后缀，副刻度尺
		\pgfmathsetmacro{\VernierLengthSuf}{\MODresult}
		
		
		\clip ( \VernierLength mm - 1.6 cm ,-1) rectangle ( \VernierLength mm  + 6cm , 1) ;
		
		%直尺部分
		\draw[fill=red!5] (-0.5,0) rectangle (20.5,1);
		%% lower divisions
		\foreach \x in {0,1,...,20}{
			\draw   (\x,0) -- (\x,0.4)node[red!70,above]{$ \x $};
		}
		\foreach \x in {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3.0,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4.0,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,5.0,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,6.0,6.1,6.2,6.3,6.4,6.5,6.6,6.7,6.8,6.9,7.0,7.1,7.2,7.3,7.4,7.5,7.6,7.7,7.8,7.9,8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9,9.0,9.1,9.2,9.3,9.4,9.5,9.6,9.7,9.8,9.9,10.0,10.1,10.2,10.3,10.4,10.5,10.6,10.7,10.8,10.9,11.0,11.1,11.2,11.3,11.4,11.5,11.6,11.7,11.8,11.9,12.0,12.1,12.2,12.3,12.4,12.5,12.6,12.7,12.8,12.9,13.0,13.1,13.2,13.3,13.4,13.5,13.6,13.7,13.8,13.9,14.0,14.1,14.2,14.3,14.4,14.5,14.6,14.7,14.8,14.9,15.0,15.1,15.2,15.3,15.4,15.5,15.6,15.7,15.8,15.9,16.0,16.1,16.2,16.3,16.4,16.5,16.6,16.7,16.8,16.9,17.0,17.1,17.2,17.3,17.4,17.5,17.6,17.7,17.8,17.9,18.0,18.1,18.2,18.3,18.4,18.5,18.6,18.7,18.8,18.9,19.0,19.1,19.2,19.3,19.4,19.5,19.6,19.7,19.8,19.9}{
			\draw (\x,0) -- (\x,0.2);
		}
		\foreach \x in {0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5,9.0,9.5,10.0,10.5,11.0,11.5,12.0,12.5,13.0,13.5,14.0,14.5,15.0,15.5,16.0,16.5,17.0,17.5,18.0,18.5,19.0,19.5}{
			\draw (\x,0) -- (\x,0.4);
		}
		
		%游标部分
		%五十分度部分
		\pgfmathsetmacro{\verniernumtenmove}{\VernierLengthPre + 0.02*(\VernierLengthSuf/0.02)} 
		
		\begin{scope}[yshift=-1cm,xshift=\verniernumtenmove mm]
			\draw [fill=orange!5] (-0.2,0) rectangle (5.15,1);
			\foreach \x in {0.000,0.098,0.196,0.294,0.392,0.490,0.588,0.686,0.784,0.882,0.980,1.078,1.176,1.274,1.372,1.470,1.568,1.666,1.764,1.862,1.960,2.058,2.156,2.254,2.352,2.450,2.548,2.646,2.744,2.842,2.940,3.038,3.136,3.234,3.332,3.430,3.528,3.626,3.724,3.822,3.920,4.018,4.116,4.214,4.312,4.410,4.508,4.606,4.704,4.802,4.900}{
				\draw (\x,1) -- (\x,0.8);
			}
			
			\foreach \x in {0,1,...,10}{
				\pgfmathsetmacro{\verniernumten}{int(5*\x)}
				\draw ({0.49*\x},1) -- ({0.49*\x},0.6) node[orange,below] {$ \verniernumten $} ;
			}
		\end{scope}
		
	\end{tikzpicture}
}
\else
%做了标记。但不是50
\fi
\fi
}






\newcommand{\Ammeter}[1]
{
\ifdim#1 pt>0.6pt
%%电流表0-3A
{
	\begin{tikzpicture}
		\pgfmathsetmacro{\A}{#1}
		\pgfmathsetmacro{\StartAngle}{30}
		\pgfmathsetmacro{\EndAngle}{150}
		\pgfmathsetmacro{\StepAngle}{(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\Fistone}{\StartAngle+(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\Fisttwo}{\StartAngle+5*(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\LineAngle}{\EndAngle-\A*(\EndAngle-\StartAngle)/3}
		
		
%外框
\draw[rounded corners=15pt,red!50,fill=red!10,] (-3,-0.8) rectangle (3,3.15);
\draw[rounded corners=10pt,red!50,fill=red!5] (-2.8,0) rectangle (2.8,3);
\draw [red!50] (0,-0.4) circle [radius=0.2];
\draw [orange!50,fill=orange!50,]  (-0.19,-0.45) rectangle (0.19,-0.35) ;
		
		%读数表盘线
		\draw (\StartAngle:2) arc [radius=2, start angle = \StartAngle , end angle=\EndAngle ] ;
		
		
		%副刻度
		\foreach \D in {\StartAngle,\Fistone,...,\EndAngle}
	{
		\draw (\D:2) -- (\D:2.2) ;
	}
	
	%主刻度
		\foreach \D in {\StartAngle,\Fisttwo,...,\EndAngle}
	{
		\pgfmathsetmacro{\N}{((\EndAngle-\D)/5/\StepAngle)}
		{\ifodd\N
			\draw (\D:2) -- (\D:2.4) ;
			\else
				\pgfmathsetmacro{\Num}{int(\N/2)}
			\draw (\D:2) -- (\D:2.4) node[rotate=-90+\D,above,red!80] {$ \Num $};
			\fi
		}
	}

%电流表标志
\node at (0,0.5) {$\mathrm{A}$} ;
	
%指针
\draw (0,0) -- (\LineAngle:2.3) ;
\fill (0,0) circle [radius=1.5pt];





	\end{tikzpicture}
}
\else
{
%电流表0-0.6A
	\begin{tikzpicture}
		\pgfmathsetmacro{\A}{#1}
		\pgfmathsetmacro{\StartAngle}{30}
		\pgfmathsetmacro{\EndAngle}{150}
		\pgfmathsetmacro{\StepAngle}{(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\Fistone}{\StartAngle+(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\Fisttwo}{\StartAngle+5*(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\LineAngle}{\EndAngle-\A*(\EndAngle-\StartAngle)/0.6}
		
		
		%外框
		\draw[rounded corners=15pt,red!50,fill=red!10,] (-3,-0.8) rectangle (3,3.15);
		\draw[rounded corners=10pt,red!50,fill=red!5] (-2.8,0) rectangle (2.8,3);
		\draw [red!50] (0,-0.4) circle [radius=0.2];
		\draw [orange!50,fill=orange!50,]  (-0.19,-0.45) rectangle (0.19,-0.35) ;
		
		%读数表盘线
		\draw (\StartAngle:2) arc [radius=2, start angle = \StartAngle , end angle=\EndAngle ] ;
		
		
		%副刻度
		\foreach \D in {\StartAngle,\Fistone,...,\EndAngle}
		{
			\draw (\D:2) -- (\D:2.2) ;
		}
		
		%主刻度
		\foreach \D in {\StartAngle,\Fisttwo,...,\EndAngle}
		{
			\pgfmathsetmacro{\N}{((\EndAngle-\D)/5/\StepAngle)}
			{\ifodd\N
				\draw (\D:2) -- (\D:2.4) ;
				\else
				\pgfmathsetmacro{\Num}{int(\N)}
				\draw (\D:2) -- (\D:2.4) node[rotate=-90+\D,above,red!80] {$ 0.\Num $};
				\fi
			}
		}
		
		
		%电流表标志
		\node at (0,0.5) {$\mathrm{A}$} ;
		
		%指针
		\draw (0,0) -- (\LineAngle:2.3) ;
		\fill (0,0) circle [radius=1.5pt];
		
		
		
		
		
	\end{tikzpicture}
}
\fi
}



\newcommand{\Voltmeter}[1]{
\ifdim#1pt>3pt
%电压表0-15V
{
	\begin{tikzpicture}
		\pgfmathsetmacro{\V}{#1}
		\pgfmathsetmacro{\StartAngle}{30}
		\pgfmathsetmacro{\EndAngle}{150}
		\pgfmathsetmacro{\StepAngle}{(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\Fistone}{\StartAngle+(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\Fisttwo}{\StartAngle+5*(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\LineAngle}{\EndAngle-\V*(\EndAngle-\StartAngle)/15}
		
		
		%外框
		\draw[rounded corners=15pt,red!50,fill=red!10,] (-3,-0.8) rectangle (3,3.15);
		\draw[rounded corners=10pt,red!50,fill=red!5] (-2.8,0) rectangle (2.8,3);
		\draw [red!50] (0,-0.4) circle [radius=0.2];
		\draw [orange!50,fill=orange!50,]  (-0.19,-0.45) rectangle (0.19,-0.35) ;
		
		%读数表盘线
		\draw (\StartAngle:2) arc [radius=2, start angle = \StartAngle , end angle=\EndAngle ] ;
		
		
		%副刻度
		\foreach \D in {\StartAngle,\Fistone,...,\EndAngle}
		{
			\draw (\D:2) -- (\D:2.2) ;
		}
		
		%主刻度
		\foreach \D in {\StartAngle,\Fisttwo,...,\EndAngle}
		{
			\pgfmathsetmacro{\N}{((\EndAngle-\D)/5/\StepAngle)}
			{\ifodd\N
				\draw (\D:2) -- (\D:2.4) ;
				\else
				\pgfmathsetmacro{\Num}{int(5*\N/2)}
				\draw (\D:2) -- (\D:2.4) node[rotate=-90+\D,above,red!80] {$ \Num $};
				\fi
			}
		}
		
		%电压表标志
		\node at (0,0.5) {$\mathrm{V}$} ;
		
		%指针
		\draw (0,0) -- (\LineAngle:2.3) ;
		\fill (0,0) circle [radius=1.5pt];
		
		
		
		
		
	\end{tikzpicture}
}
\else
{
	%电压表0-3V
		\begin{tikzpicture}
		\pgfmathsetmacro{\V}{#1}
		\pgfmathsetmacro{\StartAngle}{30}
		\pgfmathsetmacro{\EndAngle}{150}
		\pgfmathsetmacro{\StepAngle}{(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\Fistone}{\StartAngle+(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\Fisttwo}{\StartAngle+5*(\EndAngle-\StartAngle)/30}
		\pgfmathsetmacro{\LineAngle}{\EndAngle-\V*(\EndAngle-\StartAngle)/3}
		
		
		%外框
		\draw[rounded corners=15pt,red!50,fill=red!10,] (-3,-0.8) rectangle (3,3.15);
		\draw[rounded corners=10pt,red!50,fill=red!5] (-2.8,0) rectangle (2.8,3);
		\draw [red!50] (0,-0.4) circle [radius=0.2];
		\draw [orange!50,fill=orange!50,]  (-0.19,-0.45) rectangle (0.19,-0.35) ;
		
		%读数表盘线
		\draw (\StartAngle:2) arc [radius=2, start angle = \StartAngle , end angle=\EndAngle ] ;
		
		
		%副刻度
		\foreach \D in {\StartAngle,\Fistone,...,\EndAngle}
		{
			\draw (\D:2) -- (\D:2.2) ;
		}
		
		%主刻度
		\foreach \D in {\StartAngle,\Fisttwo,...,\EndAngle}
		{
			\pgfmathsetmacro{\N}{((\EndAngle-\D)/5/\StepAngle)}
			{\ifodd\N
				\draw (\D:2) -- (\D:2.4) ;
				\else
				\pgfmathsetmacro{\Num}{int(\N/2)}
				\draw (\D:2) -- (\D:2.4) node[rotate=-90+\D,above,red!80] {$ \Num $};
				\fi
			}
		}
		
		%电压表标志
		\node at (0,0.5) {$\mathrm{V}$} ;
		
		%指针
		\draw (0,0) -- (\LineAngle:2.3) ;
		\fill (0,0) circle [radius=1.5pt];
		
		
		
		
		
	\end{tikzpicture}
}
\fi
}


