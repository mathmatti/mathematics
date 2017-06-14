LATEXDIR=/home/giuseppe/git/mathematics/latex
SITEDIR=/home/giuseppe/git/mathematics/site

for f in $SITEDIR/*.html
do
	java -jar /home/giuseppe/git/mathematics/app/java/jsoup/target/java-1-jar-with-dependencies.jar "$f" 
done