\RequirePackage{fix-cm}
\ProvidesClass{Classes/UITBA}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{scrbook}%
}
\ProcessOptions\relax
\LoadClass[fontsize=13pt, DIV=calc, oneside]{scrbook}
\usepackage{soul}

% Page format
\usepackage[a4paper,
        left=3.5cm,right=2cm,top=3cm,bottom=3.5cm
    ]{geometry}


 %==================================== Font format

 % Fancy math letters

\usepackage{amsfonts}

 % Setup Times New Roman
 \usepackage{fontspec}
 \setmainfont{Times New Roman}
%% Setup uppercase Times New Roman for a whole page
\setmainfont{Times New Roman}
\newfontfamily{\uctimes}{Times New Roman}[
  Mapping=uc-text
]

% Set 1.5 lines
 \usepackage{setspace}
\onehalfspacing

% Change the format of the chapter
\makeatletter
\renewcommand*{\chapterformat}{\mbox{\@chapapp~\thechapter\autodot\enskip}}
  \renewcommand\chapterlinesformat[3]{\@hangfrom{#2}{\MakeUppercase{#3}}
}
\makeatother
\addtokomafont{disposition}{\rmfamily\bfseries}
\addtokomafont{chapter}{\fontsize{14}{0}\selectfont}
\addtokomafont{section}{\normalsize}
\addtokomafont{subsection}{\normalsize\selectfont}
\setlength{\parskip}{6pt}
\setlength{\parindent}{0.5in}
\usepackage{indentfirst}

%====================================  Language format
\usepackage[utf8]{inputenc}
\usepackage[english, vietnamese]{babel} 
\usepackage{iflang}

%====================================  Modify the cover page

\let\oldtitlepage\titlepage
\def\titlepage{\oldtitlepage\centering\bfseries}

%====================================  Store array of string into a variable

\usepackage{arrayjobx}

%====================================  Independent parts

\newcommand{\heading}[1]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}
\newcommand{\nheading}[1]{\chapter*{#1}}

%====================================  Redefine page style

\makeatletter
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\makeatother

%====================================  Border the cover page

\usepackage{fancybox}

%====================================  Dotted line

\usepackage{kantlipsum}
\makeatletter
\newlength\dottedlinefillheight
\setlength\dottedlinefillheight{.3in}

\def\fillwithdottedlines{%
  \begingroup
  \ifhmode
    \par
  \fi
  \hrule height \z@
  \nobreak
  \setbox0=\hbox to \hsize{%\hskip \@totalleftmargin
          \vrule height \dottedlinefillheight depth \z@ width \z@
          \dotfill}%
  \cleaders \copy0 \vfill \hbox{}%
  \endgroup
}
\makeatother

%====================================  Reference stuff

\usepackage[hidelinks]{hyperref}
\usepackage[all]{hypcap}
%\addto\extrasenglish{%
 % \renewcommand{\chapterautorefname}{Chapter}%
%}

\hypersetup{
    unicode=true,
  }

\usepackage{ifthen}
\ifthenelse{\equal{\languagename}{vietnamese}}
{
  \def\equationautorefname{Phương trình}%
  \def\footnoteautorefname{chú thích cuối trang}%
  \def\itemautorefname{mục}%
  \def\figureautorefname{Hình}%
  \def\tableautorefname{Bảng}%
  \def\partautorefname{Phần}%
  \def\appendixautorefname{Phụ Lục}%
  \def\chapterautorefname{Chương}%
  \def\sectionautorefname{Mục}%
  \def\subsectionautorefname{Mục}%
  \def\subsubsectionautorefname{Mục}%
  \def\paragraphautorefname{đoạn}%
  \def\subparagraphautorefname{tiểu đoạn}%
  \def\FancyVerbLineautorefname{dòng}%
  \def\theoremautorefname{Định lý}%
  \def\pageautorefname{trang}%
}{}

%==================================== Table

\usepackage{array}
\newcolumntype{L}{>{\centering\arraybackslash}m{3cm}}
\usepackage{multirow}

%==================================== Bibliography

\usepackage[backend=biber,style=numeric-comp,sorting=sample]{biblatex}
\DeclareSortingScheme{sample}{
  \sort{
  \field{title}
  }
  \sort{
  \field{author}
  }
  \sort{
  \field{year}
  }
  \sort{\citeorder}
}
\addbibresource{Reference/Reference.bib}

%==================================== Algorithm

%\usepackage[linesnumbered,ruled]{algorithm2e}
\usepackage{algorithm,algorithmic}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}

%====================================  Loop

\usepackage{multido}


%==================================== Math stuff

\usepackage{mathtools}
\usepackage{mathastext}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}

%==================================== Figure

\usepackage{graphicx}
\usepackage{subfigure}
\usepackage{caption}
\captionsetup{labelsep=space}