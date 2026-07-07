#!/bin/bash

ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1
ORACLE_SID=ORCL

export ORACLE_HOME
export ORACLE_SID
export PATH=$ORACLE_HOME/bin:$PATH

rman target / <<EOF

BACKUP ARCHIVELOG ALL DELETE INPUT;

EXIT;

EOF
