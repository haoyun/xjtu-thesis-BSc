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
(1)实现了三级标题，但第三级标题的"左起空两字符"实现的很ugly。且其中要求"段前空三行，段后空两行",不知是什么?

* 完成对图名，表名的设置，但并未实现按章编号。公式的设置也未实现。
* 且问题在于图像出现得位置，pdf中第12页以后的图像，出现大幅度的空白，是否应调整图像大小。
* 中英文摘要页面已完成，但英文字体未符合要求  （已经修改英文字体 QinYuguo 01-15 0:38)
* 附录在自动生成目录时并未出现在目录中，不知如何处理  (已经放入目录 QinYuguo 01-15 0:38)
* 在主要符号页面试图复制清华模板，但是失败了。。。
* 致谢页面完成，但无法在目录显示 (已经放入目录 QinYuguo 01-15 14:55)
* 清华模板中有完整的参考文献格式，但我对这个bst文件不太懂，不知如何使用。如果自己编写，应如何做？

* 以下尚未完成
* 页眉和页脚：页眉距边界2.0cm，页脚距边界1.75cm。脚注：全文的脚注一律采用五号。
* 页眉内容：每一页均须有页眉（封面除外）。页眉用五号宋体，居中排列。奇数页页眉为相应内容的名称、正文中相应各章的名称，偶数页页眉为“西安交通大学本科毕业设计(论文)”。格式为页眉的文字内容之下划两条横线，线粗1/2磅，线长与页面齐宽。 (页眉内容已经实现 QinYuguo 01-15 14:55)
* 页码：正文前的内容（任务书，考核评议书，评审意见，答辩结果，中英文摘要，目录）用罗马数字单独标注页码。正文开始用阿拉伯数字标注。页码位于页面底端，对齐方式为 “外侧”。附录必须与正文装订在一起，页码要接着正文的页码连续编写。 (页码已经实现 QinYuguo 01-15 14:55)
* The toc shouldn't be colored.
* The fontsize should be redefined. We should defined the whole set of \normalsize, \small, \huge, etc.(QinYuguo::已经制作)

* 完成对脚注设置，并对摘要，表格进行微调。
* 现在就剩参考文献，主要符号页面还没着手了(QinYuguo::参考文献和主要符号都已经制作)

* 利用titlps宏包对页眉页脚重新设置。将example文件夹内的xjtubsc.cls-haoyun做了修改。

Bugs
------
1)SeaGreen4那个颜色在lstlisting环境出现注释的时候提示无法找到。