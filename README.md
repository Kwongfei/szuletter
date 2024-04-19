# szuletter

# What's szuletter

最近在准备资料的时候，想找一个有深大抬头的信纸，结果发现没有电子版，而淘宝要10个大洋。转而向Github求助，发现了有哈工大的信纸模板['szuletter'](https://github.com/Kwongfei/szuletter)。于是研究了一下这个模板的制作，并在Chat老师的帮助下完成了这个szuletter的模板制作。

SZU Letter是为深圳大学两个校区制作的 LaTeX 信纸模板，主要文件是szuletter.cls以及对应的校名图像(主要是用福昕pdf从官网给的pdf里截取出来的)。制作本模板的目的是方便 TeX 用户（word感觉还是没有Tex那种一劳永逸的感觉）撰写带有深大标志的文档/信件，免去自行设置的繁琐过程，同时尽可能符合学校的相关规定，使生成的文件更加正式、美观。

模板提供三个校区的信纸布局——yuehai, lihu——以供用户根据不同需要选择。同时提供了中英文版本，——chinese, english。也考虑到部分场景需要添加页码，页码（pagenum）作为可选项。

模板使用方式简介：

```tex
校区可选为yuehai, lihu之一
语言版本可选为english, chinese之一
可添加pagenum参数，添加即有页码，去掉即不显示页码

模板使用方式简介：
	\documentclass[<校区>,<语言>,<pagenum>]{szuletter}
```


模板的实现简介：

模板基于article文档类定制，使用xeCJK提供中文支持，使用graphicx+tikz+calc宏包绘制信纸部件，使用xcolor宏包实现配色调整，使用geometry+everypage+fancyhdr宏包控制页眉输出。

按照学校标识颜色，配色深大校徽同款红色和黑色，用户如果确实需要调整配色，可以自行修改配色方案。

本部的信纸信息较为全面，有地址、邮编、电话等，若有其他需要也可自行添加。

# 如何使用

# 各文件说明

| 文件(夹)名          | 用途 |
|:----|:----|
| figures/ | 标志引用文件夹 |
| [szuletter.cls](./szuletter.cls) | 模板类文件 |
| [szuletter-example.tex](./szuletter-example.tex) | 示例文档主文件 |
| [szuletter-example.pdf](./szuletter-example.pdf) | 示例文档 |
| .gitignore| 忽略文件（开发用） |
| LICENSE | 模板采用协议 |
| README.md | 使用说明（本文件） |

# 协议说明

深圳大学校徽校名图片（[szulogo.pdf](./figures/szulogo.pdf), [szulogo_name.pdf](./figures/szulogo_name.pdf)）的版权归深圳大学所有。

szuletter.cls 文档类与相关附属文件使用 MIT 协议授权。

# TODO

目前的版本仅提供基本的页眉，主体还是空白，后续若用来写信可能还需要横线。

