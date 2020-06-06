/*
Quando o banco de dados precisa acessar/gerar arquivos no sistema operacional é utilizado o diretório.
Em versões anteriores do Oracle utilizávamos o utl_file_dir, mas a partir da versão 11g a Oracle recomenda a utilização apenas
do DIRECTORY (diretório).

Referência: http://oracle-sql-procedimentos.blogspot.com/2017/06/diretorios-oracle-criar.html
*/

--CONSULTAR OS DIRETÓRIOS DO ORACLE
SELECT * FROM DBA_DIRECTORIES;

--CRIAR DIRETÓRIO
CREATE OR REPLACE DIRECTORY BKP AS 'C:\BKP';

--ATRIBUIR PERMISSÃO DE LEITURA E ESCRITA PARA UM USUÁRIO
GRANT READ, WRITE ON DIRECTORY BKP TO <<USUARIO>>;

--EXCLUIR DIRETÓRIO VIRTUAL DO ORACLE
DROP DIRECTORY <<NOME DO DIRETÓRIO>>;

