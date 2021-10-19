#!/bin/sh

echo "cleaning files and directories, clearing compiled files, and download dependencies"
mvn clean && mvn install

echo "compiling the application"
mvn compile

echo "running application with simple analyzer and classic similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --tfidf"

echo "running trec_eval score for mean average precision and average precision(simple analyzer and classic similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with simple analyzer and LMDirichletSimilarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --lmd"

echo "running trec_eval score for mean average and avg. precision (simple analuzer and LMDirichlet similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt 

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with simple analyzer and bm25 similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --bm25"

echo "running trec_eval score for mean average precision and average precision(simple analyzer and bm25 similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with whitespace analyzer and classic similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --tfidf"

echo "running trec_eval score for mean average precision and average precision(whitespace analyzer and classic similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with whitespace analyzer and LMDirichlet similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --lmd"

echo "running trec_eval score for mean average precision and average precision(whitespace analyzer and lmdirichlet similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with whitespace analyzer and bm25 similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --bm25"

echo "running trec_eval score for mean average precision and average precision(whitespace analyzer and bm25 similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 


echo "running application with standard analyzer and classic similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --tfidf"

echo "running trec_eval score for mean average precision and average precision(standard analyzer and classic similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with standard analyzer and LMDirichlet similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --lmd"

echo "running trec_eval score for mean average precision and average precision(standard analyzer and LMDirichlet similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with standard analyzer and bm25 similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --bm25"

echo "running trec_eval score for mean average precision and average precision(standard analyzer and bm25 similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with English analyzer and classic similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --tfidf"

echo "running trec_eval score for mean average precision and average precision(english analyzer and classic similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with english analyzer and LMDirichlet similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --lmd"

echo "running trec_eval score for mean average precision and average precision(english analyzer and LMDirichlet similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo "running application with english analyzer and bm25 similarity"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --bm25"

echo "running trec_eval score for mean average precision and average precision(english analyzer and bm25 similarity)"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo "running trec_eval recall score"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 
