#!/bin/bash
cowsay Hey man , I am going to push your works on your github repo ......
sleep 2
git init
echo "Adding your data ........"
git add .

#take user commit message
echo -n "Enter the commit message: "
read commitMessage
echo "Commiting your changes with your message : $commitMessage"
sleep 1
git commit -m "$commitMessage"

# ask user to change the branch
echo -n "Do you want to change the branch from master to main ? (y/n): "
read choice_char
sleep 1

if [ "$choice_char" = "y" ]; then
	echo "Switching to main branch ..........."
	sleep 1
	git branch -M main
	sleep 1
	echo "Now you are on main branch !!"
else
	echo "Continueing with master branch ......"
fi

# adding a remote url

echo -n "Please enter the SSH url (eg: git@github.com:your_username/your-repo.git) : "
read remoteUrl

echo "adding your remote origin ..........."
sleep 1
git remote add origin $remoteUrl

echo "Finally pushing your data to the repository ........."
sleep 2
git push origin main -f

echo "Succesfully pushed to your repo ............"
sleep 1
cowsay Thank you for using !!
echo "by sudeep bogati .........................."
