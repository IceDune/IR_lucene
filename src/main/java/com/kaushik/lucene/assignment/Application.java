package com.kaushik.lucene.assignment;

import java.io.IOException;

import org.apache.lucene.queryparser.classic.ParseException;

public class Application {

	public static void main(String[] args)
	{
		CreateIndex indexCreator = new CreateIndex();
		try {
			indexCreator.startIndexing(args);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		QuerySearcher searcher = new QuerySearcher();
		try {
			searcher.parseAndSearchQueries(args);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
