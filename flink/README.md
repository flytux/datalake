### 1) Flink 이미지 빌드 및 서비스 구동  

- Debezium Workshop 환경을 기반으로 수행합니다.
- mysql / postgres 데이터베이스를 클러스터 내에 구성하여 연결합니다.
- flink 서비스를 이용하여 Data Source와 Target의 실시간 동기화 파이프라인을 구성합니다.
 

```bash
# flink 컨테이너 이미지를 빌드합니다.
$ nerdctl build -t apache/flink:dev .

# flink 서비스를 기동합니다.
$ k create ns flink
$ k apply -f flink.yml -n flink
```

---

### 2) Flink SQL Client 실행

```bash
$ k exec -it flink-Jobmanager ./bin/sql-client.sh

FLINK SQL> SET 'execution.checkpointing.interval' = '3s';   

CREATE TABLE customers (
     id INT,
     first_name STRING,
     last_name STRING,
     email STRING,
     PRIMARY KEY(id) NOT ENFORCED
     ) WITH (
     'connector' = 'mysql-cdc',
     'hostname' = 'mysql',
     'port' = '3306',
     'username' = 'root',
     'password' = 'debezium',
     'database-name' = 'inventory',
     'table-name' = 'customers');
  
SELECT * FROM customers;
```

---

### 3) MySQL 소스 데이터 update

```bash
$ k exec -it mysql-6fc7c66c64-5dvsg bash
$ mysql -u root -p debezium

$ UPDATE customers SET first_name='Anne Marie' WHERE id=1004;
```

---

### 4) CDC 결과 확인

```bash
# Postgres 테이블 생성
$ k exec -it postgres bash
$ psql -U postgresuser -d postgres

CREATE TABLE customers (
	id INTEGER PRIMARY KEY,
	first_name VARCHAR ( 50 ),
	last_name VARCHAR ( 50 ),
	email VARCHAR ( 255 ),
);
```
---

### 5) new_customer 생성

```bash
Flink SQL> CREATE TABLE new_customers (
     id INT,
     first_name STRING,
     last_name STRING,
     email STRING,
     PRIMARY KEY(id) NOT ENFORCED
     ) WITH (
   'connector' = 'jdbc',
   'url' = 'jdbc:postgresql://postgres:5432/postgres',
   'table-name' = 'customers'
   'username' = 'postgresuser',
   'password' = 'postgrespw'
);
```

---

### 6) customer --> new_customer insert 쿼리로 ETL 처리

```bash
Flink SQL> INSERT INTO new_customers
 SELECT c.*
 FROM customers AS c
```
