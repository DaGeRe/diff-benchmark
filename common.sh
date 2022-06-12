function unzipCommit {
	commit=$1
	if [ ! -f $commit.txt ]
	then
		echo "Unzipping $commit"
		unzip ../$commit.zip
		mv trace.txt $commit.txt
	fi
}

function prepareSize {
	size=$1
	if [ ! -d $size ]
	then
		
		mkdir $size
		head 414ae6.txt -n $size > $size/414ae6.txt
		head afdedc.txt -n $size > $size/afdedc.txt
	fi
}

function prepareData {
	for size in 10000 50000
	do
		prepareSize $size
	done
	for size in {100000..600000..100000}
	do
		prepareSize $size
	done
}


