./vacuum/vacuum html-report openapi.yaml output0.html -d

# save the time where the run is different in a variable
j=0

i=0
until [ $i -gt 1000 ]
do
    echo i: $i
    i=$((i+1))
    echo "Vacuum run $i "
    ./vacuum/vacuum html-report openapi.yaml output$i.html -d
    DIFF=$(diff output$i.html output0.html)
    if [ "$DIFF" != "" ]
    then
        echo "$i is different from the first run"
        cmp output$i.html output0.html
        # diff output$i.html output0.html > diff$i.txt
        j=$((j+1))
    else
        echo "$i is the same as the first run"
    fi
    # remove the output file
    rm output$i.html

done

echo $j "runs were different as the first run"