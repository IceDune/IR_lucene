package com.kaushik.lucene.assignment;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;

public class CorpusParser {

	private static String CORPUS_DIRECTORY = System.getProperty("user.dir") 
			+ "\\cran\\cran.all.1400";
	
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
            String fullText = "";

            while(currentLine != null){
                Document doc = new Document();
                
                // ID
                if(currentLine.startsWith(".I")){
                    
                    doc.add(new StringField("id", currentLine.substring(3),
                    		Field.Store.YES));
                    currentLine = bufferedReader.readLine();
                }
                
                // Title
                if (currentLine.startsWith(".T")){
                    currentLine = bufferedReader.readLine();
                    while(!currentLine.startsWith(".A")){
                        fullText += currentLine + " ";
                        currentLine = bufferedReader.readLine();
                    }
                    doc.add(new TextField("title", fullText, Field.Store.YES));
                    fullText = "";
                }
                
                // Author
                if (currentLine.startsWith(".A")){
                    currentLine = bufferedReader.readLine();
                    while(!currentLine.startsWith(".B")){
                        fullText += currentLine + " ";
                        currentLine = bufferedReader.readLine();
                    }
                    doc.add(new TextField("author", fullText, Field.Store.YES));
                    fullText = "";
                }
                
                // Bibliography
                if (currentLine.startsWith(".B")){
                    currentLine = bufferedReader.readLine();
                    while(!currentLine.startsWith(".W")){
                        fullText += currentLine + " ";
                        currentLine = bufferedReader.readLine();
                    }

                    doc.add(new StringField("bibliography", fullText,
                    		Field.Store.YES));
                    fullText = "";
                }
                
                // Content
                if (currentLine.startsWith(".W")){
                    currentLine = bufferedReader.readLine();
                    while(currentLine != null && !currentLine.startsWith(".I")){
                        fullText += currentLine + " ";
                        currentLine = bufferedReader.readLine();
                    }
                    //Not storing the words in an attempt to save storage space.
                    doc.add(new TextField("words", fullText, Field.Store.NO));
                    fullText = "";
                }
                
                writer.addDocument(doc);
            }
        }
    }
}