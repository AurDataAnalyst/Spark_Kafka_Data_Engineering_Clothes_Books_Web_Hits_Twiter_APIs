#/home/auredata/spark-data-engg
mkdir includes
cd includes

#copy paste all the jar files from includes folder
ls

#New Window
#/spark-data-engg
vi connect-hdfs-sink.properties
#copy paste Content of connect-hdfs-sink.propertie from the bottom

#Replace connection.URL with ur own ip adress

hostname -I
192.168.0.12 192.168.0.11 

#This is an example script for setting up a Kafka Connect
#Task that uses subscribes to a topic and writes it to a 
#HDFS File sink.

#Make sure safe-mode is OFF in hadoop
sudo -u hdfs hdfs dfsadmin -safemode leave

#hdfs://localhost:9000

#Create a directory receive files.
hadoop fs -mkdir /user/auredata/spark-data-engg

#listing hdfs files 
hadoop fs -ls

#Command to run kafka-connect with a file source connector and a task.
#and also a hdfs sink
export CLASSPATH=/home/cloudera/spark-data-engg/includes/*

/usr/lib/kafka/bin/connect-standalone.sh \
/usr/lib/kafka/config/connect-standalone.properties \
/home/cloudera/spark-data-engg/connect-file-source.properties \
/home/cloudera/spark-data-engg/connect-hdfs-sink.properties

#Command to view sinked data
 hadoop fs -cat spark-data-engg/topics/file-source-test/partition=0/*



#--------------------------------------------------
#Content of connect-hdfs-sink.properties
#--------------------------------------------------

#A logical name for your task
name=demo-hdfs-sink

#Class of connector to use
connector.class=io.confluent.connect.hdfs.HdfsSinkConnector

#Topics to subscribe.
topics=file-source-test

#Number of parallel tasks to launch. Provides scalability
tasks.max=1

#HDFS URL to write the data to
hdfs.url=hdfs://localhost/user/cloudera/spark-data-engg
flush.size=3



