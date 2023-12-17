#! /bin/bash  
#echo "The zreo argument is: $0"  
echo "The first argument is: $1"
echo "The second argument is: $2"
#echo "The all argument is: $@"
#echo "The count argument is: $#"

mkdir -p $2
PWD=`pwd`    
files=`ldd $1 | awk '{ if(match($3,"^/"))    
        printf("%s "),$3 }'`    
cp $files $2/

