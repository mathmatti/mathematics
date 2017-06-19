REM compile from latex to html
@ECHO off 
SETLOCAL enableDelayedExpansion 

SET LATEXDIR=C:\Users\baudo_g\git\mathematics\latex
SET SITEDIR=C:\Users\baudo_g\git\mathematics\latex

REM del %SITEDIR%\*.*

REM cd ..\..\latex
cd %LATEXDIR%
FOR %%G IN ("%LATEXDIR%\*.tex") DO (	
	REM htlatex %%~nxG 	
	pdflatex %%~nxG
)

REM FOR %%G IN ("%LATEXDIR%\*.html") DO (
REM	move %%G %SITEDIR%
REM )

REM FOR %%G IN ("%LATEXDIR%\*.css") DO (
REM	move %%G %SITEDIR%
REM )

del %LATEXDIR%\*.log
REM del %LATEXDIR%\*.dvi
del %LATEXDIR%\*.4tc
del %LATEXDIR%\*.4ct
del %LATEXDIR%\*.aux
del %LATEXDIR%\*.idv
del %LATEXDIR%\*.lg
del %LATEXDIR%\*.tmp
del %LATEXDIR%\*.xref





REM set MYDIR=C:\something
REM for /F %%x in ('dir /B/D %MYDIR%') do (
REM   set FILENAME=%MYDIR%\%%x\log\IL_ERROR.log
REM   echo ===========================  Search in !FILENAME! ===========================
REM   c:\utils\grep motiv !FILENAME!
REM )




REM htlatex %%~nxG 	