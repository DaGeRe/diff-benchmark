source ../common.sh


unzipCommit 414ae6
unzipCommit afdedc
prepareData

mvn clean package
java -jar target/benchmarks.jar -r 1 -w 1 -f 2
