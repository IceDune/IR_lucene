# Information Retrieval Assignment 1

##### Steps to reach the assignment Folder
1. log into the VM with azureuser
2. run `sudo su -`
3. run `cd ..`
4. run `cd opt/`
5. run `cd ir_assignement1/IR_lucene`
6. run `bash run.sh`

The shell file will do a maven clean install, then compile on various combinations
of analyzer and similarity to generate the output file.
Then trec_eval will then run on the output file to give recall and mean scores.