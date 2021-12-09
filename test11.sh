#!/bin/bash
> firstReport.txt
> firstMem.txt
> firstSwap.txt

while true
do
checking=$(top -b -n 1 | grep "mem.bash")
status=$(echo $checking | awk '{if ($8 == "R") print $0}')

if [[ -n "$checking" && -n "$status" ]]
then
curDate=$(date +'%X')
echo "Date: $curDate" >> firtReport.txt
echo "Info about memory:" >> firstReort.txt
data=$(top -b -n 1 | head -n 5 | tail -n 2)
echo $data >> firstReport.txt
echo "$data" | head -n 1 | awk '{print $6}' >> firstMem.txt
echo "$data" | tail -n 1 | awk '{print $5}' >> firstSwap.txt
echo "Ingo about process mem.bash" >> firstReport.txt
echo "$checking" >> firstReport.txt
echo "Leader process" >> firstReport.txt
top -b -n 1 | head -n 12 | tail -n 5 >> firstReport.txt
echo -e "\n" >> firstReport.txt
else
exit
fi
sleep 1
done

