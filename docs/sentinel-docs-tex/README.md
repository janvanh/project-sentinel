# Project Sentinel — LaTeX Document Template

One shared template used by both the **Project Bible** and the
**Technical Specification** (and any future Sentinel document).

## 1. Setup (Debian / Texmaker)

You already have `xelatex` via Texmaker's TeX Live install. This template
needs one extra thing — the Noto font family (modern, free, and covers
almost every glyph you'll ever need):

```bash
sudo apt install fonts-noto-core
```

That's it. If you skip this, the template still compiles — it silently
falls back to Latin Modern — but it will look noticeably plainer, and
you may see "font shape not available" warnings in the log. Those
warnings are harmless but are your signal that Noto isn't installed.

To compile a document, open its `main.tex` in Texmaker and set the
compiler to **XeLaTeX** (Options → Configure Texmaker → Quick Build, or
just run `xelatex main.tex` twice from a terminal in that folder — the
second pass is needed to get the Table of Contents and page numbers
correct):

```bash
cd bible && xelatex main.tex && xelatex main.tex
cd spec  && xelatex main.tex && xelatex main.tex
```

## 2. Folder structure

```
sentinel-docs/
├── sentinel-style.sty     ← the actual template. You shouldn't need to
│                             touch this unless you want to change the
│                             visual design itself (colors, fonts, layout).
├── project-config.tex     ← PROJECT-WIDE variables (name, tagline, default author)
├── chapter-template.tex   ← copy this when starting a new chapter
│
├── bible/
│   ├── main.tex           ← assembles the Bible; lists \include'd chapters
│   ├── doc-config.tex     ← THIS document's title/version/status/author
│   └── chapters/
│       ├── 01-overview.tex
│       ├── 02-core-philosophy.tex
│       └── 03-privacy-principles.tex
│
└── spec/
    ├── main.tex           ← assembles the Spec; lists \include'd chapters
    ├── doc-config.tex     ← THIS document's title/version/status/author
    └── chapters/
        ├── 01-architecture.tex
        └── 02-vault-and-crypto.tex
```

Only `bible/` and `spec/` chapters currently cover the first few
sections of each source document — the rest are left for you to add,
exactly the way you like to work (one phase/section at a time).

## 3. Adding a new chapter

1. Copy `chapter-template.tex` into `bible/chapters/` or `spec/chapters/`,
   rename it (keep the `NN-name.tex` numbering so files sort in reading
   order in your file browser).
2. Write the chapter — it's just `\chapter{...}`, `\section{...}`, plain
   text, tables, lists, etc. End the file with `\sentinelchapterend`.
3. Add one line to that document's `main.tex`:
   ```latex
   \include{chapters/04-my-new-chapter}
   ```
4. Recompile (twice).

Chapters must use `\include`, not `\input` — that's what makes each
chapter its own self-contained file and gives you the automatic
page-break-before-chapter behavior.

## 4. Adjusting things yourself

**Project-wide values** (used on both documents) — edit `project-config.tex`:
```latex
\SetProjectName{Project Sentinel}
\SetProjectTagline{Privacy Automation Platform}
\SetDocAuthor{Jan van Hout}
```

**Per-document values** — edit that document's own `doc-config.tex`:
```latex
\SetDocTitle{Technical Specification}
\SetDocSubtitle{System Architecture, Data Model, and Implementation Plan}
\SetDocVersion{0.2}
\SetDocStatus{Concept Specification}
\SetDocDate{\today}          % or hardcode a date string
% \SetDocAuthor{...}          % uncomment to override the project default just for this doc
```

**Colors** — top of `sentinel-style.sty`, section 2:
```latex
\definecolor{sentinelNavy}{HTML}{1B2A4A}
\definecolor{sentinelBronze}{HTML}{B08D57}
\definecolor{sentinelSlate}{HTML}{5B6470}
```
Change the hex codes and every heading, rule, header/footer, and link
in both documents updates at once.

**Fonts** — section 3 of `sentinel-style.sty`. Swap `Noto Serif` /
`Noto Sans` for any font installed on your system (check with `fc-list`).

**Header/footer content** — section 8 of `sentinel-style.sty`, inside
`\fancypagestyle{sentinel}{...}`. Each of `\fancyhead[L]`, `[R]`,
`\fancyfoot[L]`, `[C]`, `[R]` is one slot; edit the text/commands inside.

**Note box style** — section 10, the `sentinelnote` environment. Used
in chapters like:
```latex
\begin{sentinelnote}[Design Principle]
Automation assists the user — it never replaces the user's decisions.
\end{sentinelnote}
```

## 5. Why XeLaTeX, not pdfLaTeX

The template uses `fontspec` to load Noto directly as a system font
(rather than a TeX-packaged font), which requires XeLaTeX or LuaLaTeX.
Don't compile with plain `pdflatex` — it will fail immediately with a
clear error telling you to switch engines.

## 6. Notes on the design

The visual language deliberately keeps the page quiet: a single bronze
rule under each heading, a small lock-like mark on the title page, thin
hairline dividers, and a minimal chapter-end ornament — nothing that
competes with the text for attention. Navy carries authority/trust,
bronze marks the project's own "seal," slate stays out of the way in
the header/footer chrome.
