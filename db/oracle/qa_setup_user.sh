#!/bin/bash

source /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
export ORACLE_USER=${ORACLE_USER:-qa_admin}
export ORACLE_PASS=${ORACLE_PASS:-$ORACLE_USER}

sqlplus system/oracle <<SQL_CMD
CREATE USER ${ORACLE_USER} IDENTIFIED by ${ORACLE_PASS};
SQL_CMD

sqlplus system/oracle <<SQL_CMD
GRANT CONNECT, RESOURCE, DBA TO  ${ORACLE_USER};
SQL_CMD


