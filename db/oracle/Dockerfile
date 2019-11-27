FROM pmelopereira/oracle-xe11g

MAINTAINER Taras Tereshchenko <doifuwonna@gmail.com>

WORKDIR '/'

COPY ./*.sh ./ 

ENV ORACLE_USER=qa_admin \
  ORACLE_PASS=$ORACLE_USER

ENTRYPOINT ["bash", "./entry_point.sh"]