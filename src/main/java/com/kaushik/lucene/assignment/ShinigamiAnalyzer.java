package com.kaushik.lucene.assignment;

import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.core.LowerCaseFilterFactory;
import org.apache.lucene.analysis.custom.CustomAnalyzer;
import org.apache.lucene.analysis.en.PorterStemFilterFactory;
import org.apache.lucene.analysis.miscellaneous.TrimFilterFactory;
import org.apache.lucene.analysis.ngram.NGramFilterFactory;

public class ShinigamiAnalyzer {
	
	/*
	 * custom filter referred from
	 * https://lucene.apache.org/core/7_3_0/analyzers-common/org/apache/lucene/analysis/util/TokenFilterFactory.html
	 * https://www.baeldung.com/lucene-analyzers
	 * https://solr.apache.org/guide/6_6/tokenizers.html
	 */
	
	public static Analyzer ShinigamiAnalyzer() {
		Analyzer analyzer = null;
		try {
			analyzer = CustomAnalyzer.builder()
				      .withTokenizer("standard")
				      //.addTokenFilter(EnglishMinimalStemFilterFactory.class)
				      .addTokenFilter(PorterStemFilterFactory.class)
				      .addTokenFilter(LowerCaseFilterFactory.class)
				      .addTokenFilter(NGramFilterFactory.class, "minGramSize","5", "maxGramSize", "6")
				      .addTokenFilter(TrimFilterFactory.class)
				      .build();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return analyzer;
	}
}
