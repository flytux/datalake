# Iceberg Spark Rest - JDBC metastore - postgres - Minio data store docker

- https://tabular.io/blog/docker-spark-and-iceberg/
- https://iceberg.apache.org/spark-quickstart/
- https://github.com/ivrore/apache-iceberg-minio-spark.git

```bash
version: '3'
services:
  spark-iceberg:
    image: tabulario/spark-iceberg
    container_name: spark-iceberg
    restart: always
    build: spark/
    depends_on:
      - rest
      - minio
    volumes:
      - ./warehouse:/home/iceberg/iceberg_warehouse
      - ./notebooks:/home/iceberg/notebooks/notebooks
      - ./spark/data:/home/iceberg/data
    environment:
      - AWS_ACCESS_KEY_ID=minioadmin
      - AWS_SECRET_ACCESS_KEY=minioadmin
      - AWS_REGION=us-east-1
    ports:
      - 30888:8888
      - 30880:8080
      - 10000:10000
      - 10001:10001
    networks:
      - iceberg-net

  db:
    image: postgres:10.5
    restart: always
    ports:
      - "30432:5432"
    environment:
      POSTGRES_USER: icebergcat
      POSTGRES_PASSWORD: minio
    volumes:
      - ./sql:/docker-entrypoint-initdb.d
    networks:
      - iceberg-net

  minio:
    image: minio/minio
    container_name: minio
    restart: always
    environment:
      - MINIO_ROOT_USER=minioadmin
      - MINIO_ROOT_PASSWORD=minioadmin
      - MINIO_DOMAIN=minio
    ports:
      - 30901:9001
      - 30900:9000
    command: ["server", "/data", "--console-address", ":9001"]
    networks:
      iceberg-net:
        aliases:
          - iceberg.minio

  minio-client:
    image: minio/mc
    depends_on:
      - minio
    restart: always
    container_name: minio-client
    environment:
      - AWS_ACCESS_KEY_ID=minioadmin
      - AWS_SECRET_ACCESS_KEY=minioadmin
      - AWS_REGION=us-east-1
    networks:
      - iceberg-net
    entrypoint: >
      /bin/sh -c "
      until (/usr/bin/mc config host add minio http://minio:9000 minioadmin minioadmin) do echo '...waiting...' && sleep 1; done;
      /usr/bin/mc rm -r --force minio/iceberg;
      /usr/bin/mc mb minio/iceberg;
      /usr/bin/mc policy set public minio/iceberg;
      tail -f /dev/null
      "

  rest:
    image: tabulario/iceberg-rest
    container_name: iceberg-rest
    restart: always
    ports:
      - 8181:8181
    environment:
      - AWS_ACCESS_KEY_ID=minioadmin
      - AWS_SECRET_ACCESS_KEY=minioadmin
      - AWS_REGION=us-east-1
      # rest connect minio with bucketname.hostname:port_number
      # create bucket with iceberg at minio host, create minio network alias - iceberg.minio - i.e create kubernetes service with iceberg.minio for minio access
      # when endpoint is http://minio.9000
      - CATALOG_WAREHOUSE=s3://iceberg/
      - CATALOG_IO__IMPL=org.apache.iceberg.aws.s3.S3FileIO
      - CATALOG_S3_ENDPOINT=http://minio:9000
      - REST_PORT=8181
      # catalog configuration to postgres db
      - CATALOG_CATALOG__IMPL=org.apache.iceberg.jdbc.JdbcCatalog
      - CATALOG_URI=jdbc:postgresql://192.168.45.75:30432/icebergcat
      - CATALOG_JDBC_USER=icebergcat
      - CATALOG_JDBC_PASSWORD=minio
    networks:
      - iceberg-net

  pgadmin:
    image: dpage/pgadmin4
    container_name: pgadmin4_container
    depends_on:
      - db
    restart: always
    ports:
      - "30050:80"
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@gft.com
      PGADMIN_DEFAULT_PASSWORD: admin
    volumes:
      - ./config/servers.json:/pgadmin4/servers.json
    networks:
      - iceberg-net

networks:
  iceberg-net:

```
---

```bash
docker exec -it spark-iceberg spark-sql

CREATE TABLE demo.nyc.taxis
(
  vendor_id bigint,
  trip_id bigint,
  trip_distance float,
  fare_amount double,
  store_and_fwd_flag string
)
PARTITIONED BY (vendor_id);

INSERT INTO demo.nyc.taxis
VALUES (1, 1000371, 1.8, 15.32, 'N'), (2, 1000372, 2.5, 22.15, 'N'), (2, 1000373, 0.9, 9.01, 'N'), (1, 1000374, 8.4, 42.13, 'Y');

SELECT * FROM demo.nyc.taxis;
```
