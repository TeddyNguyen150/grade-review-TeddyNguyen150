CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


if [ -f "student-submission/ListExamples.java" ]; then
    echo "File found"
else
    echo "There is no such file"
    exit 1;
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area

cd grading-area
javac -cp $CPATH *.java

if [ $? -ne 0 ]; then
    echo "Compilation error"
    exit 1
fi

java -cp ".:lib/junit-4.13.2.jar:lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > output.txt

cat output.txt

#tail -2 output.txt | grep "Tests run:"

echo "Program completed successfully"


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
