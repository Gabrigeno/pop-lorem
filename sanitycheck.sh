#!/bin/bash

#
# just a sanity check
#

testcases=0
broken=0

action="./pop_lorem"
if [ "`$action`" != "Lorem ipsum dolor sit amet," ]
then
    echo BROKEN: $action
    broken=$((broken+1))
else
    echo OK: $action
fi
testcases=$((testcases+1))

action="./pop_lorem -n 2"
if [ "`$action`" != "Lorem ipsum" ]
then
    echo BROKEN: $action
    broken=$((broken+1))
else
    echo OK: $action
fi
testcases=$((testcases+1))

action="./pop_lorem -n 2 --lower"
if [ "`$action`" != "lorem ipsum" ]
then
    echo BROKEN: $action
    broken=$((broken+1))
else
    echo OK: $action
fi
testcases=$((testcases+1))

action="./pop_lorem -n 2 --upper"
if [ "`$action`" != "LOREM IPSUM" ]
then
    echo BROKEN: $action
    broken=$((broken+1))
else
    echo OK: $action
fi
testcases=$((testcases+1))

action="./pop_lorem --cols 0 --words 16"
if [ "`$action`" == *"\n"* ]
then
    echo BROKEN: $action
    broken=$((broken+1))
else
    echo OK: $action
fi
testcases=$((testcases+1))

for random in "" "--randomize" "--cols 20" "--cols 160 --randomize"
do
    for lorem in lorem katy icona rain circus carley kesha lavigne
    do
        for n in 0 1 10 1000
        do
            action="./pop_lorem --$lorem -n $n $random"
            if [ `$action | wc -w` -ne $n ]
            then
                echo BROKEN: $action
                broken=$((broken+1))
            else
                echo OK: $action
            fi
            testcases=$((testcases+1))

            action="./pop_lorem --$lorem -s $n $random"
            if [ `$action | tr "\n" " " | tr ";.\!?" "\n\n\n\n" | wc -l` -ne $n ]
            then
                echo BROKEN: $action
                broken=$((broken+1))
            else
                echo OK: $action
            fi
            testcases=$((testcases+1))

            action="./pop_lorem --$lorem -c $n $random"
            if [ `$action | wc -c` -ne $((n+1)) ]
            then
                echo BROKEN: $action
                broken=$((broken+1))
            else
                echo OK: $action
            fi
            testcases=$((testcases+1))

            # there will be at least one line - 0 makes a blank one
            action="./pop_lorem --$lorem -l $n $random"
            if [ $n -eq 0 ]
            then
                n=1
            fi
            testcases=$((testcases+1))

            if [ `$action | wc -l` -ne $n ]
            then
                echo BROKEN: $action
                broken=$((broken+1))
            else
                echo OK: $action
            fi
            testcases=$((testcases+1))
        done
    done
done

echo $testcases test cases, $broken broken
