# 1 西南大学研究生学位论文 LaTeX 模板

本模板基于 [GitHub - zoam/xmu-thesis-grd: 厦门大学研究生学位论文 LaTeX 模板](https://github.com/zoam/xmu-thesis-grd)) 按照'西南大学专业学位硕士论文规范与评价标准-202407.doc'、'D5.硕士学位论文封面格式.doc'进行了修改。本模板需要安装 `TeX Live`，并用 `XeLaTeX` 进行编译。以下是模板的部分页面展示：

![[main/main_01.png]](https://github.com/Andrewelse/SWU-thesis-master-template/blob/main/main/main_01.png)

![[main/main_03.png]](https://github.com/Andrewelse/SWU-thesis-master-template/blob/main/main/main_03.png)


![[main/main_05.png]](https://github.com/Andrewelse/SWU-thesis-master-template/blob/main/main/main_05.png)

![[main/main_07.png]](https://github.com/Andrewelse/SWU-thesis-master-template/blob/main/main/main_07.png)

![[main/main_09.png]](https://github.com/Andrewelse/SWU-thesis-master-template/blob/main/main/main_09.png)

![[main/main_11.png]](https://github.com/Andrewelse/SWU-thesis-master-template/blob/main/main/main_11.png)


# 2 数学环境定义具体内容

```latex
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
```

