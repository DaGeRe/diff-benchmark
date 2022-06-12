function unzipCommit {
	commit=$1
	if [ ! -f $commit.txt ]
	then
		echo "Unzipping $commit"
		unzip ../$commit.zip
		mv trace.txt $commit.txt
	fi
}

unzipCommit 414ae6
unzipCommit afdedc

echo "Finished unzipping"

for size in {100000..600000..100000}
do
	echo -n "$size "
	if [ ! -d $size ]
	then
		
		mkdir $size
		head 414ae6.txt -n $size > $size/414ae6.txt
		head afdedc.txt -n $size > $size/afdedc.txt
	fi
	/usr/bin/time --quiet --format="\t%e" ./getDiff.sh $size
done
