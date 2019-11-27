#!/bin/bash

source /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
export ORACLE_USER=${ORACLE_USER:-qa_admin}
export ORACLE_PASS=${ORACLE_PASS:-$ORACLE_USER}

mkdir /dbf1 ; chmod 777 /dbf1

sqlplus ${ORACLE_PASS}/${ORACLE_PASS} <<'SQL_CMD'
create tablespace ts_something logging datafile '/dbf1/ts_sth.dbf' size 200m autoextend on next 200m maxsize 11G extent management local;
SQL_CMD

sqlplus ${ORACLE_PASS}/${ORACLE_PASS} <<'SQL_CMD'
create tablespace data datafile '/dbf1/data.dbf' size 200M autoextend on maxsize 11G extent management local uniform size  640K;
SQL_CMD

sqlplus ${ORACLE_PASS}/${ORACLE_PASS} <<'SQL_CMD'
alter user qa_admin default tablespace ts_something ;
SQL_CMD
