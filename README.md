# datalake

## 1. Debezium + Kafka Connector를 이용한 ETL 구성

## 2. Flink + Debezium을 이용한 ETL 구성
 - Flink의 경우 처리 속도가 빠르고,
 - Datastream API와 Table API를 이용하여 stream 변환이 유리하다.
 - aws emr 및 google dataproc에서 사용되는 opensource
      
## 3. Trino를 이용한 분산 쿼리
 - trino connector에 rdbms와 datasource 등을 추가하고,
 - 통합 쿼리를 수행
