package es.hol.baudo.java;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;

/**
 * 
 *	
 */
public class App 
{
	
    public static void main( String[] args ) throws IOException
    {
    	final String fileName = args[0];
    	
    	File input = new File(fileName);
    	
    	Document doc = Jsoup.parse(input, "UTF-8");    	
    	Element e = doc.body();   
    	e.select("head"); //selezione da sistemare
    	e.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/styles.css\">");
    	
    	System.out.println(doc.outerHtml());
    	    	
    	//Elements newsHeadlines = doc.select("#mp-itn b a");  
    	
    	FileUtils.writeStringToFile(input, doc.outerHtml(), "UTF-8");
    }
}
