Template for Bachelor of Science Thesis in XJTU
======

Description
------

This project is aiming at making a \LaTeX{} template for the B.Sc. thesis in Xi'an Jiaotong University. The format is based on the 《2013届本科毕业设计（论文）工作手册》.

Authors
------
[Wang Hongxin](https://github.com/wanghongxin)

[Qin Yuguo](https://bitbucket.org/FireUponSky)

[Hao Yun](https://bitbucket.org/haoyun)

License
------
The file is distributed under the LPPL (v3 or later) license. See LICENSE for details.

For Authors
------
To get started, run:

    git clone https://YourUserame@bitbucket.org/FireUponSky/xjtu-thesis-bsc.git XXXXX/
    cd XXXXX/

in the shell, where XXXXX is your working directory with arbitary name.

Remember to **pull** the newest version in the github repo to merge differences and then **push** your contributions.

You may also **folk** the main repo to your own github repo.

Changelog
------

Todo List
-----
* 第三级标题的"左起空两字符"实现的很ugly。且其中要求"段前空三行，段后空两行",不知是什么?
* 且问题在于图像出现得位置，pdf中第12页以后的图像，出现大幅度的空白，是否应调整图像大小。
* 页眉和页脚：页眉距边界2.0cm，页脚距边界1.75cm。脚注：全文的脚注一律采用五号。
* 设置参数 print 及 screen，分别对应黑白的和彩色的（超链接、目录等）。
* 格式为页眉的文字内容之下划两条横线，线粗1/2磅，线长与页面齐宽。但是磅可能是 bg，即大点，所以页眉线可能有问题。
* 把任务表书内容整合。
* 编写完整的文档。
* 编写常宏包文件，类似thutils.sty(清华的)，内含各种包的加载，配置等。供初级用户使用。
* 清理没用的注释。
* 编写空模板，替代example文件夹中的文件。模板参考清华TEXMF-DIST/doc/latex/thuthesis/example.main。
* 在pdflatex进行测试。

Bugs
------
1)SeaGreen4那个颜色在lstlisting环境出现注释的时候提示无法找到。（需要加载带参数的xcolor，with option x11names）
