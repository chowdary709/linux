log_file=/tmp/expense.log


download_and_extract() {
 echo downloading $component code
 curl -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip &>>$log_file
 
 if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi

 echo extracting $component code
 unzip /tmp/$component.zip  &>>$log_file
 
 if [ $? -eq 0 ]; then
 echo -e "\e[32mSUCCESS\e[0m"
else
 echo -e "\e[33mFAILED\e[0m"
fi
}