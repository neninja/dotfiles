\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slides}[2019/05/08 My custom CV class]
\LoadClass[17pt]{beamer}

\usepackage[utf8]{inputenc} %acentuação
\usepackage[portuguese]{babel} % dicionário, auxilia na quebra de palavras e tradução de comportamentos do latex como data
\usepackage{csquotes} % requisição babel
\usepackage{hyperref} % hyperlinks
\usepackage{graphicx} % inserir imagens
\usepackage[backend=biber]{biblatex} % bibliografia
\usepackage{fontawesome} % https://ctan.org/pkg/fontawesome
\usepackage{filecontents} % inserir em outros arquivos

% link colorido
\newcommand{\link}[2]{\textcolor{violet}{\href{#1}{#2}}}

% remove navigation symbols
\setbeamertemplate{navigation symbols}{}

% Insere na footline o numero da pagina
\setbeamertemplate{footline}{
    \hfill\hyperlink{indice}{\insertframenumber/\inserttotalframenumber}
}

% Substitui icones por numeros nas referencas
\setbeamertemplate{bibliography item}{\insertbiblabel}

% Configuração de \maketitle
\defbeamertemplate*{title page}{customized}[1][]
{
    \usebeamerfont{title}\inserttitle\par
    \usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par
    \bigskip
    \usebeamerfont{author}\insertauthor\par
    \usebeamerfont{institute}\insertinstitute\par
    \usebeamerfont{date}Criada em \insertdate\par
    %\usebeamerfont{date}Atualizada em \today\par
    %\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic
    \bigskip
    \small
    \link{http://www.github.com/nenitf}{\faGithub}\ 
    \link{http://www.gitlab.com/nenitf}{\faGitlab}\
    \link{http://www.slideshare.net/nenitf}{\faSlideshare}\
    \link{http://www.linkedin.com/in/nenitf}{\faLinkedin}\ ://nenitf
    \hfill 
    \link{http://neni.dev}{http://neni.dev}
}

\AtBeginDocument{
    {
        % Apaga head e foot line
        \setbeamertemplate{headline}{}
        \setbeamertemplate{footline}{}

        % Primeiro slide
        \frame{
            \maketitle
        }

        \frame[allowframebreaks]{
            {Overview}\label{indice}
            % Para definir limite de seções:
            % \tableofcontents[sections={1-5}]
            % \framebreak
            % \tableofcontents[sections={6-10}]
            \tableofcontents[sections={*}]
        }
    }
}
\AtBeginSection[]{
    \frame{
        {\hfill\faMapO}
        \tableofcontents[
        sectionstyle=show/hide,
        subsectionstyle=shaded/shaded/hide
        ]
    }
}
\AtBeginSubsection[]{
    \frame{
        {\hfill\faMapMarker}
        \tableofcontents[
        sectionstyle=shaded/hide,
        subsectionstyle=show/shaded/hide
        ]
    }

}
\AtEndDocument{
    {
        % Apaga head e foot line
        \setbeamertemplate{headline}{}
        \setbeamertemplate{footline}{}

        \frame{
            {That's all}
            Muito Obrigado!
        }

        % Print referencias
        \frame[t]{
            \nocite{*}
            \printbibliography
        }
    }
}

% Dicas de biblatex:
%\begin{filecontents}{ref.bib}
%   @article{atalhonome,
%       author		= {Felipe Silva},
%       title		= {Titulo do Artigo},
%       date		= {1996},
%   }
% página 8 da documentação biblatex
% article: author, title, journaltitle, year/date
% online: author/editor, title, year/date, url
% misc: author/editor, title, year/date
% iguais ao misc: image, music, movie, video, software
%\end{filecontents}
%\frame{
%    {Titulo Slide}
%    \begin{itemize}
%        \item deve ser feito \cite[aa]{90} %nome e página opcional
%    \end{itemize}
%}
