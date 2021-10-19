package com.kaushik.lucene.assignment;

import java.io.IOException;
import java.nio.file.Paths;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.core.SimpleAnalyzer;
import org.apache.lucene.analysis.core.WhitespaceAnalyzer;
import org.apache.lucene.analysis.en.EnglishAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
// import org.apache.lucene.store.RAMDirectory;
 
public class CreateIndex
{
    
    // Directory where the search index will be saved
    private static String INDEX_DIRECTORY = "";

    public void startIndexing(String[] args) throws IOException
    {
    	// create or use index in project folder.
    	// TODO: Check this for Linux!
    	INDEX_DIRECTORY = System.getProperty("user.dir") + "/index";
    	
    	// initialize analyzer based on 
    	Analyzer analyzer = null;
    	analyzer = ArgumentResolver.getAnalyzer(analyzer, args.length > 0 ? 
    			args[0] : "default");
        
        CorpusParser parser = new CorpusParser();
        String content = parser.readCorpus();
        
        // To store an index in memory
        // Directory directory = new RAMDirectory();
        // To store an index on disk
        Directory directory = FSDirectory.open(Paths.get(INDEX_DIRECTORY));
        IndexWriterConfig config = new IndexWriterConfig(analyzer);
        
        // set similarity
        ArgumentResolver.setSimilarity(config, args.length > 1 ? 
        		args[1] : "default");
        
        // Index opening mode
        // IndexWriterConfig.OpenMode.CREATE = create a new index
        // IndexWriterConfig.OpenMode.APPEND = open an existing index
        // IndexWriterConfig.OpenMode.CREATE_OR_APPEND = create an index if it
        // does not exist, otherwise it opens it
        config.setOpenMode(IndexWriterConfig.OpenMode.CREATE);
        
        IndexWriter iwriter = new IndexWriter(directory, config);
        
        parser.createDocuments(iwriter);
        
        // Commit changes and close everything
        iwriter.close();
        directory.close();
    }
    
    
}
