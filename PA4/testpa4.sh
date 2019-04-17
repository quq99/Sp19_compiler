make clean
make
echo "===================================="
echo "make complete"
echo "===================================="

echo " "
echo "test start, into ./TestPA3 directory"
echo " "
echo "===================================="
cd TestPA4

echo "into WorkingTest directory"
echo "===================================="
cd WorkingTest
for filename in `ls *.java`
do
	#rm ${filename}".s"
	rm ${filename}".ST.txt"
	rm ${filename}".ast.dot"
	java -jar ../../MJ.jar $filename

done

echo " "
echo "========================================="
echo "diff all the .s file in TestPA4/WorkingTest"
echo "       and in TestPA4/WorkingTest/expectOutput"
echo "========================================="
for filename in `ls expectOutput/`
do
    echo "diff ${filename} with expected file"
	diff expectOutput/${filename} ./${filename}
    echo "if no other information, ${filename} OK"
done

#echo " "
#echo "========================================="
#echo "testing error cases in TestPA3/ErrorTest"
#echo "========================================="
#cd ../ErrorTest
#for filename in `ls *.java`
#do
#    echo "++++++++++++++++++++"
#    echo "test file ${filename}"
#    java -jar ../../MJ.jar ${filename}
#done
