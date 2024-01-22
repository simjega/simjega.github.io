%----------------------------------------------------------------------------------------
%	CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\ProvidesClass{simjega-resume}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\usepackage[hmargin=1.25cm, vmargin=1.25cm]{geometry} % Specifies horizontal and vertical page margins
\usepackage{hyperref} % Required for links
\usepackage{sectsty}
\usepackage{graphicx}

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\usepackage[usenames,dvipsnames]{xcolor} % Required for custom colors

%\definecolor{primary}{HTML}{2b2b2b} % The primary document color for content text
%\definecolor{headings}{HTML}{6A6A6A} % The color of the large sections
%\definecolor{subheadings}{HTML}{333333} % The color of subsections and places worked/studied
%\definecolor{date}{HTML}{666666} % The color used for the Last Updated text at the top right

\definecolor{primary}{HTML}{2b2b2b} % The primary document color for content text
\definecolor{headings}{HTML}{2b2b2b} % The color of the large sections
\definecolor{subheadings}{HTML}{2b2b2b} % The color of subsections and places worked/studied
\definecolor{date}{HTML}{2b2b2b} % The color used for the Last Updated text at the top right

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX

\setmainfont[Color=primary, Path = fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig} % The primary font for content text; defines bold, italic and bold-italic as well

\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight} % The font used where \sfffamily is called

\def \jgwritingfont {
  \fontspec[Path = fonts/lato/]{Lato-Lig}
  \fontsize{11pt}{13pt}}

\def \jgsectionfont {
  \fontspec[Path = fonts/lato/]{Lato-Bol}
  \fontsize{14pt}{16pt}}

\def \jgsubsectionfont {
  \fontspec[Path = fonts/lato/]{Lato-Lig}
  \fontsize{13pt}{15pt}}

\def \jgdatesfont {
  \fontspec[Path = fonts/lato/]{Lato-Lig}
  \fontsize{10pt}{10pt}}

\def \jglanguagesusedfont {
  \fontspec[Path = fonts/lato/]{Lato-Lig}
  \fontsize{8pt}{10pt}}

\def \jglistfont {
  \fontspec[Path = fonts/lato/]{Lato-Lig}
  \fontsize{10pt}{13pt}}

\def \jgheadernamefont{
  \fontsize{25pt}{20pt}
  \fontspec[Path = fonts/lato/]{Lato-Bol}}

\def \jgcontactinfofont{
  \fontspec[Path = fonts/lato/]{Lato-Bol}
  \fontsize{11pt}{14pt}}

\def \jglastupdatedfont{
  \fontspec[Path = fonts/lato/]{Lato-Lig}
  \fontsize{8pt}{10pt}}


%----------------------------------------------------------------------------------------
%	LAST UPDATED COMMAND
%----------------------------------------------------------------------------------------

\usepackage[absolute]{textpos} % Required for positioning the Last Updated text at the top right of the page

\setlength{\TPHorizModule}{0.01\paperwidth} % Sets units for horizontal position used by \begin{textblock}
\setlength{\TPVertModule}{0.01\paperwidth} % Sets units for vertical position used by \begin{textblock}

\newcommand{\lastupdated}{ % Create a new command for printing the Last Updated text
\begin{textblock}{25}(70,2) % The position of the Last Updated text on the page (75% of the page across, 2% down)
\color{date}\selectfont % Text styling of the text
Last Updated on \today % Last Updated text
\end{textblock}}

%----------------------------------------------------------------------------------------
%	MAIN HEADER COMMAND
%----------------------------------------------------------------------------------------
% Defines the command for the main heading
\newcommand{\jgheader}[2]
{
\centering{ % Center the name
  \jgheadernamefont
  \selectfont {#1}}
\\[3pt] % Whitespace between the name and contact information
\centering{ % Center the contact information
  \color{headings} % Use the headings color
  \jgcontactinfofont
  \selectfont {#2}} % Contact information font
%\noindent\makebox[\linewidth]{\color{headings}\rule{\paperwidth}{0.4pt}} % Horizontal rule
\vspace{15pt} % Reduce whitespace after the rule slightly
}


%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------

\usepackage{titlesec} % Required for customizing section/subsection/etc titles


% Removes the spacing around the main section titles
\titlespacing{\section}
  {0pt}
  {0pt}
  {0pt}

% Removes the spacing around the subsections
\titlespacing{\subsection}
  {0pt}
  {0pt}
  {0pt}

% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
% Customize the large section titles
\titleformat{\section}
  {\color{headings}
 % \scshape
  \jgsectionfont
  \selectfont}
  {}
  {0em}
  {}

% Customize the subsections and places worked/studied titles
\titleformat{\subsection}
  {\color{subheadings}
  \raggedright
  \jgsubsectionfont
  \selectfont
  \subsectionspace}
  {}
  {0em}
  {}


%----------------------------------------------------------------------------------------
% CUSTOM COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\jgsectionline}[0]{
  \vspace{-8pt}
  \noindent\makebox[\linewidth]{\rule{.9\paperwidth}{0.05pt}}
  \vspace{-8pt}}


\newcommand{\subsectionspace}{\vspace{5.5pt}}

% Used for describing the subsection either on the same line or underneath
\newcommand{\descript}[1]{ 
  \color{subheadings}
  \raggedright
  \jgwritingfont
  \selectfont{#1}
  \normalfont}


% Used for listing the languages used for each section
\newcommand{\languagesused}[1]{
  \color{subheadings}
  \jglanguagesusedfont
  \selectfont{(#1)}
  \normalfont}


% Left font, left text, right font, right text
\newcommand{\raggedrightandleft}[4]{
    \color{subheadings}
    #1
    \selectfont{#2}
    \normalfont
  \hfill
    \color{subheadings}
    \raggedleft
    #3
    \selectfont{#4\\}
  \raggedright
  \normalfont}


%School, Graduation Date, Degrees, GPA
\newcommand{\schoolsubsection}[4]{
  \raggedrightandleft{\jgsubsectionfont}{#1}{\jgdatesfont}{#2}
  \jgwritingfont
  \selectfont{#3}
  \hfill
  \jgwritingfont
  \selectfont{#4}
  \subsectionspace
  \normalfont}


%Title, Location, Dates, List, Languages Used
\newcommand{\projectsubsection}[5]{
  \raggedrightandleft{\jgsubsectionfont}{#1\languagesused{#4}}{\jgdatesfont}{#3}
  \jgwritingfont
  \selectfont{#5}
  \subsectionspace
  \normalfont}

%Title of organization, Title of position, Location, Dates, List, Languages Used
\newcommand{\experiencesubsection}[6]{
  \subsectionspace
  \raggedrightandleft{\jgsubsectionfont}{#1 | #2 \languagesused{#5}}{\jgdatesfont}{#4}
  \jgwritingfont
  \selectfont{#6}
  \subsectionspace
  \normalfont}

\newcommand{\skillssubsection}[2]{
  \subsectionspace
  \raggedrightandleft{\jgsubsectionfont}{#1}{}
  \normalfont
  \jgwritingfont
  \selectfont{#2}
  \subsectionspace
  \normalfont}



%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------
\usepackage{enumitem}

\newenvironment{tightitemize} % Defines the tightitemize environment which modifies the itemize environment to be more compact
{\vspace{-\topsep}
\setitemize[0]{itemindent=0pt,leftmargin=5pt}
\begin{itemize}
  \color{subheadings}
  \raggedright
  \jglistfont
  \itemsep3pt
  \parskip0pt
  \parsep0pt}
{\end{itemize}\vspace{-\topsep}}
