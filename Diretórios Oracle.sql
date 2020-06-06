/*
Quando o banco de dados precisa acessar/gerar arquivos no sistema operacional � utilizado o diret�rio.
Em vers�es anteriores do Oracle utiliz�vamos o utl_file_dir, mas a partir da vers�o 11g a Oracle recomenda a utiliza��o apenas
do DIRECTORY (diret�rio).

Refer�ncia: http://oracle-sql-procedimentos.blogspot.com/2017/06/diretorios-oracle-criar.html
*/

--CONSULTAR OS DIRET�RIOS DO ORACLE
SELECT * FROM DBA_DIRECTORIES;

--CRIAR DIRET�RIO
CREATE OR REPLACE DIRECTORY BKP AS 'C:\BKP';

--ATRIBUIR PERMISS�O DE LEITURA E ESCRITA PARA UM USU�RIO
GRANT READ, WRITE ON DIRECTORY BKP TO <<USUARIO>>;

--EXCLUIR DIRET�RIO VIRTUAL DO ORACLE
DROP DIRECTORY <<NOME DO DIRET�RIO>>;

