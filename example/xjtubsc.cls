\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xjtubsc}[2012/12/20 lishuthesis Ver 1.0]

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



%==============封面及任务书===========%




%==========摘要====================%




%===============目录=================%




%=============主要符号================%





%=================标题===============%



%===========插图，表格及公式=============%





%============参考文献与标注==============%






%=============附录===================%





%================致谢===================%














