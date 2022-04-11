
# prepare ia CLI tool
cd /
if ! command -v ia &> /dev/null
then
    if command -v curl &> /dev/null
    then
        curl -LOs https://archive.org/download/ia-pex/ia
        chmod +x ia
    elif command -v wget &> /dev/null
    then
        wget https://archive.org/download/ia-pex/ia
        chmod +x ia
    else
        echo "need ia CLI tool or either curl or wget to download it"
        exit 1
    fi
fi

# prepare ia config file
echo -e "[s3]\naccess = $S3_ACCESS\nsecret = $S3_SECRET\n" > ia_config

# get the project slug to use as folder name
folder_name="$1"

cd /alloc/logs
mkdir $folder_name
mv * $folder_name  # will skip any hidden files like .services-persistent-logging.stderr.fifo

# compress
gzip $folder_name/*

# upload to item
identifier=$(date '+ia_nomadserverlogs_%Y%m%d')
/ia -c /ia_config upload identifier $folder_name

# concatenate logs into /alloc/logs/ship
# uniq_log_names=$(ls | sed 's/\.\d\d*//' | uniq)
# while IFS= read -r log_name
# do
#     echo "$log_name"
#     cat $log_name* > "$folder_name/$log_name"
# done < <(echo "$uniq_log_names")
