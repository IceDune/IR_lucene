package com.kaushik.lucene.assignment;

import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.custom.CustomAnalyzer;

public class ShinigamiAnalyzer {
	
	/*
	 * custom filter from
	 * https://www.baeldung.com/lucene-analyzers
	 */
	
	public static Analyzer ShinigamiAnalyzer() {
		Analyzer analyzer = null;
		try {
			analyzer = CustomAnalyzer.builder()
				      .withTokenizer("standard")
				      .addTokenFilter("lowercase")
				      .addTokenFilter("stop")
				      .addTokenFilter("porterstem")
				      .addTokenFilter("capitalization")
				      .build();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return analyzer;
	}
}
