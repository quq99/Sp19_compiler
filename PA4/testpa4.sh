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
rm expectOutput/*.txt
for filename in `ls expectOutput/`
do
    echo "diff ${filename} with expected file"
	diff expectOutput/${filename} ./${filename}
    echo "if no other information, ${filename} OK"
done

echo " "
echo "========================================="
echo "testing MJSIM.jar output"
echo "========================================="
suffix=".java"
for filename in `ls *.java`
do
    echo "++++++++++++++++++++"
    echo "test file ${filename}"
    javac ${filename}
    file=${filename%$suffix}
    java ${file} >& expectOutput/${file}.referout.txt

    java -jar ../../MJSIM.jar -b -f ${filename}.s >& ./${file}.out.txt

    echo "diff ${filename} with expected file"
	diff expectOutput/${file}.referout.txt ./${file}.out.txt
    echo "if no other information, ${filename} OK"
#    java -jar ../../MJ.jar ${filename}
done
