Template for Bachelor of Science Thesis in XJTU
======

Description
------

This project is aiming at making a \LaTeX{} template for the B.Sc. thesis in Xi'an Jiaotong University. The format is based on the 《2013届本科毕业设计（论文）工作手册》.

基本实现所有的功能，正在调试阶段。期待正式版本发布！

Authors
------
**Wang Hongxin** [@github](https://github.com/wanghongxin)

**Qin Yuguo** [@github](https://github.com/FireUponSKy), [@bitbucket](https://bitbucket.org/FireUponSky)

**Hao Yun** [@github](https://github.com/haoyun), [@bitbucket](https://bitbucket.org/haoyun)

License
------
The file is distributed under the LPPL (v3 or later) license. See LICENSE for details.

For Authors
------
To get started, run:

    git clone https://github.com/haoyun/xjtu-thesis-bsc.git xjtu-thesis-bsc/
    cd xjtu-thesis-bsc/

in the shell, where xjtu-thesis-bsc/ is your working directory with arbitary name.

Remember to **pull** the newest version in the github repo to merge differences and then **push** your contributions.

You may also **folk** the main repo to your own github repo.

Changelog
------

Todo List
-----
* 排版
  * `[✓]` ~~第三级标题的"左起空两字符"实现的很ugly。且其中要求"段前空三行，段后空两行",不知是什么?~~
  * `[✓]` ~~页眉和页脚：页眉距边界2.0cm，页脚距边界1.75cm。脚注：全文的脚注一律采用五号。~~
  * `[✓]` ~~格式为页眉的文字内容之下划两条横线，线粗1/2磅，线长与页面齐宽。但是磅可能是 bg，即大点，所以页眉线可能有问题。~~
  * `[✓]` ~~三级标题的缩不准确。~~
  * `[✓]` 规范中所说的页眉距边界 2.0cm 是指文字上边与边界的距离，而这里确是文字中分线距边界的距离，此处一直未调整。
  * `[ ]` 如果 \section{} 前面的章节没有内容，那么\section不会另起一页（应该不算bug）。
  * `[ ]` 任务书横线表单里面不能使用 \\ 断行。考虑给 \\ 命令加 patch。
  * `[ ]` pdf书签从参考文献部分开始不能够正确跳转。
  * `[✓]` ~~统一设置页眉字号为 \small。不要 \sectionmark{\small 参考文献} 等。正文页眉字体不正确。~~
* 宏包
  * `[✓]` ~~把任务表书内容整合。~~ 
  * `[✓]` ~~规范命令名称。~~
  * `[ ]` 版权信息补全。
  * `[ ]` 清理没用的注释。
  * `[ ]` 决定是否依赖 xeCJKfntef。考虑更改为选项。
  * `[✓]` ~~amssymb 宏包和新版本 TeX Gyre Termes Math 有冲突。~~
  * `[ ]` 去除对 ctexart 的依赖（长期目标）。
* 用户界面
  * `[ ]` 编写完整的文档。
  * `[ ]` 编写常宏包文件，类似thutils.sty(清华的)，内含各种包的加载，配置等。供初级用户使用。
  * `[✓]` ~~xcolor，with option x11names~~
  * `[ ]` 完善文档选项，例如 ~~screen/print~~, winfonts/nofonts 等。可以参考 daiweisi的xjtuthesis（垃圾产品） 以及其他学校的模板。
  * `[✓]` ~~毕设开始结束日期可以用更简洁的方式实现，而不使用六个命令来实现~~
  * `[ ]` 编写空模板，替代example文件夹中的文件。模板参考清华TEXMF-DIST/doc/latex/thuthesis/example.main。
  * `[ ]` 在没有使用 \extrapages 时通过 pdfpages 插入word->pdf生成的任务书等。
  * `[ ]` 传递nofonts给ctex，给出用户自定义字体的例子。
* 在pdflatex下进行测试。
  * `[✓]` ~~pdflatex 下目录颜色设置有问题。print 选项开启时仍为红色。~~
  * `[✓]` ~~pdflatex 下任务书个别地方对齐有问题。通过使用tabular来修改。~~
  * `[✓]` ~~在 pdflatex 下，代码的分页有问题，可能与times字体编码T1有关。~~
  * `[✓]` ~~脚注的加圈编号进行了改写，但是需要依赖两个符号宏包。需要改进。原始实现方法在pdflatex下无法编译。原因未知。~~








