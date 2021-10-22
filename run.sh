#!/bin/sh

CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo -e "${CYAN}Cleaning files and directories, clearing compiled files, and download dependencies ${NC} \n"
mvn clean && mvn install

echo -e "${CYAN}Compiling the application ${NC} \n"
mvn compile

echo -e "${CYAN} Running application with simple analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --tfidf"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(simple analyzer and classic similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with simple analyzer and LMDirichletSimilarity  ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --lmd"

echo -e "${CYAN} Running trec_eval score for mean average and avg. precision (simple analyzer and LMDirichlet similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with simple analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --bm25"

echo -e "${CYAN} running trec_eval score for mean average precision and average precision(simple analyzer and bm25 similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with whitespace analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --tfidf"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(whitespace analyzer and classic similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with whitespace analyzer and LMDirichlet similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --lmd"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(whitespace analyzer and lmdirichlet similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with whitespace analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --bm25"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(whitespace analyzer and bm25 similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with standard analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --tfidf"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(standard analyzer and classic similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with standard analyzer and LMDirichlet similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --lmd"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(standard analyzer and LMDirichlet similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with standard analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --bm25"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(standard analyzer and bm25 similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with English analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --tfidf"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(english analyzer and classic similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with english analyzer and LMDirichlet similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --lmd"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(english analyzer and LMDirichlet similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with english analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --bm25"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(english analyzer and bm25 similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${GREEN} CUSTOM ANALYZER ${NC} \n"

echo -e "${CYAN} Running application with Custom analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-shina --bm25"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(Custom analyzer and bm25 similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with custom analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-shina --tfidf"

echo -e "${CYAN} Running trec_eval score for mean average precision and average precision(custom analyzer and classic similarity) ${NC} \n"
trec_eval -m map -m gm_map cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} running trec_eval recall score ${NC} \n"
trec_eval -m recall cran/QRelsCorrectedforTRECeval output.txt 
