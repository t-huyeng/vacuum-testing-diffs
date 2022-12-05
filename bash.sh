# run vacuum three times
vacuum html-report openapi.yml output1.html -d
vacuum html-report openapi.yml output2.html -d
vacuum html-report openapi.yml output3.html -d

# run the diff command
diff --color output1.html output2.html > diff1.txt
diff --color output1.html output3.html > diff2.txt
diff --color output2.html output3.html > diff3.txt
