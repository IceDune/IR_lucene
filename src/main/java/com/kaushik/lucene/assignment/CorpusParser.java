package com.kaushik.lucene.assignment;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;

public class CorpusParser {

	private static String CORPUS_DIRECTORY = System.getProperty("user.dir") 
			+ "/cran/cran.all.1400";
	
	private String corpusContent;
	
	public void setCorpusContent(String corpus)
	{
		corpusContent = corpus;
	}
	
	public String getCorpusContent()
	{
		return corpusContent;
	}
	
	public String readCorpus() {
		try
	    {
			String fileContent = new String(Files.readAllBytes
					(Paths.get(CORPUS_DIRECTORY)));
			setCorpusContent(fileContent);
	    } 
	    catch (IOException e) 
	    {
	        e.printStackTrace();
	    }
		
		return corpusContent;
	}
	
	public void createDocuments(IndexWriter writer) throws IOException {
		try (InputStream stream = Files.newInputStream(
				Paths.get(CORPUS_DIRECTORY))) {

            BufferedReader bufferedReader = new BufferedReader(
            		new InputStreamReader(stream, StandardCharsets.UTF_8));
            
            // Start Indexing.
            String currentLine = bufferedReader.readLine();
            String completeContentUnderField = "";

            while(currentLine != null){
                Document doc = new Document();
                
                // ID
                currentLine = parseId(bufferedReader, currentLine, doc);
                
                // Title
                if (currentLine.startsWith(".T")){
                    currentLine = bufferedReader.readLine();
                    while(!currentLine.startsWith(".A")){
                    	completeContentUnderField += currentLine + " ";
                        currentLine = bufferedReader.readLine();
                    }
                    doc.add(new TextField("title", completeContentUnderField, Field.Store.YES));
                    completeContentUnderField = "";
                }
                
                // Author
                if (currentLine.startsWith(".A")){
                    currentLine = bufferedReader.readLine();
                    while(!currentLine.startsWith(".B")){
                    	completeContentUnderField += currentLine + " ";
                        currentLine = bufferedReader.readLine();
                    }
                    doc.add(new TextField("author", completeContentUnderField, Field.Store.YES));
                    completeContentUnderField = "";
                }
                
                // Bibliography
                if (currentLine.startsWith(".B")){
                    currentLine = bufferedReader.readLine();
                    while(!currentLine.startsWith(".W")){
                    	completeContentUnderField += currentLine + " ";
                        currentLine = bufferedReader.readLine();
                    }

                    doc.add(new StringField("bibliography", completeContentUnderField,
                    		Field.Store.YES));
                    completeContentUnderField = "";
                }
                
                // Content
                if (currentLine.startsWith(".W")){
                    currentLine = bufferedReader.readLine();
                    while(currentLine != null && !currentLine.startsWith(".I")){
                    	completeContentUnderField += currentLine + " ";
                        currentLine = bufferedReader.readLine();
                    }
                    //Not storing the words in an attempt to save storage space.
                    doc.add(new TextField("content", completeContentUnderField, Field.Store.NO));
                    completeContentUnderField = "";
                }
                
                writer.addDocument(doc);
            }
        }
    }

	private String parseId(BufferedReader bufferedReader, String currentLine, Document doc) throws IOException {
		if(currentLine.startsWith(".I")){
		    
		    doc.add(new StringField("id", currentLine.substring(3),
		    		Field.Store.YES));
		    currentLine = bufferedReader.readLine();
		}
		return currentLine;
	}
}
