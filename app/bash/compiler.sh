#!/bin/sh
#for f in ../.. ; do
	#echo "$f"
#	if [[ -d $f ]]; then 
#		echo 'ok'
#	else
#		#htlatex ../../"$f"
#		echo 'no'		
#	fi
#done


#REM compile from latex to html
#@ECHO off 
#SETLOCAL enableDelayedExpansion 

LATEXDIR=/home/giuseppe/git/mathematics/latex
SITEDIR=/home/giuseppe/git/mathematics/site

#del $SITEDIR/*.*

cd $LATEXDIR
for f in $LATEXDIR/*.tex 
do 	
	htlatex $f
	pdflatex $f
done

# also use mv
cp $LATEXDIR/*.html $SITEDIR/
cp $LATEXDIR/*.css $SITEDIR/
cp $LATEXDIR/*.pdf $SITEDIR/

for f in $LATEXDIR/*.html
do
	java -jar $f "$f"
done
#rm $LATEXDIR\*.log
#rm $LATEXDIR\*.dvi
#rm $LATEXDIR\*.4tc
#rm $LATEXDIR\*.4ct
#rm $LATEXDIR\*.aux
#rm $LATEXDIR\*.idv
#rm $LATEXDIR\*.lg
#rm $LATEXDIR\*.tmp
#rm $LATEXDIR\*.xref





#REM set MYDIR=C:\something
#REM for /F %%x in ('dir /B/D %MYDIR%') do (
#REM   set FILENAME=%MYDIR%\%%x\log\IL_ERROR.log
#REM   echo ===========================  Search in !FILENAME! ===========================
#REM   c:\utils\grep motiv !FILENAME!
#REM )




#REM htlatex %%~nxG 	