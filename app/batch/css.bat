FOR %%F IN ("%SITEDIR%\*.html") DO (	
	java -jar C:\Users\baudo_g\git\mathematics\app\java\jsoup\target\java-1-jar-with-dependencies.jar "%%F"
)