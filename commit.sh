#!/bin/bash

if [ -f data.csv ]; then
    echo "File exists."
else
    echo "File does not exist."
     exit 1

fi

flag1=$1
if [ -n "$2" ]; then
    flag2=$2
    shift 2
else
    shift 1

fi


message=$@

branch_name=$(git rev-parse --abbrev-ref HEAD)




current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
row=$(grep $branch_name data.csv) ##get the csv row using the branch name

Dev_name=$(echo "$row" | cut -d ',' -f 4 | tr -d '"')
id=$(echo "$row" | cut -d ',' -f 1 | tr -d '"')
Description=$(echo "$row" | cut -d ',' -f 2 | tr -d '"')
Priority=$(echo "$row" | cut -d ',' -f 5 | tr -d '"')
Url=$(echo "$row" | cut -d ',' -f 6| tr -d '"')




# Print the extracted value

if [ $# -gt 0 ]; then  ##check for the optional parameter
    echo "description provided"
    final_message="$id:$current_datetime:$branch_name:$Dev_name:$Priority:$Description:$message"   #with optional parameter 

else
    echo " description not provided"
    final_message="$id:$current_datetime:$branch_name:$Dev_name:$Priority:$Description"   #with optional parameter 
  ##without optional parmeter

fi

git add *
#git commit.sh

git commit -m "$final_message"

if [ "$flag1" = "-r" ]; then
    

    
        git push -u $Url $branch_name
        echo "pushed remotely do github "  



   
else
    echo "commited locally"
fi


if [ $? -eq 0 ]; then ##check if push is succesfull
    echo "Push successful"
else
    echo "Error: Push failed"
fi