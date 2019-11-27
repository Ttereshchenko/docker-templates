#!/bin/bash

export EXECUTE_SCRIPT

sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora
sed -i -E "s/PORT = [^)]+/PORT = 1521/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora
# start db
/etc/init.d/oracle-xe start

# step for waiting TODO: replace this sleep on waiter
sleep 10

# setup steps
bash qa_setup_user.sh
bash qa_create_namespace.sh


# foreground process
tail -f /u01/app/oracle/diag/tnslsnr/$HOSTNAME/listener/trace/listener.log
