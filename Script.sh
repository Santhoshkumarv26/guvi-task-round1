echo "Creating 10 Files in Directory named as Task-Directory"

for((i=1;i<=10;i++))
do 
	echo "Welcome">task-directory/demo$i.txt
	echo "Created a file demo$i.txt"
done
echo "Enter the value for Variable1"
read Variable1
echo "Enter the value for Variable2"
read Variable2

echo "Cloning Git repository"
echo "Enter Git Repository URl to start clone"
read GitUrl
git clone $GitUrl
echo " Remote Repository has been clonned to local"
echo "Comparing both variables"

if [ "$Variable1" == "$Variable2" ]
then
    echo "Both Varibale values are equal, So starting the tar process"
    tar -czf SampleCode.tar.gz task-directory/
    mv SampleCode.tar.gz guvi-task-round1/
    echo "Files are tarred successfully and pushing into master branch now"
    cd guvi-task-round1
    git add SampleCode.tar.gz
    git status
    echo "Enter the commit message"
    read commitvalue
    git commit -m "$commitvalue"
    git push origin master
    echo "File SamepleCode.tar.gz is pushed successfully into the master branch with commit message: $commitvalue"
else
    echo "Both variable values are diffrent, so pushing all files directly into the develop branch"
    cp -r task-directory/ guvi-task-round1/
    cd guvi-task-round1
    git checkout develop
    cd task-directory/
    git add .
    git status
    echo "Enter the commit message"
    read commitvalue
    git commit -m "$commitvalue"
    git push origin develop
    echo "All files are pushed successfully into the develop branch with commit message: $commitvalue"
fi
