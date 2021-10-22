#!/bin/sh
#!trec_eval commands and info from
#!http://faculty.washington.edu/levow/courses/ling573_SPR2011/hw/trec_eval_desc.htm

CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo -e "${CYAN}Cleaning files and directories, clearing compiled files, and download dependencies ${NC} \n"
mvn clean && mvn install

echo -e "${CYAN}Compiling the application ${NC} \n"
mvn compile

echo -e "${CYAN} Running application with simple analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --tfidf"

echo -e "${CYAN} Running trec_eval scores (simple analyzer and classic similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with simple analyzer and LMDirichletSimilarity  ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --lmd"

echo -e "${CYAN} Running trec_eval scores (simple analyzer and LMDirichlet similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt 

echo -e "${CYAN} Running application with simple analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sa --bm25"

echo -e "${CYAN} running trec_eval scores (simple analyzer and bm25 similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with whitespace analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --tfidf"

echo -e "${CYAN} Running trec_eval scores (whitespace analyzer and classic similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with whitespace analyzer and LMDirichlet similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --lmd"

echo -e "${CYAN} Running trec_eval scores (whitespace analyzer and lmdirichlet similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with whitespace analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-wsa --bm25"

echo -e "${CYAN} Running trec_eval scores (whitespace analyzer and bm25 similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with standard analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --tfidf"

echo -e "${CYAN} Running trec_eval scores (standard analyzer and classic similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with standard analyzer and LMDirichlet similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --lmd"

echo -e "${CYAN} Running trec_eval scores (standard analyzer and LMDirichlet similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with standard analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-sta --bm25"

echo -e "${CYAN} Running trec_eval scores (standard analyzer and bm25 similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with English analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --tfidf"

echo -e "${CYAN} Running trec_eval scores (english analyzer and classic similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with english analyzer and LMDirichlet similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --lmd"

echo -e "${CYAN} Running trec_eval scores (english analyzer and LMDirichlet similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with english analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-ea --bm25"

echo -e "${CYAN} Running trec_eval scores (english analyzer and bm25 similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${GREEN} CUSTOM ANALYZER ${NC} \n"

echo -e "${CYAN} Running application with Custom analyzer and bm25 similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-shina --bm25"

echo -e "${CYAN} Running trec_eval scores (Custom analyzer and bm25 similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt

echo -e "${CYAN} Running application with custom analyzer and classic similarity ${NC} \n"
mvn exec:java -Dexec.mainClass=com.kaushik.lucene.assignment.Application -Dexec.args="-shina --tfidf"

echo -e "${CYAN} Running trec_eval scores (custom analyzer and classic similarity) ${NC} \n"
trec_eval cran/QRelsCorrectedforTRECeval output.txt