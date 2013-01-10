\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xjtubsc}[2012/12/20 xjtuthesis Ver 1.0]

%=========加入ctexart类==============%
\LoadClass[cs4size,twoside]{ctexart}

%=========宏包===================%
\usepackage{amsfonts,verbatim}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{array}
\usepackage{graphicx}
\usepackage{ragged2e}
\usepackage{tabularx}
\usepackage{listings}
\usepackage{subfigure}
\usepackage{float}


%==========页面设置===============%

\RequirePackage[left=2.6cm,right=2.6cm,top=3.0cm,bottom=2.5cm,a4paper]{geometry}

%======实现三级标题==============%
\CTEXsetup[format={\centering\zihao{3}\songti}]{section}
\CTEXsetup[format={\raggedright\zihao{-3}\songti}]{subsection}
\CTEXsetup[format={\hskip 0.15cm\zihao{4}}\songti]{subsubsection}
%未实现手册中的“单倍行距，段前空三行，段后空两行“要求。其次有一个丑陋的做法：在实现”三级标题：左起空两字符“用了”\hskip 0.15cm“



%============插图、表格及公式设置=============%
\usepackage{caption}
\captionsetup{labelformat=simple,labelsep=quad,font=small}
\captionsetup[table]{position=top,belowskip={1bp},aboveskip=-2bp}
\captionsetup[figure]{position=bottom,belowskip={1bp},aboveskip=-2bp}
%以上并未按章节编号，且还需多次调整

%加载booktabs绘制三线表
\usepackage{booktabs}


%==============封面及任务书===========%

%这个嘛，到时再处理


%==============中文摘要====================%
\newcommand{\chabstractname }{\zihao{3} 摘 \quad 要}
\newenvironment{chabstract}{
      \if@twocolumn \section *{\chabstractname }\else \zihao
{-4} \begin {center}{\songti \chabstractname \vspace {-.5em}\vspace {\z@
}}\end {center}\quotation \fi
}{\par}
\newcommand{\chkeywords}[1]{\par{\vspace{1ex} \zihao{5} {\bf关键词：}#1}\relax}

%==========英文摘要=====================%
\newcommand{\enabstractname }{\zihao{3} ABSTRACT}
\newenvironment{enabstract}{
      \if@twocolumn \section *{\enabstractname }\else \zihao
{-4} \begin {center}{\songti \enabstractname \vspace {-.5em}\vspace {\z@
}}\end {center}\quotation \fi
}{\par}
\newcommand{\enkeywords}[1]{\par{\vspace{1ex}\zihao{5} {\bf KEY WORDS ：}#1}\relax}
%且英文关键词字号设置有问题，不知是否为大小写的差异
%关键词并没有左对齐，且英文摘要内容用小四号Times New Roman，摘要正文每段开头不空格，每段之间空一行，未实现


%===============目录=================%

%附录在自动生成目录时并未出现在目录中，不知如何处理


%=============主要符号================%
%试图复制清华模板，但失败了。。。
\newenvironment{denotation}[1][2.5cm]{
  \section*[]{主要符号表} % no tocline
  \noindent\begin{list}{}%
    {\vskip-30bp\zihao{-4}
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}


%============参考文献与标注==============%



%清华模板中有已设置好的格式，但不知如何使用thubib.bst。如若自己设置应如何做？




%================致谢===================%
\newcommand{\mythanksname}{\zihao{3} 致 \quad 谢}
\newenvironment{mythanks}{
      \if@twocolumn \section *{\mythanksname }\else \zihao
{-4} \begin {center}{\songti \mythanksname \vspace {-.5em}\vspace {\z@
}}\end {center}\quotation \fi
}{\par}










