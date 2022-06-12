source ../common.sh


unzipCommit 414ae6
unzipCommit afdedc
prepareData

echo "Finished unzipping"

for size in 10000 50000
do
	echo -n "$size "
	/usr/bin/time --quiet --format="\t%e" ./getDiff.sh $size
done

for size in {100000..600000..100000}
do
	echo -n "$size "
	/usr/bin/time --quiet --format="\t%e" ./getDiff.sh $size
done
