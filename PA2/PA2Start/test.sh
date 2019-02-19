cd ../PA2Examples
rm -rf Myoutput/
rm -rf Referenceoutput/
mkdir Myoutput
mkdir Referenceoutput
for filename in `ls *.java`
do
	java -jar ../PA2Start/MJ.jar $filename
	mv ${filename}".ast.dot" Myoutput/${filename}".ast.dot"

	java -jar ../PA2Start/MJRefer.jar $filename
	mv ${filename}".ast.dot" Referenceoutput/${filename}".ast.dot"

	rm ${filename}".s"
	rm ${filename}".ST.dot"

done

for filename in `ls Myoutput/`
do
    echo "diff ${filename}"
	diff Myoutput/${filename} Referenceoutput/${filename}
done
