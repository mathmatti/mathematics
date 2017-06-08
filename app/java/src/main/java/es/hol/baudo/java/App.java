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
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws IOException
    {
    	//String folder = args[0];
    	//System.out.println("Folder: " + folder);
    	
    	File input = new File("C:/Users/baudo_g/git/mathematics/latex/latex.html");
    	
    	Document doc = Jsoup.parse(input, "UTF-8");    	
    	Element e = doc.body();     			
    	e.append("<p1>test</p1>");
    	
    	System.out.println(doc.outerHtml());
    	    	
    	//Elements newsHeadlines = doc.select("#mp-itn b a");  
    	
    	FileUtils.writeStringToFile(input, doc.outerHtml(), "UTF-8");
    }
}
