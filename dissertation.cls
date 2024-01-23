%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%        ~~~~ EDITOR'S NOTE ~~~~
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This file contains the definition of the disseration class
%                       - based around the book class
%                       - optional choices are listed in the stylesheet
%
% This is the PhD thesis of Laurens P. Stoop in LaTeX
%                       - Comments, remarks and more: email me at laurensstoop@protonmail.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%         ~~~~ END OF: EDITOR'S NOTE ~~~~
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%         ~~~~ Dissertation class definitions ~~~~
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% The base class definition, we require LaTeX2e and provide the dissertation class
%       - Based on the  TU Delft dissertation class (v1.0) 08-07-2013
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dissertation}[2023/04/18 v0.4 Laurens Stoop dissertation class]

\newif\if@nativefonts
\DeclareOption{nativefonts}{\@nativefontstrue}
\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[10pt,twoside]{book}






% Correct alignment of english text
%       - can be set to most of standard languages
%       - call by english language name, i.e. 'dutch' instead of 'nederlands'
\usepackage[british]{babel}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
%\RequirePackage{amssymb}
\RequirePackage{calc}
\RequirePackage[small,bf]{caption}
%\RequirePackage{chapterbib}
\RequirePackage{etaremune}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{siunitx}

\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}


%\RequirePackage[nottoc]{tocbibind}

\RequirePackage{float}
\ifxetex
    \RequirePackage[xetex]{geometry}
    \RequirePackage[xetex]{graphicx}
    \RequirePackage[xetex]{hyperref}
    \RequirePackage{fontspec}
    \RequirePackage{xltxtra}
    \defaultfontfeatures{Ligatures=TeX}
\else
    \ifpdf
        \RequirePackage[pdftex]{geometry}
        \RequirePackage[pdftex]{graphicx}
        \RequirePackage[pdftex]{hyperref}
    \else
        \RequirePackage[dvips]{geometry}
        \RequirePackage[dvips]{graphicx}
        \RequirePackage[hypertex]{hyperref}
    \fi
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
\fi
\RequirePackage{lettrine}
\RequirePackage{metalogo}
%\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{tikz}
\RequirePackage{circuitikz}
\RequirePackage{multicol}
\RequirePackage{enumitem}
%\RequirePackage{pgfkeys}
%\RequirePackage{pgfplots}

\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{hhline}
\RequirePackage{booktabs}


%% If the document is not compiled with XeLaTeX, we need to use the native
%% fonts.
\ifxetex\else
    \@nativefontstrue
\fi

% Reads the input as utf8 and encodes as T1
\if@nativefonts
    %% The native font is Utopia Regular with Fourier math. We use Latin Modern
    %% as a fallback, since Utopia lacks support for sans-serif and monospace.
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{lmodern}
    \RequirePackage{fourier}
    %% The style for titles is small caps.
    \def\titlefont{\rmfamily}
%    \def\titleshape{\scshape}
    \def\titleshape{}
    \def\titlestyle{\titlefont\titleshape\bfseries}

    \if@print
%        \def\headerstyle{\titlefont\titleshape\bfseries}
        \def\headerstyle{\titlefont\titleshape} 
    \else
        \def\headerstyle{\titlefont\titleshape}
    \fi

    %% ADDED by DVW
    \def\largetitlefont{\fontfamily{Roboto-LF}} %Roboto-LF or rmfamily
    \def\largetitleseries{\fontseries{m}}
    \def\largetitleshape{\fontshape{n}}
    \def\largetitlestyle{\largetitlefont\largetitleseries\largetitleshape}
    %% end ADDED by DVW
\else
    %% The TU Delft house style fonts are Bookman Old Style (serif) for titles
    %% and Tahoma (sans-serif) for text. Apart from these, we use Courier New
    %% for monospace and Cambria for math.
    \RequirePackage{unicode-math}
    \setmainfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{BookmanOldStyle}
    \setmainfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        BoldItalicFont = *-Bold,
        BoldItalicFeatures = FakeSlant
    ]{Tahoma}
    \setsansfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        BoldItalicFont = *-Bold,
        BoldItalicFeatures = FakeSlant
    ]{Tahoma}
    \setmonofont[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = *MT,
        BoldFont = *-BoldMT,
        ItalicFont = *-ItalicMT,
        BoldItalicFont = *-BoldItalicMT
    ]{CourierNewPS}
    \setmathfont[
        Path = fonts/,
        Extension = .ttf
    ]{CambriaMath}
    %% The default style for text is Tahoma (sans-serif).
    \renewcommand*\familydefault{\sfdefault}
    %% The default style for titles is Bookman Old Style (serif).
    \def\titlefont{\rmfamily}
    \def\titleshape{}
    \if@print
        \def\titlestyle{\titlefont\titleshape\bfseries}
    \else
        \def\titlestyle{\titlefont\titleshape}
    \fi
    \def\headerstyle{\titlestyle}
\fi



%%%% This code chunk is to fix UU's use of 0-100 color definitions
%% See: https://tex.stackexchange.com/a/234882
{\lccode`\?=`\p \lccode`\!=`\t  \lowercase{\gdef\ignorept#1?!{#1}}}
\def\divbyccvv#1{\expandafter\ignorept\the\dimexpr#1pt/100\relax}

\def\defineCMYKcolor#1#2{\defineCMYKcolorA{#1}#2,} 
\def\defineCMYKcolorA#1#2,#3,#4,#5,{\edef\tmp{\noexpand\definecolor{#1}{cmyk}%
      {\divbyccvv{#2},\divbyccvv{#3},\divbyccvv{#4},\divbyccvv{#5}}}\tmp
}

%% Change color model based on print option
\if@print%
    \selectcolormodel{cmyk}
\else
    \selectcolormodel{rgb}
\fi

\if@print
    \defineCMYKcolor{uu-black}{20,0,0,100}
    \defineCMYKcolor{uu-white}{0,0,0,0}
    \defineCMYKcolor{uu-yellow}{0,15,100,0}
    \defineCMYKcolor{uu-red}{0,100,80,0}
    \defineCMYKcolor{uu-cream}{0,10,40,0}
    \defineCMYKcolor{uu-orange}{0,50,65,0}
    \defineCMYKcolor{uu-burgundy}{30,100,40,10}
    \defineCMYKcolor{uu-brown}{35,70,80,50}
    \defineCMYKcolor{uu-green}{75,8,50,0}
    \defineCMYKcolor{uu-blue}{70,40,0,0}
    \defineCMYKcolor{uu-darkblue}{100,80,0,70}
    \defineCMYKcolor{uu-purple}{80,100,0,0}
\else
    \definecolor{uu-black}{RGB}{0,0,0}
    \definecolor{uu-white}{RGB}{255,255,255}
    \definecolor{uu-yellow}{RGB}{255,205,0}
    \definecolor{uu-red}{RGB}{192,10,53}
    \definecolor{uu-cream}{RGB}{250,230,171}
    \definecolor{uu-orange}{RGB}{243,150,94}
    \definecolor{uu-burgundy}{RGB}{170,21,85}
    \definecolor{uu-brown}{RGB}{110,59,35}
    \definecolor{uu-green}{RGB}{36,167,147}
    \definecolor{uu-blue}{RGB}{82,135,198}
    \definecolor{uu-darkblue}{RGB}{0,18,64}
    \definecolor{uu-purple}{RGB}{91,33,130}
\fi

%% Additional personal colours
\definecolor{laurensstoop-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{laurensstoop-green}{cmyk}{0.66,0,1,0}

%% Use TU Delft cyan as the color for titles, unless the 'print' option is
%% specified, in which case we use anthracite, a dark gray, which is also used
%% for the thumb indices.
\definecolor{anthracite}{cmyk}{0,0,0,0.8}
\if@print
    \colorlet{title}{laurensstoop-green}
\else
    \colorlet{title}{laurensstoop-green} %{uu-cyan}
\fi
\colorlet{thumb}{laurensstoop-green}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% ~~~~ Layout

%% Define some lengths:
\newlength{\bleedsize}
\newlength{\basemargin}
\newlength{\bindingoff}
\newlength{\pagewidth}
\newlength{\pageheight}
%% A margin of 2cm is safe and recommended by most printers
\setlength\basemargin{20mm}
%% Add additional space to the inner margin to compensate for the binding
\setlength\bindingoff{5mm}
%% Set the paper size to 17 by 24 cm, the standard for dissertations.
\setlength\pagewidth{170mm}
\setlength\pageheight{240mm}
%% Add 3mm bleed (page extension) around the outer edges of each page
\setlength\bleedsize{3mm}

\if@print
    %% In print mode we add a 3 mm bleed on the outside of the page.
    %% We use 20 mm all around, with an additional 5mm on the inside
    %% if the print option is active (this is corrected for in the
    %% non-print version).
    \geometry{
        papersize = {\pagewidth + \bleedsize, \pageheight + 2\bleedsize},
        layoutsize = {\pagewidth - \bleedsize, \pageheight},
        layoutoffset = {\bleedsize, \bleedsize},
        bindingoffset = -\bleedsize,
        top = \basemargin + 5mm,
        bottom = \basemargin,
        inner = \basemargin + \bindingoff,
        outer = \basemargin,
        marginparwidth = 0mm,
        marginparsep = 0mm
    }
\else
     \geometry{
        papersize= {\pagewidth, \pageheight},
        layoutsize = {\pagewidth, \pageheight},
        layoutoffset = {0mm, 0mm},
        top = \basemargin + 5mm,
        bottom = \basemargin,
        inner = \basemargin + 0.5\bindingoff,
        outer = \basemargin + 0.5\bindingoff,
        marginparwidth = 0mm,
        marginparsep = 0mm
     }
\fi

%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][]{%
    \def\@subtitle{#1}%
    \def\@title{#2}%
    %% Add the title to the PDF meta data.
    \hypersetup{pdftitle=#2}%
}
%% Redefine the author command to accept a first and last name, and to add the
%% full name to the PDF meta data.
\renewcommand*\author[2]{%
    \def\@firstname{#1}%
    \def\@lastname{#2}%
    \hypersetup{pdfauthor=#1\ #2}%
}

%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}

%% Print cropmarks of 2mm length indicating the actual papersize (so, without the
%% 3mm bleed at the outer edges. Optional to add another cropmark to indicate the
%% edge of the bindingoffset.
\if@print%
    \newcommand*\cropmarks{%
        \ifodd\c@page%
            \begin{tikzpicture}[remember picture,overlay]
                \draw ($(current page.north east)+(0mm,-\bleedsize)$) -- ($(current page.north east)+(1mm - \bleedsize,-\bleedsize)$);
                \draw ($(current page.north east)+(-\bleedsize,0mm)$) -- ($(current page.north east)+(-\bleedsize,1mm - \bleedsize)$);
                \draw ($(current page.south east)+(0mm,\bleedsize)$) -- ($(current page.south east)+(1mm - \bleedsize,\bleedsize)$);
                \draw ($(current page.south east)+(-\bleedsize,0mm)$) -- ($(current page.south east)+(-\bleedsize,\bleedsize - 1mm)$);
                %\draw ($(current page.north west)+(\bindingoff,0mm)$) -- ($(current page.north west)+(\bindingoff,1mm - \bleedsize)$);
                %\draw ($(current page.south west)+(\bindingoff,0mm)$) -- ($(current page.south west)+(\bindingoff,\bleedsize - 1mm)$);
            \end{tikzpicture}%
        \else%
            \begin{tikzpicture}[remember picture,overlay]
                \draw ($(current page.north west)+(0mm,-\bleedsize)$) -- ($(current page.north west)+(\bleedsize - 1mm,-\bleedsize)$);
                \draw ($(current page.north west)+(\bleedsize,0mm)$) -- ($(current page.north west)+(\bleedsize,1mm - \bleedsize)$);
                \draw ($(current page.south west)+(0mm,\bleedsize)$) -- ($(current page.south west)+(\bleedsize - 1mm,\bleedsize)$);
                \draw ($(current page.south west)+(\bleedsize,0mm)$) -- ($(current page.south west)+(\bleedsize,\bleedsize - 1mm)$);
                %\draw ($(current page.north east)+(-\bindingoff,0mm)$) -- ($(current page.north east)+(-\bindingoff,1mm - \bleedsize)$);
                %\draw ($(current page.south east)+(-\bindingoff,0mm)$) -- ($(current page.south east)+(-\bindingoff,\bleedsize - 1mm)$);
            \end{tikzpicture}%
        \fi%
    }
\else
    \newcommand*\cropmarks{}
\fi%

%%% Thumb indices consist of white text on a rectangular colored background. The
%%% font-size is 75% of the size of thumb height.
\newif\ifthumb
\newlength\thumbheight
\setlength\thumbheight{24pt}
\newlength\thumbedge
\setlength\thumbedge{4pt}
\newlength\thumbhspace
\setlength\thumbhspace{36pt}
\newlength\thumbvspace
\setlength\thumbvspace{2\thumbheight}

\newlength\thumbwidth
\setlength\thumbwidth{36pt}
\newlength\thumbspacing
\setlength\thumbspacing{2\thumbheight}

%% We need the TikZ library calc to calculate the coordinates of the thumb
%% indices.
\usetikzlibrary{calc}

% Colours of the chapters
\defineCMYKcolor{thumb0}{100,80,0,70} % blue
\defineCMYKcolor{thumb1}{80,100,0,0} % purple
\defineCMYKcolor{thumb2}{0,100,80,0} % reddish
\defineCMYKcolor{thumb3}{0,15,100,0} % orange
\defineCMYKcolor{thumb4}{80,100,0,0} % purple
\defineCMYKcolor{thumb5}{80,100,0,0} % purple
\defineCMYKcolor{thumb6}{100,80,0,70} % blue
\defineCMYKcolor{thumb7}{100,80,0,70} % blue
\defineCMYKcolor{thumb8}{20,0,0,100} % black


%%% THIS IS WHERE WE CAN ADD A CLIMATE STRIPE THUMB
% Temperature scale covering the last X years or years of my life within the disserations

%% The lthumb command prints the current chapter number in a thumb index on the
%% left (even) page.
\newcommand*\lthumb{%
    \ifthumb%
        \begin{tikzpicture}[remember picture,overlay]
            \coordinate (top margin) at (0pt,1.5in+\topmargin+\headheight+\headsep);
            \coordinate (left margin) at (1in+\evensidemargin + 10pt,0pt);
            %% Calculate the corners of the thumb index based on the current
            %% chapter number.
            \coordinate (top left) at ($(current page.north west)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
            \coordinate (bottom right) at ($(top left)+(left margin)-(\thumbhspace,\thumbheight)$);
            %% Shift the left edge to prevent the rounded corner from showing.
            \coordinate (top left) at ($(top left)-(\thumbedge,0pt)$);
            %% Draw the thumb index.
            %\fill[fill=thumb,rounded corners=\thumbedge](top left) rectangle (bottom right);
            \fill[fill=thumb\arabic{thumbcounter},rounded corners=\thumbedge](top left) rectangle (bottom right);
            %% Print the chapter number at the center right in the thumb index.
            \coordinate (center right) at ($(bottom right)+(0pt,0.5\thumbheight)$);
            \node at (center right)[anchor=east,inner sep=2\thumbedge]{
                \titlefont\bfseries\color{uu-white}
                \fontsize{0.75\thumbheight}{0.75\thumbheight}\selectfont
                \thechapter
            };
        \end{tikzpicture}%
    \fi%
}

%% rthumb draws a thumb index on the right (odd) page.
\newcommand*\rthumb{%
    \ifthumb%
        \begin{tikzpicture}[remember picture,overlay]
            \coordinate (top margin) at (0pt,1.5in+\topmargin+\headheight+\headsep);
            \coordinate (right margin) at (1in+\evensidemargin + 10pt,0pt);
            %% Calculate the corners of the thumb index based on the current
            %% chapter number.
            \coordinate (top right) at ($(current page.north east)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
            \coordinate (bottom left) at ($(top right)-(right margin)-(-\thumbhspace,\thumbheight)$);
            %% Shift the left right to prevent the rounded corner from showing.
            \coordinate (top right) at ($(top right)+(\thumbedge,0pt)$);
            %% Draw the thumb index.
            %\fill[fill=thumb,rounded corners=\thumbedge](top right) rectangle (bottom left);
            \fill[fill=thumb\arabic{thumbcounter},rounded corners=\thumbedge](top right) rectangle (bottom left);
            %% Print the chapter number at the center right in the thumb index.
            \coordinate (center left) at ($(bottom left)+(0pt,0.5\thumbheight)$);
            \node at (center left)[anchor=west,inner sep=2\thumbedge]{
                \titlefont\bfseries\color{uu-white}
                \fontsize{0.75\thumbheight}{0.75\thumbheight}\selectfont
                \thechapter
            };
        \end{tikzpicture}%
    \fi%
}

%% Page style for empty pages.
\fancypagestyle{empty}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyhead{\cropmarks}
}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyhead{\cropmarks}
    \fancyfoot[C]{\titlefont\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[LE]{\cropmarks\lthumb\titlefont\thepage}
    \fancyhead[RO]{\cropmarks\rthumb\titlefont\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[RE]{\titlefont\titleshape\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[LO]{\titlefont\titleshape\nouppercase{\rightmark}}
    %\fancyfoot[C]{CONFIDENTIAL}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page in color.
\renewcommand*\chaptermark[1]{\markboth{\thechapter.\ \color{thumb\arabic{thumbcounter}}#1}{}}
\renewcommand*\sectionmark[1]{\markright{\thesection.\ \color{thumb\arabic{thumbcounter}}#1}}

%% The setheader command can be used to print the title of unnumbered chapters
%% in the page header.
\newcommand*\setheader[1]{\markboth{\color{thumb\arabic{thumbcounter}}#1}{\color{thumb\arabic{thumbcounter}}#1}}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{thumb\arabic{thumbcounter}}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{thumb\arabic{thumbcounter}}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright\titlestyle}
    {\Large Part \fontsize{96pt}{96pt}\selectfont\bfseries{\color{black}\renewcommand\color[2][]{}\thepart}}
    {0pt}
    {\Huge\color{thumb\arabic{thumbcounter}}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
    {\flushright\titlestyle}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thechapter}
    {0pt}
    {\Huge\color{thumb\arabic{thumbcounter}}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is
%% preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large\headerstyle}
    {\bfseries\thesection.\ }
    {0pt}
    {\color{thumb\arabic{thumbcounter}}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{12pt}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
%% font.
\titleformat{\subsection}
    {\large\headerstyle}
    {\bfseries\thesubsection.\ }
    {0pt}
    {\color{thumb\arabic{thumbcounter}}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.
\titleformat{\subsubsection}
    {\large\headerstyle}
    {}
    {0pt}
    {\color{thumb\arabic{thumbcounter}}}
%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\baselineskip}{0pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{thumb\arabic{thumbcounter}}\textbullet}
\renewcommand*\labelitemii{\color{thumb\arabic{thumbcounter}}--}
\renewcommand*\labelitemiii{\color{thumb\arabic{thumbcounter}}$\diamond$}
\renewcommand*\labelitemiv{\color{thumb\arabic{thumbcounter}}\textperiodcentered}

%% The dedication is vertically centered on a separate page and flushed to the
%% right.
\newcommand\dedication[1]{%
    \thispagestyle{empty}%
    \vspace*{\fill}%
    \begin{flushright}%
        #1%
    \end{flushright}%
    \vspace*{\fill}%
    \clearpage%
}

%% Define an unnumbered footnote command.
\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}

%% The authors environment is used to display the authors of a chapter on the
%% title page. This is only necessary if multiple people contributed
%% significantly to the chapter.
\newcommand*\authors[1]{%
    \begin{flushleft}%
        {\Large\bfseries #1}%
    \end{flushleft}%
    \vspace{2\baselineskip}%
}

%%% The epigraph environment can be used to to add a quote to the title page of
%%% a chapter.
\newcommand\epigraph[3][2\baselineskip]{%
    \begin{flushright}%
        {\rmfamily\itshape #2}%
        \vskip 0.5\baselineskip%
        #3%
    \end{flushright}%
    \vspace{#1}%
}

%% The abstract environment is used for the abstract of a chapter.
\newenvironment{abstract}{%
\section*{Abstract}%
    \list{}{\leftmargin\rightmargin}%
    \item%
    \relax%
    \rmfamily\itshape%
}{%
    \endlist%
}

%% Define a drop command which can be used to generate drop caps at the
%% beginning of a section.
\renewcommand*\LettrineTextFont{\titleshape}
\newcommand*\dropcap[2]{
    \lettrine[lines=3,findent=0.2em,nindent=0pt]{\color{thumb\arabic{thumbcounter}} #1}{#2}%
}

%% Rename bibliography to reference and add color properties
%\renewcommand\bibname{\color{thumb\arabic{thumbcounter}}References}%


%% Hyperlinks are all black.
\hypersetup{
    colorlinks = true,
    citecolor = black,
    linkcolor = black,
    urlcolor = black
}


