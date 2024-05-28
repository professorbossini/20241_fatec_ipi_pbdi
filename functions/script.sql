-- Active: 1715685873518@@localhost@5432@20241_fatec_ipi_pbdi_functions@public


DO $$
DECLARE
  v_cod_cliente INT := 1;
  v_cod_conta INT := 2;
  v_valor NUMERIC(10, 2) := 200;
  v_saldo_resultante NUMERIC(10, 2);
BEGIN
  SELECT fn_depositar(v_cod_cliente, v_cod_conta, v_valor) INTO v_saldo_resultante;
  RAISE NOTICE 
    '%',
    format(
      'Após depositar R$%s, o saldo resultante é de R$%s',
      v_valor,
      v_saldo_resultante
    )
  ;
END;
$$
-- 

-- CREATE OR REPLACE FUNCTION fn_depositar(
--   IN p_cod_cliente INT,
--   IN p_cod_conta INT,
--   IN p_valor NUMERIC(10, 2)
-- )RETURNS NUMERIC(10, 2) LANGUAGE plpgsql
-- AS $$
-- DECLARE
--   v_saldo_resultante NUMERIC(10, 2);
-- BEGIN
--   UPDATE tb_conta SET saldo = saldo + p_valor
--   WHERE cod_cliente = p_cod_cliente AND cod_conta = p_cod_conta;
  
--   SELECT saldo FROM tb_conta c
--   WHERE c.cod_cliente = p_cod_cliente AND c.cod_conta = p_cod_conta
--   INTO v_saldo_resultante;

--   RETURN v_saldo_resultante;
-- END;
-- $$

-- DROP ROUTINE IF EXISTS fn_depositar;


-- SELECT * FROM tb_conta;

-- DO $$
-- DECLARE
--   v_cod_cliente INT := 1;
--   v_saldo NUMERIC (10, 2) := 500;
--   v_cod_tipo_conta INT := 1;
--   v_resultado BOOLEAN;
-- BEGIN
--   SELECT fn_abrir_conta(v_cod_cliente, v_saldo, v_cod_tipo_conta) INTO v_resultado;
--   --Conta com saldo R$valor foi aberta
--   --Conta com saldo R$valor não foi aberta
--   RAISE NOTICE 
--     '%', 
--     format(
--       'Conta com saldo R$%s%s foi aberta',
--       v_saldo,
--       CASE WHEN v_resultado THEN '' ELSE ' não' END
--     )
--   ;
--   v_saldo := 1000;
--   SELECT fn_abrir_conta(v_cod_cliente, v_saldo, v_cod_tipo_conta) INTO v_resultado;
--   RAISE NOTICE '%',
--     format(
--       'Conta com saldoR$%s%s foi aberta',
--       v_saldo,
--       CASE
--         WHEN v_resultado THEN ''
--         ELSE ' não'
--       END
--     )
--   ;
-- END;
-- $$



--essa função abre uma conta
-- CREATE OR REPLACE FUNCTION fn_abrir_conta(
--   IN p_cod_cliente INT, 
--   IN p_saldo NUMERIC(10, 2), 
--   IN p_cod_tipo_conta INT
-- ) RETURNS BOOLEAN LANGUAGE plpgsql
-- AS $$
-- BEGIN
--   INSERT INTO tb_conta
--   (cod_cliente, saldo, cod_tipo_conta) VALUES
--   ($1, $2, $3);
--   RETURN TRUE;
-- EXCEPTION WHEN OTHERS THEN
--   RETURN FALSE;
-- END;
-- $$
-- CREATE TABLE tb_conta(
--   cod_conta SERIAL PRIMARY KEY,
--   status VARCHAR(200) NOT NULL DEFAULT 'aberta',
--   data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   data_ultima_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   saldo NUMERIC(10, 2) NOT NULL DEFAULT 1000 CHECK(saldo >= 1000),
--   cod_cliente INT NOT NULL,
--   cod_tipo_conta INT NOT NULL,
--   CONSTRAINT fk_cliente FOREIGN KEY(cod_cliente) REFERENCES tb_cliente(cod_cliente),
--   CONSTRAINT fk_tipo_conta FOREIGN KEY(cod_tipo_conta)REFERENCES tb_tipo_conta(cod_tipo_conta)
-- );



-- INSERT INTO tb_tipo_conta(descricao) VALUES
-- ('Conta Corrente'),
-- ('Conta Poupança');


-- CREATE TABLE tb_tipo_conta(
--   cod_tipo_conta SERIAL PRIMARY KEY,
--   descricao VARCHAR(200) NOT NULL
-- );

-- CREATE TABLE tb_cliente(
--   cod_cliente SERIAL PRIMARY KEY,
--   nome VARCHAR(200) NOT NULL
-- );

-- INSERT INTO tb_cliente(nome) VALUES('João Santos'), ('Maria Andrade');


-- DO $$
-- DECLARE v_resultado BOOLEAN;
-- BEGIN
--   SELECT fn_all('fn_ehPar', 1, 2, 3, 4, 5, 6) INTO v_resultado;
--   RAISE NOTICE '%', v_resultado;
--   SELECT fn_all('fn_ehPar', 2, 4, 6) INTO v_resultado;
--   RAISE NOTICE '%', v_resultado;
-- END;
-- $$

-- CREATE OR REPLACE FUNCTION fn_all (IN p_fn_funcao TEXT, VARIADIC p_elementos INT[])
-- RETURNS BOOLEAN LANGUAGE plpgsql
-- AS $$
-- DECLARE
--   v_elemento INT;
--   v_resultado BOOLEAN;
-- BEGIN
--   FOREACH v_elemento IN ARRAY p_elementos LOOP
--     EXECUTE format('SELECT %s(%s)', p_fn_funcao, v_elemento) INTO v_resultado;
--     IF NOT v_resultado THEN
--       RETURN FALSE;
--     END IF;
--   END LOOP;
--   RETURN TRUE;
-- END;
-- $$;


-- DO $$
-- DECLARE
--   v_resultado BOOLEAN;
-- BEGIN
--   SELECT fn_some('fn_ehPar', 1, 2) INTO v_resultado;
--   RAISE NOTICE '%', v_resultado;
--   SELECT fn_some('fn_ehPar', 1, 3, 5) INTO v_resultado;
--   RAISE NOTICE '%', v_resultado;
-- END;
-- $$

-- CREATE OR REPLACE FUNCTION fn_some(
--   IN p_fn_funcao TEXT,
--   VARIADIC p_elementos INT[]
-- ) RETURNS BOOLEAN
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE
--   v_elemento INT;
--   v_resultado BOOLEAN;
-- BEGIN
--   FOREACH v_elemento IN ARRAY p_elementos LOOP
--     EXECUTE format('SELECT %s(%s)', p_fn_funcao, v_elemento) INTO v_resultado;
--     IF v_resultado = TRUE THEN
--       RETURN TRUE;
--     END IF;
--   END LOOP;
--   RETURN FALSE;
-- END;
-- $$;


-- SELECT fn_executa('fn_ehPar', 4);

-- CREATE OR REPLACE FUNCTION fn_executa(
--   IN p_fn_nome_funcao_a_executar TEXT, IN n INT
-- ) RETURNS BOOLEAN
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE
--   v_resultado BOOLEAN;
-- BEGIN
--   --EXECUTE p_fn_nome_funcao_a_executar(n)
--   --montamos uma string por concatenação
--   EXECUTE 'SELECT ' || p_fn_nome_funcao_a_executar || '(' || n || ')' INTO v_resultado;
--   --montamos uma string por substituição
--   EXECUTE format('SELECT %s(%s)', p_fn_nome_funcao_a_executar, n) INTO v_resultado;
--   RETURN v_resultado;
-- END;
-- $$


-- CREATE OR REPLACE FUNCTION fn_ehPar (IN n INT) RETURNS BOOLEAN
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--   RETURN n % 2 = 0;
-- END;
-- $$


-- chamar a function com um bloco anônimo
-- DO $$
-- DECLARE
--   v_resultado TEXT;
-- BEGIN
--   -- use call apenas para chamar procedures
--   -- CALL fn_hello();
--   -- executa descartando...
--   PERFORM fn_hello();
--   --pegando o valor resultante...
--   v_resultado := fn_hello();
--   RAISE NOTICE '%', v_resultado;
--   SELECT fn_hello() INTO v_resultado;
--   RAISE NOTICE '%', v_resultado;
-- END;
-- $$


-- chamar a function sem um bloco anônimo
-- SELECT fn_hello() AS resultado;




-- CREATE OR REPLACE FUNCTION fn_hello() RETURNS TEXT
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--   RETURN 'Hello, Functions!';
-- END;
-- $$
