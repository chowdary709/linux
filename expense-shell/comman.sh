log_file=/tmp/expense.log


download_and_extract() {
 echo downloading $component code
 curl -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip &>$log_file

 echo extracting $component code
 unzip /tmp/$component.zip  &>$log_file
}