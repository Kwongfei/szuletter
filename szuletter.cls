%
% Shenzhen University
% Letter Template with SZU Title for LaTeX Users
%
%   Version
%       1.0
%   Created 
%       2024.04.19 by Guangfei Liang
%
%       $Id$
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{szuletter}[2024/04/19 SZU letter document class]

\LoadClass{article}

% 新增选项：校区和语言版本
\newif\ifszu@yuehai\szu@yuehaifalse  % 粤海校区
\newif\ifszu@lihu\szu@lihufalse      % 丽湖校区
\newif\ifszu@english\szu@englishfalse % 英文
\newif\ifszu@chinese\szu@chinesefalse % 中文
\newif\ifszu@pagenum\szu@pagenumfalse % 页码

\DeclareOption{yuehai}{\szu@yuehaitrue}
\DeclareOption{lihu}{\szu@lihutrue}
\DeclareOption{english}{\szu@englishtrue}
\DeclareOption{chinese}{\szu@chinesetrue}
\DeclareOption{pagenum}{\szu@pagenumtrue}

\ProcessOptions\relax

\RequirePackage[
  left=3.17cm,
  right=3.17cm,
  top=6.2cm,
  bottom=2.5cm
]{geometry}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}

\RequirePackage{xeCJK}
\setCJKmainfont[BoldFont=SimHei, ItalicFont=KaiTi]{SimSun}
\setCJKsansfont{Microsoft YaHei}
\setCJKmonofont{FangSong}
\RequirePackage{graphicx}
\RequirePackage{xcolor}

% 定义全局变量
\newcommand{\szu@campus}{}
\newcommand{\szu@address}{}
\newcommand{\szu@postcode}{}
\newcommand{\szu@tel}{}
\newcommand{\szu@lang@setup}{}

% 检查校区选项，并应用设置
\ifszu@yuehai
  \ifszu@english
    \renewcommand{\szu@campus}{Yuehai Campus}
    \renewcommand{\szu@address}{No.3688 Nanhai Avenue, Nanshan District, Shenzhen, CHINA}
    \renewcommand{\szu@postcode}{518052}
    \renewcommand{\szu@tel}{0755-26536114}
    \renewcommand{\szu@lang@setup}{\relax}    
  \fi
  \ifszu@chinese
    \renewcommand{\szu@campus}{粤海校区}
    \renewcommand{\szu@address}{中国广东省深圳市南山区南海大道3688号}
    \renewcommand{\szu@postcode}{518052}
    \renewcommand{\szu@tel}{0755-26536114}
    \renewcommand{\szu@lang@setup}{\relax}
  \fi
\fi

\ifszu@lihu
  \ifszu@english
    \renewcommand{\szu@campus}{Lihu Campus}
    \renewcommand{\szu@address}{No. 1066, Xueyuan Avenue, Nanshan District, Shenzhen, CHINA}
    \renewcommand{\szu@postcode}{518055}
    \renewcommand{\szu@tel}{0755-26536114}
    \renewcommand{\szu@lang@setup}{\relax}
  \fi
  \ifszu@chinese
    \renewcommand{\szu@campus}{丽湖校区}
    \renewcommand{\szu@address}{中国广东省深圳市南山区学苑大道1066号}
    \renewcommand{\szu@postcode}{518055}
    \renewcommand{\szu@tel}{0755-26536114}
    \renewcommand{\szu@lang@setup}{\relax}
  \fi
\fi

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt} %去掉页眉下面的横线
\definecolor{szured}{RGB}{140, 10, 65}

% 插入logo以及页眉页脚
% 页眉内容设置

\fancyhead[C]{%
\begin{tikzpicture}[x=1mm, y=1mm, remember picture,overlay]
  \node[anchor=north, yshift=5mm] at (current page.north) {\includegraphics[scale=0.3]{figures/szulogo_name.pdf}};    
  \node[anchor=north, yshift=-4.7cm] at (current page.north) {%
      \ifszu@english
        {%
        \textbf{Address}: \szu@address \quad
        \textbf{Post code}: \szu@postcode \quad
        \textbf{Telephone}: \szu@tel
        }
      \fi
      \ifszu@chinese
        {%
        \textbf{地址}: \szu@address \quad
        \textbf{邮编}: \szu@postcode \quad
        \textbf{电话}: \szu@tel
        }
      \fi
    };
    \fill[szured] ([shift={(-10mm,-56.6mm)}]current page.north east) rectangle ([shift={(10mm,-57mm)}]current page.north west);
\end{tikzpicture}
}

% 控制页码显示
\ifszu@pagenum
  \fancyfoot[C]{\thepage} % 显示页码在页脚中心
\fi

\AtBeginDocument{
  \szu@lang@setup
  % \ifszu@pagenum
  %   \pagestyle{plain}  % 显示页码
  % \else
  %   \pagestyle{empty}  % 隐藏页码
  % \fi
}

\endinput