# pdflatex ywlaw.tex
# bibtex ywlaw1
# bibtex ywlaw2
# bibtex ywlaw3
# bibtex ywlaw4
# bibtex ywlaw5
# bibtex ywlaw6
# pdflatex ywlaw.tex
# pdflatex ywlaw.tex

$ErrorActionPreference = 'Stop'

function Run($cmd, $arg) {
    & $cmd $arg
    if ($LASTEXITCODE -ne 0) { throw "$cmd $arg failed (exit code $LASTEXITCODE)" }
}

Run xelatex ywlaw.tex

Get-ChildItem ywlaw[0-9]*.aux | ForEach-Object { Run bibtex $_.BaseName }

Run xelatex ywlaw.tex
Run xelatex ywlaw.tex