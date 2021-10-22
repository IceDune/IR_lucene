package com.kaushik.lucene.assignment;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.Tokenizer;
import org.apache.lucene.analysis.core.LowerCaseFilter;
import org.apache.lucene.analysis.en.PorterStemFilter;
import org.apache.lucene.analysis.standard.StandardTokenizer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

public class QuerySearcher {

	public static String QUERYFILE_DIRECTORY = System.getProperty("user.dir") 
			+ "/cran/cran.qry";
	public static String INDEX_DIRECTORY = System.getProperty("user.dir") + 
			"/index";
	public static String OUTPUT_DIRECTORY = "output.txt";
	
	public void parseAndSearchQueries(String[] args) throws IOException, ParseException {
		try (InputStream stream = Files.newInputStream(
				Paths.get(QUERYFILE_DIRECTORY))) {

			// index reader, writer and index searcher.
			
			// create reader in the index directory.
			IndexReader reader = DirectoryReader.open(FSDirectory.open(
					Paths.get(INDEX_DIRECTORY)));
			
			// create a writer to the output file.
			PrintWriter writer = new PrintWriter(OUTPUT_DIRECTORY, "UTF-8");
			
			// for searching.
	        IndexSearcher searcher = new IndexSearcher(reader);
            
	        // initialize analyzer based on 
	    	Analyzer analyzer = null;
	    	analyzer = ArgumentResolver.getAnalyzer(analyzer, args.length > 0 ? args[0] : "default");
	    	
	    	// set similarity
	        ArgumentResolver.setSimilarity(searcher, args.length > 1 ? args[1] : "default");
	        
	        // to get buffered content from the query file.
            BufferedReader bufferedReader = new BufferedReader(
            		new InputStreamReader(stream, StandardCharsets.UTF_8));
            
            MultiFieldQueryParser parser = new MultiFieldQueryParser(
            		new String[]{"title", "author", "bibliography", "words"},
            		analyzer);
            
            // Start parsing.
            String currentLine = bufferedReader.readLine();
            String bufferedContent = "";
            Integer id = 1;
            String idString = "";
            String[] stopWords = StopWords.getStopWordsList();
            
            while (currentLine != null) {
            	if (currentLine.startsWith(".I")) {
            		// Store generated Id.
            		idString = id.toString();
            		id++;
            		currentLine = bufferedReader.readLine();
            	}
            	
            	if (currentLine.startsWith(".W")) {
            		currentLine = bufferedReader.readLine();
            		while(currentLine != null && !currentLine.startsWith(".I")) {
            			bufferedContent += currentLine + " ";
            			currentLine = bufferedReader.readLine();
            		}
            	}
            	bufferedContent = bufferedContent.trim();
            	//System.out.println(bufferedContent);
            	
            	// TODO: Text Processing
            	//bufferedContent = stripPunctuation(bufferedContent);	// decreas
            	bufferedContent = removeStopWords(bufferedContent, stopWords);
            	bufferedContent = addBasicTokenization(bufferedContent);
            	
            	//System.out.println(bufferedContent);
            	Query query = parser.parse(QueryParser.escape(bufferedContent));

            	// reset query at the end.
            	bufferedContent = "";
                
            	performSearch(searcher, writer, idString, query);
            	
            }
            System.out.println("Results have been written to the 'output.txt' file.");
            writer.close();
            reader.close();
		}
	}
	
	private String stripPunctuation(String content) {
		content = content.replaceAll("\\p{Punct}", "");
		return content;
	}
	
	private String removeStopWords(String content, String[] stopWords) {
		for (String word : stopWords) {
			content = content.replaceAll(word, " ");
		}
		return content;
	}
	
	private String addBasicTokenization(String content) {
		content = content.replaceAll("-", " ");
		return content;
	}
	
	private void performSearch(IndexSearcher searcher, PrintWriter writer,
			String id, Query query) throws IOException {
		TopDocs results = searcher.search(query, 1400);
        ScoreDoc[] score = results.scoreDocs;

        // To write the results for each hit in the format expected by the trec_eval tool.
        for (int i = 0; i < score.length; i++) {
            Document doc = searcher.doc(score[i].doc);
            writer.println(id + " 0 " + doc.get("id") + " " + i + " " + 
            		score[i].score + " KAUSHIK");
        }
	}
}
