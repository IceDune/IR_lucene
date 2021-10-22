# Information Retrieval Assignment 1

##### Steps to reach the assignment Folder
____
1. log into the VM with azureuser
2. run the following commands in order.

	sudo su -\
	cd ..\
	cd opt/\
	cd ir_assignement1/IR_lucene\
	bash run.sh

>The shell file will do a maven clean install, then compile on various combinations
>of analyzer and similarity to generate the output file.
>Then trec_eval will then run on the output file to give different scores.
____
>After generating the output.txt file, we use the following command to run 
>trec_eval.

	trec_eval cran/QRelsCorrectedforTRECeval output.txt