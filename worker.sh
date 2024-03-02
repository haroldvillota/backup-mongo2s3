THIS_TIME=$(date +%Y%m%d_%H%M)

IFS=',' read -ra DATABASES <<< "$MONGO_DATABASES"

for DATABASE in "${DATABASES[@]}"; do
    FILENAME="$DATABASE-$THIS_TIME.db"
    FILENAME_LAST="$DATABASE-last.db"
    
    mongodump --uri $MONGODB_CONNECTION --archive=$FILENAME --db=$DATABASE --authenticationDatabase admin

    SIZE=$(stat -f "%Z" "$FILENAME")
    
    if [ "$SIZE" -eq 0 ]; then
        echo "The size of file $FILENAME is zero."
    else
        aws s3 cp $FILENAME $S3_BACKUPS_BUCKET
        aws s3 cp $S3_BACKUPS_BUCKET$FILENAME $S3_BACKUPS_BUCKET$FILENAME_LAST
    fi

    rm "$FILENAME"

done
