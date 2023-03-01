# Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr
writefile=$1
writestr=$2

# Exits with value 1 error and print statements if writefile is not a file or it is not specified
if [ -z "$writefile" ]; then
    echo "Error: writefile is not a file or it is not specified"
    exit 1
fi

# Exits with value 1 error and print statements if writestr is not specified
if [ -z "$writestr" ]; then
    echo "Error: writestr not specified"
    exit 1
fi

# Check if writefile already exists
if [ -e "$writefile" ]; then
    # If writefile already exists, remove it and write writestr to the file
    rm "$writefile"
    echo "$writestr" > "$writefile"
else
    # If writefile does not exist, create the path to writefile and write writestr to the file
    mkdir -p $(dirname "$writefile")
    echo "$writestr" > "$writefile"
fi

