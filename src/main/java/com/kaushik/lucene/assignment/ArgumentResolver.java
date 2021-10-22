package com.kaushik.lucene.assignment;

import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.core.SimpleAnalyzer;
import org.apache.lucene.analysis.core.WhitespaceAnalyzer;
import org.apache.lucene.analysis.en.EnglishAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.similarities.BM25Similarity;
import org.apache.lucene.search.similarities.ClassicSimilarity;
import org.apache.lucene.search.similarities.LMDirichletSimilarity;

public class ArgumentResolver {

	public static Analyzer getAnalyzer(Analyzer analyzer, String analyzerType) {
		if (analyzerType.equals("-sa")) {	// simple analyzer.
    		analyzer = new SimpleAnalyzer();
    	}
    	else if (analyzerType.equals("-wsa")) {	// Whitespace Analyzer.
    		analyzer = new WhitespaceAnalyzer();
    	}
    	else if (analyzerType.equals("-sta")) {	// Standard analyzer.
    		analyzer = new StandardAnalyzer();
    	}
    	else if (analyzerType.equals("-ea")) {	// English Analyzer
    		analyzer = new EnglishAnalyzer();
    	}
    	else if (analyzerType.equals("-shina")) {
			analyzer = new ShinigamiAnalyzer().ShinigamiAnalyzer();
    	}
    	else {	// default analyzer.
    		analyzer = new ShinigamiAnalyzer().ShinigamiAnalyzer();//new EnglishAnalyzer();
    	}
    	
		
		return analyzer;
	}
	
	public static void setSimilarity(IndexWriterConfig config, String similarity) {
		if (similarity.equals("--tfidf")) {
			config.setSimilarity(new ClassicSimilarity());
		}
		else if (similarity.equals("--lmd")) {
			config.setSimilarity(new LMDirichletSimilarity());
		}
		else if (similarity.equals("--bm25")){
			config.setSimilarity(new BM25Similarity());
		}
		else {
			config.setSimilarity(new BM25Similarity());
		}
	}
	
	public static void setSimilarity(IndexSearcher searcher, String similarity) {
		if (similarity.equals("--tfidf")) {
			searcher.setSimilarity(new ClassicSimilarity());
		}
		else if (similarity.equals("--lmd")) {
			searcher.setSimilarity(new LMDirichletSimilarity());
		}
		else if (similarity.equals("--bm25")){
			searcher.setSimilarity(new BM25Similarity());
		}
		else {
			searcher.setSimilarity(new BM25Similarity());
		}
	}
}
