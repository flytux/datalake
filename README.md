# datalake

## 1. Debezium + Kafka Connector를 이용한 ETL 구성

## 2. Flink + Debezium을 이용한 ETL 구성
 - Flink의 경우 처리 속도가 빠르고,
 - Datastream API와 Table API를 이용하여 stream 변환이 유리하다.
 - aws emr 및 google dataproc에서 사용되는 opensource
      
## 3. Iceberg를 이용한 datalake 와 RDBMS 통합 쿼리
 - trino connector에 iceberg catalog, postres, mysql catalog을 추가하고
 - 멀티 데이터 소스에 대한 통합 쿼리 및 데이터 처리 지원
