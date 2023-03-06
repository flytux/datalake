-- Create Drive Stats schema and table
CREATE SCHEMA IF NOT EXISTS b2.ds
    WITH (location = 's3a://drivestats-parquet/');

USE b2.ds;

CREATE TABLE drivestats (
                            date DATE,
                            serial_number VARCHAR,
                            model VARCHAR,
                            capacity_bytes BIGINT,
                            failure TINYINT,
                            smart_1_normalized BIGINT,
                            smart_1_raw BIGINT,
                            smart_2_normalized BIGINT,
                            smart_2_raw BIGINT,
                            smart_3_normalized BIGINT,
                            smart_3_raw BIGINT,
                            smart_4_normalized BIGINT,
                            smart_4_raw BIGINT,
                            smart_5_normalized BIGINT,
                            smart_5_raw BIGINT,
                            smart_7_normalized BIGINT,
                            smart_7_raw BIGINT,
                            smart_8_normalized BIGINT,
                            smart_8_raw BIGINT,
                            smart_9_normalized BIGINT,
                            smart_9_raw BIGINT,
                            smart_10_normalized BIGINT,
                            smart_10_raw BIGINT,
                            smart_11_normalized BIGINT,
                            smart_11_raw BIGINT,
                            smart_12_normalized BIGINT,
                            smart_12_raw BIGINT,
                            smart_13_normalized BIGINT,
                            smart_13_raw BIGINT,
                            smart_15_normalized BIGINT,
                            smart_15_raw BIGINT,
                            smart_16_normalized BIGINT,
                            smart_16_raw BIGINT,
                            smart_17_normalized BIGINT,
                            smart_17_raw BIGINT,
                            smart_18_normalized BIGINT,
                            smart_18_raw BIGINT,
                            smart_22_normalized BIGINT,
                            smart_22_raw BIGINT,
                            smart_23_normalized BIGINT,
                            smart_23_raw BIGINT,
                            smart_24_normalized BIGINT,
                            smart_24_raw BIGINT,
                            smart_160_normalized BIGINT,
                            smart_160_raw BIGINT,
                            smart_161_normalized BIGINT,
                            smart_161_raw BIGINT,
                            smart_163_normalized BIGINT,
                            smart_163_raw BIGINT,
                            smart_164_normalized BIGINT,
                            smart_164_raw BIGINT,
                            smart_165_normalized BIGINT,
                            smart_165_raw BIGINT,
                            smart_166_normalized BIGINT,
                            smart_166_raw BIGINT,
                            smart_167_normalized BIGINT,
                            smart_167_raw BIGINT,
                            smart_168_normalized BIGINT,
                            smart_168_raw BIGINT,
                            smart_169_normalized BIGINT,
                            smart_169_raw BIGINT,
                            smart_170_normalized BIGINT,
                            smart_170_raw BIGINT,
                            smart_171_normalized BIGINT,
                            smart_171_raw BIGINT,
                            smart_172_normalized BIGINT,
                            smart_172_raw BIGINT,
                            smart_173_normalized BIGINT,
                            smart_173_raw BIGINT,
                            smart_174_normalized BIGINT,
                            smart_174_raw BIGINT,
                            smart_175_normalized BIGINT,
                            smart_175_raw BIGINT,
                            smart_176_normalized BIGINT,
                            smart_176_raw BIGINT,
                            smart_177_normalized BIGINT,
                            smart_177_raw BIGINT,
                            smart_178_normalized BIGINT,
                            smart_178_raw BIGINT,
                            smart_179_normalized BIGINT,
                            smart_179_raw BIGINT,
                            smart_180_normalized BIGINT,
                            smart_180_raw BIGINT,
                            smart_181_normalized BIGINT,
                            smart_181_raw BIGINT,
                            smart_182_normalized BIGINT,
                            smart_182_raw BIGINT,
                            smart_183_normalized BIGINT,
                            smart_183_raw BIGINT,
                            smart_184_normalized BIGINT,
                            smart_184_raw BIGINT,
                            smart_187_normalized BIGINT,
                            smart_187_raw BIGINT,
                            smart_188_normalized BIGINT,
                            smart_188_raw BIGINT,
                            smart_189_normalized BIGINT,
                            smart_189_raw BIGINT,
                            smart_190_normalized BIGINT,
                            smart_190_raw BIGINT,
                            smart_191_normalized BIGINT,
                            smart_191_raw BIGINT,
                            smart_192_normalized BIGINT,
                            smart_192_raw BIGINT,
                            smart_193_normalized BIGINT,
                            smart_193_raw BIGINT,
                            smart_194_normalized BIGINT,
                            smart_194_raw BIGINT,
                            smart_195_normalized BIGINT,
                            smart_195_raw BIGINT,
                            smart_196_normalized BIGINT,
                            smart_196_raw BIGINT,
                            smart_197_normalized BIGINT,
                            smart_197_raw BIGINT,
                            smart_198_normalized BIGINT,
                            smart_198_raw BIGINT,
                            smart_199_normalized BIGINT,
                            smart_199_raw BIGINT,
                            smart_200_normalized BIGINT,
                            smart_200_raw BIGINT,
                            smart_201_normalized BIGINT,
                            smart_201_raw BIGINT,
                            smart_202_normalized BIGINT,
                            smart_202_raw BIGINT,
                            smart_206_normalized BIGINT,
                            smart_206_raw BIGINT,
                            smart_210_normalized BIGINT,
                            smart_210_raw BIGINT,
                            smart_218_normalized BIGINT,
                            smart_218_raw BIGINT,
                            smart_220_normalized BIGINT,
                            smart_220_raw BIGINT,
                            smart_222_normalized BIGINT,
                            smart_222_raw BIGINT,
                            smart_223_normalized BIGINT,
                            smart_223_raw BIGINT,
                            smart_224_normalized BIGINT,
                            smart_224_raw BIGINT,
                            smart_225_normalized BIGINT,
                            smart_225_raw BIGINT,
                            smart_226_normalized BIGINT,
                            smart_226_raw BIGINT,
                            smart_230_normalized BIGINT,
                            smart_230_raw BIGINT,
                            smart_231_normalized BIGINT,
                            smart_231_raw BIGINT,
                            smart_232_normalized BIGINT,
                            smart_232_raw BIGINT,
                            smart_233_normalized BIGINT,
                            smart_233_raw BIGINT,
                            smart_234_normalized BIGINT,
                            smart_234_raw BIGINT,
                            smart_235_normalized BIGINT,
                            smart_235_raw BIGINT,
                            smart_240_normalized BIGINT,
                            smart_240_raw BIGINT,
                            smart_241_normalized BIGINT,
                            smart_241_raw BIGINT,
                            smart_242_normalized BIGINT,
                            smart_242_raw BIGINT,
                            smart_244_normalized BIGINT,
                            smart_244_raw BIGINT,
                            smart_245_normalized BIGINT,
                            smart_245_raw BIGINT,
                            smart_246_normalized BIGINT,
                            smart_246_raw BIGINT,
                            smart_247_normalized BIGINT,
                            smart_247_raw BIGINT,
                            smart_248_normalized BIGINT,
                            smart_248_raw BIGINT,
                            smart_250_normalized BIGINT,
                            smart_250_raw BIGINT,
                            smart_251_normalized BIGINT,
                            smart_251_raw BIGINT,
                            smart_252_normalized BIGINT,
                            smart_252_raw BIGINT,
                            smart_254_normalized BIGINT,
                            smart_254_raw BIGINT,
                            smart_255_normalized BIGINT,
                            smart_255_raw BIGINT,
                            day SMALLINT,
                            year SMALLINT,
                            month SMALLINT
)
    WITH (format = 'PARQUET',
        partitioned_by = ARRAY['year', 'month'],
        external_location = 's3a://drivestats-parquet/drivestats');

-- Tell the Hive connector to scan the partitions for the drivestats table
CALL system.sync_partition_metadata('ds', 'drivestats', 'FULL');