#This is an example script for setting up a Kafka Connect
#Task that uses a file system source to publish a topic.

#Command to run kafka-connect with a file source connector and a task.
/usr/lib/kafka/bin/connect-standalone.sh \
/usr/lib/kafka/config/connect-standalone.properties \
/home/auredata/spark-data-engg/connect-file-source.properties


#Command to subscribe and listen
/usr/lib/kafka/bin/kafka-console-consumer.sh \
--bootstrap-server localhost:9092 \
--topic file-source-test \
--from-beginning

#Command to subscribe and listen
#Publishing  Messages
/usr/local/kafka/bin/kafka-console-consumer.sh \
--bootstrap-server localhost:9092 \
--topic file-source-test \
--from-beginning



mkdir spark-data-engg

vi connect-file-source.properties

mkdir source-file

echo `date` >> file-test.txt
echo `date` >> file-test.txt
echo `date` >> file-test.txt

cat file-text.txt

/usr/local/kafka/bin/connect-standalone.sh \
/usr/local/kafka/config/connect-standalone.properties \
/home/auredata/spark-data-engg/connect-file-source.properties


#New Window
#Command to subscribe and listen
#Publishing  Messages
/usr/local/kafka/bin/kafka-console-consumer.sh \
--bootstrap-server localhost:9092 \
--topic file-source-test \
--from-beginning

#New Window
cd spark-data-engg/source-file
echo `date` >> file-test.txt

#hop! it's subcribing and publishing in kafka-console-consumer
#Means the kafka connect running in the source is listening to the changes in the file took the new line from there publishes it as a topic & then u have the consumer here who actually got the record & pushing it to the console here.

#u can see data is running pretty fast.








#connect-file-srouce.properties content in vi editor shell(cmd l 22):

#--------------------------------------------------
#Content of connect-file-source.properties
#--------------------------------------------------

#A logical name for your task
name=demo-file-source

#Class of connector to use
connector.class=FileStreamSource

#Number of parallel tasks to launch. Provides scalability
tasks.max=1

#Local file to monitor for new input
file=/home/auredata/spark-data-engg/source-file/file-test.txt

#Topic to publish data to.
topic=file-source-test
