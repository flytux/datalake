FROM apache/flink:1.13.2
RUN wget https://repo1.maven.org/maven2/com/ververica/flink-sql-connector-mysql-cdc/2.1.1/flink-sql-connector-mysql-cdc-2.1.1.jar
RUN wget https://repo1.maven.org/maven2/com/ververica/flink-sql-connector-postgres-cdc/2.1.1/flink-sql-connector-postgres-cdc-2.1.1.jar
RUN wget https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-elasticsearch7_2.11/1.13.2/flink-sql-connector-elasticsearch7_2.11-1.13.2.jar
RUN mv *.jar lib/

