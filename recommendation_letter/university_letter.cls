% Customized letter class:  university_letter.cls
% changes the letter class by adding letterhead
% option either "sign" (default) or "nosign"; the sign feature includes your signature
% which must be in a file signature.jpg

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{university_letter}

\RequirePackage{ifthen}

\newboolean{@sign}

% Defaults:  signed 
\setboolean{@sign}{true}

\DeclareOption{sign}{
	\setboolean{@sign}{true}}
\DeclareOption{nosign}{
	\setboolean{@sign}{false}}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}

\ProcessOptions
\LoadClass{letter}


\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{url}

\setlength{\topmargin}{-1.5cm}

\newsavebox{\tsheader}
\newsavebox{\universitylogo}

\sbox{\universitylogo}{\parbox{\textwidth}{
%here I put code to replicate my department's letterhead
}
			
\sbox{\tsheader}{\parbox[b]{\textwidth}{\usebox{\universitylogo}\raisebox{0cm}}}


\renewcommand{\ps@firstpage}{%
	\setlength{\headheight}{0cm}\setlength{\headsep}{3.5cm}%
	\renewcommand{\@oddhead}{\usebox{\tsheader}}
		\renewcommand{\@oddfoot}{}%
		\renewcommand{\@evenhead}{}\renewcommand{\@evenfoot}{}%
		}

\providecommand{\@evenhead}{} \providecommand{\@oddhead}{}
\providecommand{\@evenfoot}{} \providecommand{\@oddfoot}{}

\pagestyle{headings}


\renewcommand{\closing}[1]{
	\hspace*{4cm}
	\parbox{\textwidth}{
	\ifthenelse{\equal{#1}{}}{}{#1\\}
	\ifthenelse{\boolean{@sign}}{\includegraphics[width=5cm]{signature.jpg}\\}{\bigskip \bigskip \bigskip \bigskip \bigskip \ifthenelse{\equal{#1}{}}{}{{ }\\}}	
	\raggedright \fromsig}}

\signature{
	%<my name and rank>
	\\\url{
	%<my email address>
	}}
	