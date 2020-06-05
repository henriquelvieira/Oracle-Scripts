--COMANDOS EXECUTADOS VIA SQLPLUS

/*
REFERÊNCIAS:
* http://www.oracledistilled.com/oracle-database/backup-and-recovery/enabledisable-archive-log-mode-10g11g/
  https://cooperati.com.br/2012/11/oracle-archivelog-o-que-e-e-como-habilita-lo/

*/

--VERIFIQUE O MODO DE ARCHIVE QUE O BANCO ESTÁ:
SELECT LOG_MODE FROM V$DATABASE;



--1º - PARE O BANCO DE DADOS:
/*
TIPOS DE PARADA:

* IMMEDIATE: Ideal quando é necessário derrubar o banco e não pode-se esperar que as transações cheguem ao seu fim.
  - Realiza Checkpoint;
  - Fecha os arquivos;
    - Não aguarda até o final das transações atuais;
    - Não aguarda até o final das sessões atuais;
    - Não permite novas conexões;

* NORMAL: O banco só será fechado quando todos os usuários que estiverem conectados fecharem suas conexões.
          Ideal quando para manutenções que não são urgentes.
  - Realiza Checkpoint;
  - Fecha os arquivos;
    - Aguarda até o final das transações atuais;
      - Aguarda até o final das sessões atuais;
      - Não permite novas conexões;

*/

SHUTDOWN IMMEDIATE;

--2º - LEVANTANDO A BASE EM MODO DE MANUTENÇÃO:
STARTUP MOUNT;

--3º - ALTERE O BANCO PARA O MODO ARCHIVELOG
ALTER DATABASE ARCHIVELOG;

--4º - ABRA O BANCO DE DADOS
ALTER DATABASE OPEN;

--5º - EXECUTE ESSE PASSO CASO QUEIRA ALTERAR O LOCAL DE GERAÇÃO DOS ARCHIVELOG'S
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1 ='LOCATION=/u02/app/oracle/oradata/orcl/arch' SCOPE=SPFILE;

----------------------------------------------------------------------------------------------------------

--DESATIVANDO O ARCHIVELOG
--REALIZE OS MESMOS PASSOS ALTERANDO APENAS O 3]
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE NOARCHIVELOG;
ALTER DATABASE OPEN;




