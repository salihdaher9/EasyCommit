Easycommit is a simple bashscript that takes your excel file 
and find your task by the name of your current branch,
and helps you with naming commits by adding default names containing the assigment time,name,branch name ,and description while also giving you the option to add your 
own description,EasyCommit gives you the option to commit locally as well as remotly(to your github repo)

-r param will commit remotly
-l will commit locally

Example:
./commit.sh -l -m my own message----------------- commits locally with the message
./commit.sh -r -m my own message----------------- commits remotly with the message
