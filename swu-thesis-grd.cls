%%==============================================================================
%% SWU-THESIS-GRD: 西南大学研究生学位论文 LaTeX 模板类文件
%%==============================================================================
%% 适用范围: 西南大学硕士/博士毕业论文
%% 参考标准:
%%   1. 西南大学专业学位硕士论文规范与评价标准-202407.doc
%%   2. D5.硕士学位论文封面格式.doc
%% 基底项目: 厦门大学硕士研究生论文模板 (https://github.com/zoam/swu-thesis-grd)
%% 修改者: Zhang Lin
%% 版本号: 1.0
%% 更新日期: 2025年11月26日
%%==============================================================================

%%==============================================================================
%% 1. 核心依赖与版本检查 (Kernel & Basics)
%%==============================================================================
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{swu-thesis-grd}[2021/12/28 v1.2 swu-thesis-grd document class]

%% 基础数学包 (Math Packages)
%% 注意：需在 xunicode 之前加载以避免冲突
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
\RequirePackage{upgreek}   % 直立希腊字母字体
\RequirePackage{amsfonts}  % 确保加载完整的数学字体包

%% PDF与排版工具 (PDF & Formatting Tools)
\RequirePackage[final]{pdfpages} % 插入PDF页面
\RequirePackage{ragged2e}        % 文本对齐支持
\usepackage{tabularx}            % 扩展表格支持
\usepackage{emptypage}           % 自动处理空白页，隐藏空白页页码

%% 图形支持 (Graphics)
\RequirePackage{graphicx}
\RequirePackage[absolute]{textpos} % 绝对定位宏包 (用于封面校徽定位)

%% 化学与单位宏包 (Science Support)
\RequirePackage[version=4]{mhchem}
\RequirePackage[per-mode=symbol]{siunitx}


%%==============================================================================
%% 2. 选项声明与类加载 (Options & Class Loading)
%%==============================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}

%% 定义布尔变量 switch
\newif\ifswu@master\swu@masterfalse       % 是否为硕士
\newif\ifswu@doctor\swu@doctorfalse       % 是否为博士
\newif\ifswu@istwoside\swu@istwosidefalse % 是否双面打印
\newif\ifswu@pdf\swu@pdffalse             % 是否使用PDF封面模式
\newif\ifswu@compact\swu@compactfalse     % 是否紧凑模式

%% 声明选项对应操作
\DeclareOption{twoside}{\swu@istwosidetrue}
\DeclareOption{master}{\swu@mastertrue}
\DeclareOption{doctor}{\swu@doctortrue}
\DeclareOption{pdf}{\swu@pdffalse}
\DeclareOption{compact}{\swu@compacttrue}

%% 处理选项并加载基底类 (ctexbook)
\ProcessOptions\relax
\ifswu@istwoside
% 双面打印设置：小四号字，A4，双面，右页开启章节
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
% 单面打印设置
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi


%%==============================================================================
%% 3. 全局变量与标签定义 (Variables & Labels)
%%==============================================================================

%%--- 3.1 核心字段标签定义 (中英文) ---
\def\swu@label@namelist@title{学位论文答辩委员会名单}
\def\swu@label@namelist{学位论文答辩委员会名单}

% 摘要与目录标签
\def\swu@label@abstract{摘~~~~~~~~要}
\def\swu@label@compactabstract{摘要}
\def\swu@label@enabstract{ABSTRACT}
\def\swu@label@abstractincontent{ABSTRACT-Chinese}
\def\swu@label@enabstractincontent{ABSTRACT-English}
\def\swu@label@keywords{关键词：}
\def\swu@label@enkeywords{Keywords:~}

% 附录与成果标签
\def\swu@label@appendix{附录}
\def\swu@label@enappendix{Appendix}
\def\swu@label@publications{在学期间所发表的文章}
\def\swu@label@enpublications{Relevant Academic Achievements Completed During the Acad-\linebreak emic Period}

% 参考文献与致谢标签
\def\swu@label@reference{参考文献}
\def\swu@label@enreference{References}
\def\swu@label@acknowledgements{致~~~~~~~~谢}
\def\swu@label@compactacknowledgements{致谢}
\def\swu@label@enacknowledgements{Acknowledgements}

% 目录索引标签
\def\swu@label@contents{目~~~~~~~~录}
\def\swu@label@compactcontents{目录}
\def\swu@label@encontents{Contents}
\def\swu@label@encontentszh{Contents-Chinese}
\def\swu@label@encontentsen{Contents-English}
\def\swu@label@acronymlist{主要缩略词表}
\def\swu@label@symbollist{主要符号表}
\def\swu@label@enacronymlist{List of Acronyms}
\def\swu@label@ensymbollist{List of Symbols}
\def\swu@label@figurelist{图索引}
\def\swu@label@enfigurelist{List of Figures}
\def\swu@label@tablelist{表索引}
\def\swu@label@entablelist{List of Tables}

% 模板版本
\def\swu@value@templateversion{v1.0}

%%--- 3.2 封面专用标签 (Cover Labels) ---
% 中文封面标签
\def\swu@label@schoolserialnumber{单位代码：}
\def\swu@label@studentnumber{学~~~~~~~~号：}
\def\swu@label@author{论~~~文~~~作~~者：}
\def\swu@label@advisor{指~~~导~~~教~~师：}
\def\swu@label@major{学~~~科~~~专~~业：}
\def\swu@label@researchdirection{研~~~究~~~方~~向：}
\def\swu@label@submitdate{提交论文日期：}
\def\swu@label@defenddate{论文答辩日期：}
\def\swu@label@degreegrantor{学位授予单位：}

% 英文封面标签
\def\swu@label@enauthor{Author：}
\def\swu@label@enadvisor{Supervisor：}
\def\swu@label@enmajor{Major：}
\def\swu@label@enresearchdirection{Research Direction：}
\def\swu@label@ensubmitdate{Submission Date：}


%%==============================================================================
%% 4. 用户接口与默认值 (User Interface & Defaults)
%%==============================================================================

%%--- 4.1 默认值设定 (Default Values) ---
\def\swu@value@schoolserialnumber{10635} % 西南大学代码
\def\swu@value@studentnumber{112024314000***}

% 论文类型判断
\ifswu@master
\def\swu@value@thesistype{硕~士~学~位~论~文}
\else
\def\swu@value@thesistype{博~士~学~位~论~文}
\fi

% 中文默认内容
\def\swu@value@title{资产重组：一个资不抵债国有企业的最佳选择}
\def\swu@value@author{作者姓名}
\def\swu@value@advisor{XXXX教授}
\def\swu@value@major{数学}
\def\swu@value@researchdirection{应用动力系统方向}
\def\swu@value@submitdate{~~~~年~~~~月}
\def\swu@value@defenddate{~~~~年~~~~月}
\def\swu@value@degreegrantor{西南大学}
\def\swu@value@printdate{~~~~年~~~~月}

% 英文默认内容
\def\swu@value@entitle{Your English Title Here}
\def\swu@value@submitdateen{Month/Year}
\def\swu@value@enauthor{Your English Name Here}
\def\swu@value@enadvisor{Professor XXX}
\def\swu@value@enmajor{Your Major Here}
\def\swu@value@enresearchdirection{Your Research Direction Here}

%%--- 4.2 信息录入命令 (Setter Commands) ---
% 基础信息
\newcommand\schoolserialnumber[1]{\def\swu@value@schoolserialnumber{#1}}
\newcommand\studentnumber[1]{\def\swu@value@studentnumber{#1}}

% 中文信息设置
\renewcommand\title[1]{\def\swu@value@title{#1}}
\renewcommand\author[1]{\def\swu@value@author{#1}}
\newcommand\advisor[1]{\def\swu@value@advisor{#1}}
\newcommand\major[1]{\def\swu@value@major{#1}}
\newcommand\researchdirection[1]{\def\swu@value@researchdirection{#1}}
\newcommand\submitdate[1]{\def\swu@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\swu@value@defenddate{#1}}
\newcommand\degreegrantor[1]{\def\swu@value@degreegrantor{#1}}
\newcommand\printdate[1]{\def\swu@value@printdate{#1}}

% 英文信息设置
\newcommand\entitle[1]{\def\swu@value@entitle{#1}}
\newcommand\submitdateen[1]{\def\swu@value@submitdateen{#1}}
\newcommand\enauthor[1]{\def\swu@value@enauthor{#1}}
\newcommand\enadvisor[1]{\def\swu@value@enadvisor{#1}}
\newcommand\enmajor[1]{\def\swu@value@enmajor{#1}}
\newcommand\enresearchdirection[1]{\def\swu@value@enresearchdirection{#1}}


%%==============================================================================
%% 5. 封面绘制命令 (Cover Construction)
%%==============================================================================

%%--- 5.1 中文封面 (Chinese Cover) ---
\newcommand\makecover{
	\setstretch{1.78889} % 设置行间距
	\newpage
	\cleardoublepage
	\thispagestyle{empty}
	\pdfbookmark[0]{封面}{cover}

	\ifswu@pdf
	% 模式A: 直接插入PDF封面
	\includepdf[pages=-]{pdf_files/cover.pdf}
	\else
	% 模式B: 代码绘制封面
	% 1. 校徽绝对定位
	\begin{textblock*}{3.5cm}(2cm,3cm)
		\includegraphics[width=3.5cm]{figures/SWU校徽.png}
	\end{textblock*}

	% 2. 右上角编号
	\hfill\begin{tabular}{@{}l@{}}
		{\songti \zihao{-4} \swu@label@schoolserialnumber \swu@value@schoolserialnumber} \\
		{\songti \zihao{-4} \swu@label@studentnumber \swu@value@studentnumber}
	\end{tabular}\vspace{-5pt}

	\vskip 50pt

	\begin{center}
		% 3. 中英文校名标准字
		\includegraphics[width=9cm]{figures/中英文标准字.png}
		\vskip 15pt

		% 4. 论文类型 (初号幼圆)
		{\bfseries \youyuan \zihao{0} \swu@value@thesistype} \\[50pt]

		% 5. 论文标题 (宋体二号)
		{\songti \zihao{2} \swu@value@title}
		\vskip 40pt

		% 6. 作者信息表
		{\songti \zihao{-3}
			\begin{tabular}{@{}r@{\quad}l@{}}
				\swu@label@author            & \swu@value@author \\
				\swu@label@advisor           & \swu@value@advisor \\
				\swu@label@major             & \swu@value@major \\
				\swu@label@researchdirection & \swu@value@researchdirection \\
				\swu@label@submitdate        & \swu@value@submitdate \\
				\swu@label@defenddate        & \swu@value@defenddate \\
				\swu@label@degreegrantor     & \swu@value@degreegrantor \\
		\end{tabular}}

		\vskip 30pt
		% 7. 底部日期与地点
		{\songti \zihao{-3} 中国·重庆}\\
		{\songti \zihao{-3} \swu@value@printdate}
	\end{center}

	\vskip \stretch{0.5}
	\fi
	\clearpage
}

%%--- 5.2 英文封面 (English Cover) ---
\newcommand\makecoveren{
	\setstretch{1.78889}
	\newpage
	\cleardoublepage
	\thispagestyle{empty}
	\pdfbookmark[0]{English Cover}{cover_en}
	\begin{center}
		% 顶部：SWU Logo占位与标题
		{\fontspec{Times New Roman} \bfseries \zihao{-1} \textcolor{white}{SWU}}\\
		\vskip 40pt

		{\fontspec{Times New Roman} \bfseries \zihao{0} Southwest University}
		\vskip 20pt
		{\fontspec{Times New Roman} \bfseries \zihao{0} Master's Thesis}

		\vskip 60pt

		% 英文题目
		{\songti \zihao{2} \swu@value@entitle}
		\vskip 100pt

		% 作者与导师信息
		\begin{tabular}{@{}l@{}}
			{\fontspec{Times New Roman} \zihao{-3} Author Name: \swu@value@enauthor} \\
			{\fontspec{Times New Roman} \zihao{-3} Supervisor: \swu@value@enadvisor}
		\end{tabular}\vspace{-5pt}

		\vskip 250pt

		% 日期
		{\fontspec{Times New Roman} \zihao{3} \swu@value@submitdateen}
	\end{center}

	\vskip \stretch{0.5}
	\clearpage
}

%%--- 5.3 声明页与名单 (Statements & Lists) ---
\newcommand\makecopyrightstatement{
	\cleardoublepage
	\pdfbookmark[0]{著作权使用声明}{copyright_statement}
	\thispagestyle{empty}
	\setstretch{2.2}
	\includepdf[pages=-]{pdf_files/copyright_statement.pdf}
	\newpage
	\pagestyle{empty}
	\ifswu@istwoside
		\hbox{} % 强制空白页占位
	\else
		\pagestyle{empty}
	\fi

	\clearpage
	\pagestyle{swu@headings}
}

% 答辩委员会名单环境
\newenvironment{namelist}{
	\cleardoublepage
	\thispagestyle{plain}
	\thispagestyle{empty}
	\songti\zihao{4}
	\setstretch{1.58889}
}

\newcommand\makenamelist{
	\cleardoublepage
	\pdfbookmark[0]{学位论文答辩委员会名单}{name_list}
	\thispagestyle{empty}
	\ifswu@pdf
	\includepdf[pages=-]{pdf_files/name_list.pdf}
	\else
	\input{chapters/name_list.tex}
	\fi
	\clearpage
}


%%==============================================================================
%% 6. 字体与排版设置 (Fonts & Typography)
%%==============================================================================

%%--- 6.1 中文字体配置 (Chinese Fonts) ---
\let\songti\relax
\let\heiti\relax
\let\kaishu\relax
\let\youyuan\relax
\newCJKfontfamily\songti{SimSun.ttc}[AutoFakeSlant,AutoFakeBold={2}]
\newCJKfontfamily\kaishu{SimKai.ttf}[AutoFakeSlant,AutoFakeBold={2}]
\newCJKfontfamily\heiti{SimHei.ttf}[AutoFakeSlant,AutoFakeBold={2}]
\newCJKfontfamily\youyuan{YouYuan.ttf}[AutoFakeSlant,AutoFakeBold={2}]
\setCJKmainfont{SimSun.ttc}[AutoFakeSlant,AutoFakeBold={2}]

%%--- 6.2 英文字体配置 (English Fonts) ---
\RequirePackage{xltxtra}
\RequirePackage{mathptmx}   % 数学字体近似 Times
\setmainfont{Times New Roman}
\setsansfont{Arial}         % 无衬线字体
\setmonofont{Times New Roman}

%%--- 6.3 符号与标点 ---
% 中文破折号修正
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% 本地化名称设置
\def\contentsname{\swu@label@contents}
\def\encontentsname{\swu@label@encontents}
\def\listfigurename{\swu@label@figurelist}
\def\listtablename{\swu@label@tablelist}
\newcommand{\version}{\swu@value@templateversion}


%%==============================================================================
%% 7. 页面几何与版式 (Geometry & Layout)
%%==============================================================================

%%--- 7.1 页面边距 ---
\RequirePackage[%
paper = a4paper,%
top = 3.1cm,%
bottom = 3cm,%
left = 3cm,%
right = 3cm,%
headsep = 0.34cm,%
footskip = 0.8cm,%
headheight = 13pt % 修正页眉高度警告
]{geometry}

%%--- 7.2 间距调整 ---
\setlength{\parskip}{0em}
\setlength{\abovedisplayskip}{0em}
\setlength{\belowdisplayskip}{0em}

%%--- 7.3 页码控制 ---
% 保证偶数页空白页码逻辑正确
\newcounter{blankpage}
\def\cleardoublepage{
	\clearpage
	\if@twoside
	\ifodd
	\c@page
	\else
	\stepcounter{blankpage}%
	\hbox {}\newpage
	\fi
	\fi
}

%%==============================================================================
%% 8. 标题样式与文档结构 (Headings & Structure)
%%==============================================================================

%%--- 8.1 章节标题格式 (ctexset) ---
% 一级标题 (Chapter)
\ctexset{chapter={
		name = {第,章},
		number = {\arabic{chapter}}, % 使用阿拉伯数字
		format = {\bfseries \sffamily \heiti \centering \zihao{-3}},
		pagestyle = {swu@headings},
		beforeskip = 15pt,
		afterskip = 25pt,
		fixskip = true,
		aftername = ~~~~,
	}
}

% 二级标题 (Section)
\ctexset{section={
		format={\raggedright \sffamily \bfseries \heiti \zihao{4}},
		beforeskip = 25pt,
		afterskip = 20pt,
		fixskip = true,
	}
}

% 三级标题 (Subsection)
\ctexset{subsection={
		format = {\bfseries \sffamily \heiti \raggedright \zihao{-4}},
		beforeskip = 20pt,
		afterskip = 20pt,
		fixskip = true,
	}
}

% 四级标题 (Subsubsection)
\ctexset{subsubsection={
		format={\bfseries \sffamily \heiti \raggedright \zihao{-4}},
		beforeskip = 20pt,
		afterskip = 20pt,
		fixskip = true,
	}
}

%%--- 8.2 编译控制工具 ---
\RequirePackage{ifthen}
\RequirePackage{ifpdf}

%%--- 8.3 前置/正文/后置区域划分 ---
% 前置部分 (Frontmatter): 罗马数字页码
\renewcommand{\frontmatter}{
	\@mainmatterfalse
	\setcounter{blankpage}{0}
	\global\c@page \@ne
	\renewcommand\thepage{\@Roman{\the\numexpr\value{page}-\value{blankpage}-1\relax}} % 修正页码起始
	\pagestyle{swu@headings}
}

% 正文部分 (Mainmatter): 阿拉伯数字页码
\RequirePackage[nodisplayskipstretch]{setspace}
\renewcommand{\mainmatter}{
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmattertrue
	\pagestyle{swu@headings}
	\setstretch{1.5} % 正文1.5倍行距
	\setcounter{blankpage}{0}
	\global\c@page \@ne
	\renewcommand\thepage{\@arabic{\the\numexpr\value{page}-\value{blankpage}\relax}}
}

% 后置部分 (Backmatter)
\renewcommand{\backmatter}{%
	\@mainmatterfalse
}


%%==============================================================================
%% 9. 功能宏包与环境 (Functional Packages & Environments)
%%==============================================================================

%%--- 9.1 表格增强 ---
\RequirePackage{threeparttable} % 三线表
\RequirePackage{dcolumn}        % 小数点对齐
\RequirePackage{multirow}       % 多行合并
\RequirePackage{booktabs}       % 优质表格线
\newcolumntype{d}[1]{D{.}{.}{#1}}

%%--- 9.2 算法环境 ---
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}

%%--- 9.3 定理环境定义 ---
\theoremstyle{plain}
\newtheorem{algo}{算法~}[chapter]
\newtheorem{thm}{定理~}[chapter]
\newtheorem{lem}[thm]{引理~}
\newtheorem{prop}[thm]{命题~}
\newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
\newtheorem{defn}{定义~}[chapter]
\newtheorem{conj}{猜想~}[chapter]
\newtheorem{exmp}{例~}[chapter]
\newtheorem{rem}{注~}
\newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

%%--- 9.4 图形环境配置 ---
\RequirePackage{graphicx}
\RequirePackage{subcaption} % 子图
\RequirePackage{wrapfig}    % 文字绕排

\RequirePackage{float}
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{~~}
\DeclareCaptionFont{captionfont}{\bfseries \songti \zihao{-4}}
\DeclareCaptionFont{subcaptionfont}{\songti \zihao{-4}}

% 题注设置 (Captions)
\captionsetup[sub]{font = {subcaptionfont,stretch=1}}
\captionsetup{font = {captionfont,stretch=1.3}, labelsep = zhspace}
\captionsetup[table]{position = top, aboveskip = 9pt, belowskip = 9pt}
\captionsetup[figure]{position = bottom, aboveskip = 5pt, belowskip = 0pt}

% 编号格式 (Chapter.Number)
\numberwithin{table}{chapter}
\setlength{\textfloatsep}{15pt}
\newcommand*{\captionwithsource}[2]{%
	\caption[{#1}]{#1}%
	\vspace{6pt}
	\parbox{\textwidth}{\setstretch{1.2}\zihao{-5}\hspace{2em}#2}
}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}

%%--- 9.5 代码高亮 (Listings) ---
\RequirePackage{xcolor}
\RequirePackage{listings}
\lstset{
	tabsize=4,
	frame = shadowbox,
	commentstyle = \color{red!50!green!50!blue!50},
	rulesepcolor = \color{red!20!green!20!blue!20},
	keywordstyle = \color{blue!90}\bfseries,
	showstringspaces = false,
	stringstyle = \ttfamily,
	keepspaces = true,
	breakindent = 22pt,
	numbers = left,
	stepnumber = 1,
	numberstyle = \tiny,
	basicstyle = \footnotesize,
	showspaces = false,
	flexiblecolumns = true,
	breaklines = true,
	breakautoindent = true,
	breakindent = 4em,
	aboveskip = 1em,
	fontadjust,
	captionpos = t,
	framextopmargin = 2pt,
	framexbottommargin = 2pt,
	abovecaptionskip = -3pt,
	belowcaptionskip = 3pt,
	xleftmargin = 4em,
	xrightmargin = 4em,
	texcl=true,
	extendedchars=false,
	columns=flexible,
	mathescape=true
	numbersep=-1em
}
\renewcommand{\lstlistingname}{代码}

%%--- 9.6 超链接 (Hyperref) ---
\RequirePackage{hyperref}
\hypersetup{
	bookmarksnumbered,
	linktoc = all,
	colorlinks = true,
	citecolor = black,
	filecolor = black,
	linkcolor = black,
	linkbordercolor = black,
	urlcolor = black,
	plainpages = false,
	pdfstartview = FitH
}

%%--- 9.7 列表调整 ---
\RequirePackage{enumitem}

%%--- 9.8 页眉页脚 (Fancyhdr) ---
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}

% 空页面样式
\fancypagestyle{swu@empty}{\fancyhf{}}

% 自定义双线页眉样式 (参考知网西南大学硕士标准)
\fancypagestyle{swu@headings}{
	\fancyhf{}
	\fancyhead[CO]{\zihao{5} \songti \leftmark}    % 奇数页居中：章名
	\fancyhead[CE]{\zihao{5} \songti 西南大学硕士学位论文} % 偶数页居中：固定文字
	\fancyfoot[C]{\zihao{5} \songti \thepage}      % 页脚居中：页码

	% 双线页眉线绘制
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\headrule}{%
		\vspace*{-1pt}%
		\hrule height 1.5pt width \headwidth\relax% 上粗线
		\vspace{1pt}%
		\hrule height 0.5pt width \headwidth\relax% 下细线
		\vspace*{1pt}%
	}
	\renewcommand{\footrulewidth}{0pt}
}

%%--- 9.9 脚注样式 (Footnotes) ---
\interfootnotelinepenalty=100000
\RequirePackage{pifont}
\RequirePackage[hang,flushmargin,perpage,symbol*]{footmisc}
% 带圈数字符号
\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
	{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}
% 缩进设置
\RequirePackage{scrextend}
\deffootnote{1.6em}{0em}{\thefootnotemark \enskip}


%%==============================================================================
%% 10. 论文组成部分定义 (Components)
%%==============================================================================

%%--- 10.1 中文摘要 (Chinese Abstract) ---
\newenvironment{abstract}{
	\setstretch{1.38889}
	\cleardoublepage
	{\fontspec{Times New Roman} \bfseries \zihao{-6} \textcolor{white}{SWU}}\\ % 顶部间距Hack
	{\songti\zihao{2}\bfseries\swu@value@title}
	\vskip 15pt
	\begin{center}
		\begin{tabular}{@{}l@{}}
			{\kaishu \zihao{-3}学科专业: \swu@value@major} \\
			{\kaishu \zihao{-3} 研究方向: \swu@value@researchdirection}\\
			{\kaishu\zihao{-3} 指导教师: \swu@value@advisor}\\
			{\kaishu \zihao{-3} 研~~究~~生: \swu@value@author\ (\swu@value@studentnumber)}
		\end{tabular}\vspace{-5pt}
	\end{center}

	\vskip 50pt
	\begin{center}
		{\songti\zihao{2}\swu@label@abstract}
	\end{center}

	\addcontentsline{toc}{chapter}{\swu@label@abstract}
	\markboth{\swu@label@abstract}{\swu@label@abstract}
	\addcontentsline{etoc}{chapter}{\sffamily \swu@label@abstractincontent}
	\songti\zihao{-4}
}

\newcommand\keywords[1]{\vspace{2ex}\noindent{\bfseries\songti\zihao{-4}\swu@label@keywords}\setstretch{1.38889} #1}

%%--- 10.2 英文摘要 (English Abstract) ---
\newenvironment{enabstract}{
	\setstretch{1.38889}
	\cleardoublepage
	{\fontspec{Times New Roman} \bfseries \zihao{-6} \textcolor{white}{SWU}}\\
	{\songti\zihao{2}\bfseries\selectfont\swu@value@entitle}

	\vskip 15pt
	\begin{center}
		\begin{tabular}{@{}l@{}}
			{\kaishu \zihao{-3}Major: \swu@value@enmajor} \\
			{\kaishu \zihao{-3} Speciality: \swu@value@enresearchdirection}\\
			{\kaishu\zihao{-3} Supervisor: \swu@value@enadvisor}\\
			{\kaishu \zihao{-3} Name: \swu@value@enauthor\ (\swu@value@studentnumber)}
		\end{tabular}\vspace{-5pt}
	\end{center}
	\vskip 50pt
	\begin{center}
		{\songti\zihao{2}\swu@label@enabstract}
	\end{center}

	\addcontentsline{toc}{chapter}{\swu@label@enabstract}
	\markboth{\swu@label@enabstract}{\swu@label@enabstract}
	\addcontentsline{etoc}{chapter}{\sffamily \swu@label@enabstractincontent}
	\zihao{-4}
}

\newcommand\enkeywords[1]{\vspace{2ex}\noindent{\bfseries\zihao{-4}\swu@label@enkeywords}\setstretch{1.38889}#1}


%%==============================================================================
%% 11. 目录与索引 (TOC & Indices)
%%==============================================================================

%%--- 11.1 目录样式 (Titletoc) ---
\RequirePackage{titletoc}
% 章目录样式
\titlecontents{chapter}[0pt]
{\contentsmargin{0mm} \songti \zihao{-4} \setlength{\baselineskip}{22pt}}
{\thecontentslabel\hspace{\ccwd}}
{}
{\hspace{.5em}\titlerule*{\zihao{5} \normalfont.} {\normalfont \zihao{5} \thecontentspage}}

% 节目录样式
\titlecontents{section}[1\ccwd]
{\contentsmargin{0mm} \songti \zihao{5} \setlength{\baselineskip}{22pt}}
{\thecontentslabel\hspace{\ccwd}}
{}
{\hspace{.5em}\titlerule*{\zihao{5} \normalfont.} {\normalfont \zihao{5} \thecontentspage}}

% 小节目录样式
\titlecontents{subsection}[2\ccwd]
{\contentsmargin{0mm} \songti \zihao{-4} \setlength{\baselineskip}{22pt}}
{\thecontentslabel\hspace{\ccwd}}
{}
{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} {\normalfont \zihao{-4} \thecontentspage}}

% 图表索引样式
\titlecontents{figure}[0pt]{\songti\zihao{-4}}
{\parbox[t]{1.55cm}{\figurename~\thecontentslabel}}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} {\normalfont \zihao{-4} \thecontentspage}}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
{\parbox[t]{1.55cm}{\tablename~\thecontentslabel}}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} {\normalfont \zihao{-4} \thecontentspage}}

%%--- 11.2 目录生成命令 ---
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{etoc}{\protect\hypersetup{hidelinks}}

\renewcommand\tableofcontents{
	\setstretch{1}
	\chapter*{\heiti \zihao{-2} \centering \contentsname}
	\thispagestyle{empty}
	\addcontentsline{etoc}{chapter}{\sffamily \swu@label@encontentszh}
	\makeatletter
	\renewcommand{\@pnumwidth}{0em}
	\makeatother
	\@starttoc{toc}%
	\clearpage
}

% 目录深度
\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{1}

%%--- 11.3 英文目录辅助命令 ---
\newcommand\enchapter[1]{\addtocontents{etoc}
	{\protect\contentsline{chapter}
		{\protect\numberline{\sffamily Chapter \thechapter}#1}
		{\thepage}{chapter.\thechapter}}
}
\newcommand\ensection[1]{\addtocontents{etoc}
	{\protect\contentsline{section}
		{\protect\numberline{\sffamily \thesection}#1}
		{\thepage}{section.\thesection}}
}
\newcommand\ensubsection[1]{\addtocontents{etoc}{subsection}{\protect\numberline{\thesubsection}#1}}
\newcommand\ensubsubsection[1]{\addtocontents{etoc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}}

%%--- 11.4 缩略词表配置 (Glossaries) ---
\RequirePackage{glossaries}
\RequirePackage{booktabs}
\glsdisablehyper

\newacronymstyle{acronym-cn}{%
	\ifglshaslong{\glslabel}{\glsgenacfmt}{\glsgenentryfmt}%
}{
	\renewcommand*{\GenericAcronymFields}{%
		first={\the\glslongtok\space\protect\paren{\the\glsshorttok}},%
		description={\the\glslongtok}}
	\renewcommand*{\genacrfullformat}[2]{%
		\glsentrydesc{##1}~（\glsentrylong{##1}，%
		\glsentryshort{##1}）%
	}
	\renewcommand*{\acronymentry}[1]{%
		\acronymfont{\glsentryshort{##1}}%
	}
}
\setacronymstyle{acronym-cn}

\setlength\LTleft{0pt}
\setlength\LTright{0pt}
\newglossarystyle{chinese}{
	\setlength{\glsdescwidth}{.35\textwidth}
	\setlength{\glspagelistwidth}{.35\textwidth}
	\renewenvironment{theglossary}%
	{\vspace{-5mm}\begin{longtable}{@{\extracolsep{\fill}}lp{\glsdescwidth}p{\glspagelistwidth}}\toprule[1.0pt]}%
		{\bottomrule[1.0pt]\end{longtable}}%
	\renewcommand*{\glossaryheader}{%
		\heiti 缩略词 &\heiti 英文全称 &
		\heiti 中文全称 \tabularnewline \midrule[0.2pt] \endhead}%
	\renewcommand*{\glsgroupheading}[1]{}%
	\renewcommand{\glossentry}[2]{
		\glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
		\glsentrylong{##1} & \glsentrydesc{##1}\tabularnewline
	}
	\renewcommand*{\subglossentry}[3]{
		\glossentry{##2}{##3}}
}

% 生成缩略词表
\newcommand\makeacronymlist{
	\cleardoublepage
	\setstretch{1.5}
	\markboth{\swu@label@acronymlist}{\swu@label@acronymlist}
	\addcontentsline{etoc}{chapter}{\sffamily \swu@label@enacronymlist}
	\pdfbookmark{主要缩略词表}{glossary}
	\printglossary[style=chinese, title={\protect\centering 主要缩略词表}, nonumberlist, nogroupskip]
	\clearpage
}

% 生成符号表
\newcommand\makesymbollist{
	\cleardoublepage
	\setstretch{1.5}
	\markboth{\swu@label@symbollist}{\swu@label@symbollist}
	\addcontentsline{etoc}{chapter}{\sffamily \swu@label@ensymbollist}
	\input{chapters/symbol_list.tex}
	\clearpage
}

% 生成图索引
\newcommand\makefigurelist{
	{\renewcommand{\addvspace}[1]{}
		\listoffigures}
	\addcontentsline{toc}{chapter}{\swu@label@figurelist}
	\addcontentsline{etoc}{chapter}{\sffamily \swu@label@enfigurelist}
}

% 生成表索引
\newcommand\maketablelist{
	{\renewcommand{\addvspace}[1]{}
		\listoftables}
	\addcontentsline{toc}{chapter}{\swu@label@tablelist}
	\addcontentsline{etoc}{chapter}{\sffamily \swu@label@entablelist}
}


%%==============================================================================
%% 12. 参考文献 (Bibliography)
%%==============================================================================
\RequirePackage[sort&compress]{gbt7714}
\bibliographystyle{reference/gbt7714-numerical}
\citestyle{numbers}
\newcommand{\supercite}[1]{{\citestyle{super}\cite{#1}}} % 上标引用

\renewenvironment{thebibliography}[1]{
	\zihao{5}
	\setlength{\baselineskip}{20pt}
	\chapter*{\bibname}
	\addcontentsline{etoc}{chapter}{\sffamily\swu@label@enreference}
	\markboth{\bibname}{\bibname}%
	\addcontentsline{toc}{chapter}{\swu@label@reference}
	\vspace{3pt}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{0mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{3pt}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist}


%%==============================================================================
%% 13. 学术成果与致谢 (Achievements & Acknowledgements)
%%==============================================================================

%%--- 13.1 学术成果 ---
\newenvironment{publications}[1]{
	\zihao{-4}
	\setlength{\baselineskip}{21pt}
	\chapter*{\swu@label@publications}
	\pdfbookmark[0]{在学期间所发表的文章}{publications}
	\addcontentsline{toc}{chapter}{\swu@label@publications}
	\addcontentsline{etoc}{chapter}{\sffamily\swu@label@enpublications}
	\markboth{\MakeUppercase\swu@label@publications}
	{\MakeUppercase\swu@label@publications}%
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\setlength{\parsep}{0mm}
		\setlength{\labelsep}{0.5em}
		\setlength{\itemsep}{3pt}
		\setlength{\listparindent}{0in}
		\setlength{\itemindent}{0in}
		\setlength{\rightmargin}{0in}
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `publications' environment}}%
	\endlist}
\newcommand\publicationpreamble[1]{
	\item[]\vspace{0.75cm}\hspace{-\labelwidth}\hspace{-\labelsep}{\heiti  \bfseries #1}
}

%%--- 13.2 致谢 ---
\newenvironment{acknowledgements}{
	\cleardoublepage
	\chapter*{\swu@label@acknowledgements}
	\label{acknowledgements}
	\ifswu@compact
	\markboth{\swu@label@compactacknowledgements}{\swu@label@compactacknowledgements}
	\addcontentsline{toc}{chapter}{\swu@label@compactacknowledgements}
	\else
	\markboth{\swu@label@acknowledgements}{\swu@label@acknowledgements}
	\addcontentsline{toc}{chapter}{\swu@label@acknowledgements}
	\fi

	\addcontentsline{etoc}{chapter}{\sffamily\swu@label@enacknowledgements}
	\songti \zihao{-4}
}


%%==============================================================================
%% 14. 附录设置 (Appendix)
%%==============================================================================
\newcommand\setappendixnumberformat{
	\renewcommand\theequation{\Alph{chapter}-\arabic{equation}}  % 附录编号形式: A-1
	\renewcommand\thefigure{\Alph{chapter}-\arabic{figure}}
	\renewcommand\thetable{\Alph{chapter}-\arabic{table}}
}

\endinput
%% End of swu-thesis-grd.cls