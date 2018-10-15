\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%
% Colors %
%%%%%%%%%%
% Gruvbox color pallette
\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{bg}{HTML}{FBF1C7}

\definecolor{darkgray}{HTML}{282828}
\definecolor{gray}{HTML}{3C3836}
\definecolor{lightgray}{HTML}{594945}

\definecolor{green}{HTML}{98971A}
\definecolor{orange}{HTML}{D79921}
\definecolor{purple}{HTML}{B16286}
\definecolor{red}{HTML}{CC241D}
\definecolor{blue}{HTML}{458588}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
  \colorlet{bg}{white}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%
%Drop Helvetica for Roboto font
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\RequirePackage[activate={true,nocompatibility},final,factor=1100,stretch=10,shrink=10,expansion=false,verbose=silent]{microtype}

\newfontfamily\bodyfont[]{Roboto}
\newfontfamily\thinfont[]{Roboto Thin}
\newfontfamily\headingfont[]{Roboto Condensed Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{EB Garamond}

\setmathfont{XITS Math}
\RequirePackage{xltxtra}

%%%%%%%%%%
% Language %
%%%%%%%%%%
%Allow spanish characters
\RequirePackage{polyglossia}
\setdefaultlanguage[]{spanish}



%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{bg}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \headingfont\Large\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Social icons %
%%%%%%%%%%%%%%%%

\RequirePackage{fontawesome}

% Add instagram logo to fontawesome
%\expandafter\def\csname faicon@instagram\endcsname           {\symbol{"F16D}}  \def\faInstagramSquare {{\FA\csname faicon@instagram\endcsname}}

\newcommand{\phone}[1]{%
    \faPhone\quad\href{tel:#1}{#1}
}

\newcommand{\website}[1]{%
  \faGlobe\quad\href{http://#1}{#1}
}

\newcommand{\email}[1]{%
  \faEnvelope\quad\href{mailto:#1}{#1}
}

\newcommand{\instagram}[1]{%
  \social{https://instagram.com}{\faInstagram}{#1}
}

\newcommand{\facebook}[1]{%
  \social{https://facebook.com}{\faFacebook}{#1}
}

\newcommand{\twitter}[1]{%
  \social{https://twitter.com}{\faTwitter}{#1}
}

\newcommand{\github}[1]{%
  \social{https://github.com}{\faGithub}{#1}
}

\newcommand{\linkedin}[1]{%
  \social{https://linkedin.com/in}{\faLinkedin}{#1}
}

\newcommand{\social}[3]{
  \href{#1/#3}{#2 \raisebox{0.1ex}{\scriptsize/} #3}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
