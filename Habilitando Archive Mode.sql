--COMANDOS EXECUTADOS VIA SQLPLUS

/*
REFER�NCIAS:
* http://www.oracledistilled.com/oracle-database/backup-and-recovery/enabledisable-archive-log-mode-10g11g/
  https://cooperati.com.br/2012/11/oracle-archivelog-o-que-e-e-como-habilita-lo/

*/

--VERIFIQUE O MODO DE ARCHIVE QUE O BANCO EST�:
SELECT LOG_MODE FROM V$DATABASE;



--1� - PARE O BANCO DE DADOS:
/*
TIPOS DE PARADA:

* IMMEDIATE: Ideal quando � necess�rio derrubar o banco e n�o pode-se esperar que as transa��es cheguem ao seu fim.
  - Realiza Checkpoint;
  - Fecha os arquivos;
    - N�o aguarda at� o final das transa��es atuais;
    - N�o aguarda at� o final das sess�es atuais;
    - N�o permite novas conex�es;

* NORMAL: O banco s� ser� fechado quando todos os usu�rios que estiverem conectados fecharem suas conex�es.
          Ideal quando para manuten��es que n�o s�o urgentes.
  - Realiza Checkpoint;
  - Fecha os arquivos;
    - Aguarda at� o final das transa��es atuais;
      - Aguarda at� o final das sess�es atuais;
      - N�o permite novas conex�es;

*/

SHUTDOWN IMMEDIATE;

--2� - LEVANTANDO A BASE EM MODO DE MANUTEN��O:
STARTUP MOUNT;

--3� - ALTERE O BANCO PARA O MODO ARCHIVELOG
ALTER DATABASE ARCHIVELOG;

--4� - ABRA O BANCO DE DADOS
ALTER DATABASE OPEN;

--5� - EXECUTE ESSE PASSO CASO QUEIRA ALTERAR O LOCAL DE GERA��O DOS ARCHIVELOG'S
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1 ='LOCATION=/u02/app/oracle/oradata/orcl/arch' SCOPE=SPFILE;

----------------------------------------------------------------------------------------------------------

--DESATIVANDO O ARCHIVELOG
--REALIZE OS MESMOS PASSOS ALTERANDO APENAS O 3]
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE NOARCHIVELOG;
ALTER DATABASE OPEN;




