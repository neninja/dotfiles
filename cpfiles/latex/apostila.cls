\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{apostila}[2019/06/04]
\LoadClass{memoir}

\usepackage[utf8]{inputenc} %acentuação
\usepackage[portuguese]{babel} % dicionário, auxilia na quebra de palavras e tradução de comportamentos do latex como data
\usepackage{csquotes} % requisição babel
\usepackage{hyperref} % hyperlinks
\usepackage{graphicx} % inserir imagens
\usepackage{fontawesome} % https://ctan.org/pkg/fontawesome

% link colorido
\newcommand{\link}[2]{\textcolor{violet}{\href{#1}{#2}}}


\AtBeginDocument{
    \maketitle
    \tableofcontents
}

\AtEndDocument{
    % Print referencias
    \nocite{*}
    % estilo da bibliografia
    \bibliographystyle{abbrv}
    % chamando o arquivo refs.bib
    \bibliography{\jobname}
}

