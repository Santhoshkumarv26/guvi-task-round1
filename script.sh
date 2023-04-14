echo "Creating 10 files and 10 directories.."
for((i=1;i<=10;i++))
do 
	touch test$i.txt
	echo " A file named test$i.txt has been created"
	mkdir demofolder$i
	echo "A folder named demofolder$i has been created"

done
echo "Listing the created files and dir"
ls -ll | grep -v script
echo "--------------------------------------------------------"
echo "Creating new user"
sudo useradd guviuser
id guviuser
echo "An user named guviuser has been created"
sudo useradd zenuser
id zenuser
echo "An user named zenuser has been created"
echo "--------------------------------------------------------"
echo "Changing the first 5 files and dir permissions & ownership"

echo "Listing first 5 files and dir before executing the script"

ls *.txt -ll | head -n 5
ls -d */ -ll| head -n 5
echo "--------------------------------------------------------"
sudo chown guviuser $(ls *.txt |head -n 5)
sudo chmod 777 $(ls *.txt |head -n 5)

sudo chown guviuser $(ls -d */|head -n 5)
sudo chmod 777 $(ls -d */| head -n 5)
echo "--------------------------------------------------------"
echo "Listing first 5 files and dir after executing the script"

ls *.txt -ll | head -n 5

ls -d */ -ll | head -n 5
echo "--------------------------------------------------------"
echo "Changing the last 5 files and dir permissions & ownership"

echo "Listing last 5 files and dir before executing the script"

ls *.txt -ll | tail -n 5
ls -d */ -ll| tail -n 5
echo "--------------------------------------------------------"
sudo chown guviuser $(ls *.txt |tail -n 5)
sudo chmod 400 $(ls *.txt |tail -n 5)

sudo chown guviuser $(ls -d */|tail -n 5)
sudo chmod 400 $(ls -d */| tail -n 5)
echo "--------------------------------------------------------"
echo "Listing last 5 files and dir after executing the script"

ls *.txt -ll | tail -n 5

ls -d */ -ll | tail -n 5
echo "--------------------------------------------------------"
echo "Script ran successfully"



