-- Active: 1715685873518@@localhost@5432@20241_fatec_ipi_pbdi_stored_procedures

DO $$
DECLARE
  v_resultado VARCHAR(500);
  v_troco INT := 43;
BEGIN
  CALL sp_obter_notas_para_compor_o_troco(v_resultado, v_troco);
  RAISE NOTICE '%', v_resultado;
END;
$$


-- CREATE OR REPLACE PROCEDURE sp_obter_notas_para_compor_o_troco(
--   OUT p_resultado VARCHAR(500),
--   IN p_troco INT
-- ) LANGUAGE plpgsql
-- AS $$
-- DECLARE
--   v_notas200 INT := 0;
--   v_notas100 INT := 0;
--   v_notas50 INT := 0;
--   v_notas20 INT := 0;
--   v_notas10 INT := 0;
--   v_notas5 INT := 0;
--   v_notas2 INT := 0;
--   v_moedas1 INT := 0;
-- BEGIN
--   v_notas200 := p_troco / 200;
--   v_notas100 := p_troco % 200 / 100;
--   v_notas50 := p_troco % 200 % 100 / 50;
--   v_notas20 := p_troco % 200 % 100 % 50 / 20;
--   v_notas10 := p_troco % 200 % 100 % 50 % 20 / 10;
--   v_notas5 := p_troco % 200 % 100 % 50 % 20 % 10 / 5;
--   v_notas2 := p_troco % 200 % 100 % 50 % 20 % 10 % 5 / 2;
--   v_moedas1 := p_troco % 200 % 100 % 50 % 20 % 10 % 5 % 2 / 1;

--   p_resultado := CONCAT(
--     'Notas de 200: ',
--     v_notas200 || E'\n',
--     'Notas de 100: ',
--     v_notas100 || E'\n',
--     'Notas de 50: ',
--     v_notas50 || E'\n',
--     'Notas de 20: ',
--     v_notas20 || E'\n',
--     'Notas de 10: ',
--     v_notas10 || E'\n'
--     'Notas de 5: ',
--     v_notas5 || E'\n',
--     'Notas de 2: ',
--     v_notas2 || E'\n',
--     'Moedas de 1: ',
--     v_moedas1
--   );
-- END;
-- $$


-- DO $$
-- DECLARE
--   v_troco INT;
--   v_valor_total INT;
--   v_valor_pago_pelo_cliente INT := 50;
-- BEGIN
--   CALL sp_calcular_valor_de_um_pedido(1, v_valor_total);
--   CALL sp_calcular_troco(
--     v_troco, 
--     v_valor_pago_pelo_cliente,
--     v_valor_total
--   );
--   RAISE NOTICE 'A conta foi de R$% e você pagou R$%. Assim, seu troco é de R$%. Volte sempre.', v_valor_total, v_valor_pago_pelo_cliente, v_troco;
-- END;
-- $$


--calcular o troco
-- CREATE OR REPLACE PROCEDURE sp_calcular_troco(
--   OUT p_troco INT,
--   IN p_valor_pago_pelo_cliente INT,
--   IN p_valor_total INT
-- ) LANGUAGE plpgsql AS $$
-- BEGIN
--   p_troco := p_valor_pago_pelo_cliente - p_valor_total;
-- END;
-- $$


-- CALL sp_fechar_pedido(19, 1);
-- SELECT * FROM tb_pedido;
-- CREATE OR REPLACE PROCEDURE sp_fechar_pedido(
--   IN p_valor_pago_pelo_cliente INT,
--   IN p_codigo_pedido INT
-- )LANGUAGE plpgsql
-- AS $$
-- DECLARE
--   v_valor_total INT;
-- BEGIN
--   CALL sp_calcular_valor_de_um_pedido(
--     p_codigo_pedido,
--     v_valor_total
--   );
--   IF p_valor_pago_pelo_cliente < v_valor_total THEN
--     RAISE NOTICE 'R$% insuficiente para pagar a conta de R$%',p_valor_pago_pelo_cliente, v_valor_total;
--   ELSE
--     UPDATE tb_pedido p SET
--     data_modificacao = CURRENT_TIMESTAMP,
--     status = 'fechado'
--     WHERE p.cod_pedido = $2;
--   END IF;
-- END;

-- $$


-- DO $$
-- DECLARE
--   v_valor_total INT;
-- BEGIN
--   CALL sp_calcular_valor_de_um_pedido(1, v_valor_total);
--   RAISE NOTICE 'Total do pedido %: R$%', 1, v_valor_total;
-- END;
-- $$

-- def teste():
--   print('a')
--   print('b')
--   return 2 + 2

-- def outro():
--   resultado = teste()

-- calcula o valor total de um pedido
-- CREATE OR REPLACE PROCEDURE sp_calcular_valor_de_um_pedido(
--   IN p_codigo_pedido INT,
--   OUT p_valor_total INT 
-- ) LANGUAGE plpgsql
-- AS $$
-- BEGIN
--   SELECT SUM(i.valor) FROM
--     tb_pedido p
--     INNER JOIN tb_item_pedido ip ON
--     p.cod_pedido = ip.cod_pedido
--     INNER JOIN tb_item i ON
--     ip.cod_item = i.cod_item
--     WHERE p.cod_pedido = $1
--     INTO $2;
-- END;
-- $$

-- SELECT * FROM tb_pedido;
-- SELECT * FROM tb_item_pedido;

-- SELECT * FROM tb_item;

-- def calcula_valor():
--   soma = 2 + 2
--   return soma

-- SELECT * FROM tb_item_pedido;
-- SELECT * FROM tb_pedido;

-- CALL sp_adicionar_item_a_pedido(3, 1);


-- INSERT INTO tb_item(descricao, valor, cod_tipo) VALUES
-- ('Refrigerante', 7, 1),
-- ('Suco', 8, 1),
-- ('Hamburguer', 12, 2),
-- ('Batata frita', 9, 2);

-- SELECT * FROM tb_tipo_item;

-- INSERT INTO tb_tipo_item (descricao)
-- VALUES('Bebida'), ('Comida');

--adiciona um item a um pedido
--cadastrar o codigo de item e o codigo de pedido
-- atualizar a tabela de pedido, especificamente no campo data_modificacao
-- CREATE OR REPLACE PROCEDURE sp_adicionar_item_a_pedido(
--   IN cod_item INT,
--   IN cod_pedido INT
-- ) LANGUAGE plpgsql AS $$
-- BEGIN
--   INSERT INTO tb_item_pedido(cod_item, cod_pedido)
--   VALUES($1, $2);
--   --atualizar a tabela tb_pedido no campo data_modificacao, registrando a data atual
--   UPDATE tb_pedido p SET data_modificacao = CURRENT_TIMESTAMP WHERE p.cod_pedido = $2;
-- END;
-- $$


--SELECT * FROM tb_pedido;
-- DO $$
-- DECLARE
--   --para guardar o código de pedido gerado
--   cod_pedido INT;
--   -- o código do cliente que vai fazer o pedido
--   cod_cliente INT;
-- BEGIN
--   --pegando o código da pessoa cujo nome é 'João da Silva'
--   SELECT c.cod_cliente FROM tb_cliente c
--   WHERE nome LIKE 'João da Silva' INTO cod_cliente;
--   CALL sp_criar_pedido(cod_pedido, cod_cliente);
--   RAISE NOTICE 'Código do pedido recém criado: %', cod_pedido;
-- END;
-- $$


-- SELECT * FROM tb_cliente;






--cadastro de pedido sem item, ou seja, simulamos a entrada do cliente
--quando um pedido for cadastrado, um codigo será gerado
--ele deverá ser disponibilizado externamente

-- CREATE OR REPLACE PROCEDURE sp_criar_pedido(
--   OUT cod_pedido INT,
--   IN cod_cliente INT
-- ) LANGUAGE plpgsql
-- AS $$
-- BEGIN
--   INSERT INTO tb_pedido (cod_cliente) 
--   VALUES (cod_cliente);
--   SELECT LASTVAL() INTO cod_pedido;
-- END;
-- $$

-- CALL sp_cadastrar_cliente('João da Silva');
-- CALL sp_cadastrar_cliente('Maria Santos');

-- SELECT * FROM tb_cliente;

--cadastro de novos clientes
--talvez eu especifique um codigo, talvez não
-- CREATE OR REPLACE PROCEDURE sp_cadastrar_cliente(
--   IN nome VARCHAR(200),
--   IN codigo INT DEFAULT NULL
-- )
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--   -- se o código for null, cadastrar nome apenas ou seja, usar o valor gerado aleatoriamente pelo SGBD caso contrário, cadastrar nome e codigo que chegaram via parametro
--   IF codigo IS NULL THEN
--     INSERT INTO tb_cliente(nome) VALUES(nome);
--   ELSE
--     INSERT INTO tb_cliente(codigo, nome) 
--     VALUES(codigo, nome);
--   END IF;
-- END;
-- $$


-- Active: 1715685873518@@localhost@5432@20241_fatec_ipi_pbdi_stored_procedures
--sistema de restaurante
-- CREATE TABLE tb_cliente(
--   cod_cliente SERIAL PRIMARY KEY,
--   nome VARCHAR(200) NOT NULL
-- );

-- CREATE TABLE tb_pedido(
--   cod_pedido SERIAL PRIMARY KEY,
--   data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--   status VARCHAR DEFAULT 'aberto',
--   cod_cliente INT NOT NULL,
--   CONSTRAINT fk_cliente FOREIGN KEY (cod_cliente) REFERENCES tb_cliente(cod_cliente)
-- );

-- CREATE TABLE tb_tipo_item(
--   cod_tipo SERIAL PRIMARY KEY,
--   descricao VARCHAR(200) NOT NULL
-- );

-- CREATE TABLE tb_item(
--   cod_item SERIAL PRIMARY KEY,
--   descricao VARCHAR(200) NOT NULL,
--   valor NUMERIC(10, 2) NOT NULL,
--   cod_tipo INT NOT NULL,
--   CONSTRAINT fk_tipo_item FOREIGN KEY (cod_tipo) REFERENCES tb_tipo_item(cod_tipo)
-- );

-- CREATE TABLE tb_item_pedido(
--   --surrogate (substituta)
--   cod_item_pedido SERIAL PRIMARY KEY,
--   cod_item INT,
--   cod_pedido INT,
--   CONSTRAINT fk_item FOREIGN KEY (cod_item) REFERENCES tb_item(cod_item),
--   CONSTRAINT fk_pedido FOREIGN KEY(cod_pedido) REFERENCES tb_pedido(cod_pedido)
-- )

-- --parâmetros variadic
-- CREATE OR REPLACE PROCEDURE sp_calcula_media(
--   VARIADIC valores INT[]
-- )LANGUAGE plpgsql
-- AS $$
-- DECLARE
--   media NUMERIC(10, 2) := 0;
--   valor INT;
-- BEGIN
--   FOREACH valor IN ARRAY valores LOOP
--     media := media + valor;
--   END LOOP;
--   RAISE NOTICE 'A média é: %', media / array_length(valores, 1);
-- END;
-- $$
-- CALL sp_calcula_media(1);
-- CALL sp_calcula_media(1, 2, 5, 4, 6, 3);

-- --não funciona
-- CALL sp_calcula_media(ARRAY[2, 4, 3, 4]);
-- -- DROP PROCEDURE IF EXISTS sp_acha_maior;
-- -- CREATE OR REPLACE PROCEDURE sp_acha_maior(
-- --   INOUT valor1 INT,
-- --   IN valor2 INT
-- -- )LANGUAGE plpgsql
-- -- AS $$
-- --   BEGIN
-- --     --resolva em 20 segundos
-- --     IF valor2 > valor1 THEN
-- --       valor1 := valor2;
-- --     END IF;
-- --   END;
-- -- $$;

-- -- --faça um bloquinho anônimo que usa a função
-- -- --em 2 minutos
-- -- DO
-- -- $$
-- -- DECLARE
-- --   valor1 INT := 2;
-- --   valor2 INT := 3;
-- -- BEGIN
-- --   CALL sp_acha_maior(valor1, valor2);
-- --   RAISE NOTICE '% é o maior', valor1;
-- -- END;
-- -- $$
-- -- CREATE OR REPLACE PROCEDURE sp_acha_maior(
-- --   OUT resultado INT,
-- --   IN valor1 INT,
-- --   IN valor2 INT
-- -- ) LANGUAGE plpgsql
-- -- AS $$
-- -- BEGIN
-- --   --escreva o maior na variável resultado (use case)
-- --   --(em 1 minuto)
-- --   CASE
-- --     WHEN valor1 > valor2 THEN
-- --       $1 := valor1;
-- --     ELSE
-- --       resultado := valor2;
-- --   END CASE;
-- -- END;
-- -- $$

-- -- --colocando em execução
-- -- DO $$
-- -- DECLARE
-- --   resultado INT;
-- -- BEGIN
-- --   CALL sp_acha_maior(resultado, 2, 3);
-- --   RAISE NOTICE 'Maior: %', resultado;
-- -- END;
-- -- $$


-- -- CREATE OR REPLACE PROCEDURE sp_acha_maior(
-- --   IN valor1 INT, 
-- --   IN valor2 INT
-- -- ) LANGUAGE plpgsql
-- -- AS $$
-- -- BEGIN
-- --   IF valor1 > valor2 THEN
-- --     RAISE NOTICE '% é o maior', $1;
-- --   ELSE
-- --     RAISE NOTICE '% é o maior', $2;
-- --   END IF;
-- -- END;
-- -- $$

-- -- CALL sp_acha_maior(2, 3);

-- -- -- Active: 1715685873518@@localhost@5432
-- -- --Procedure com parâmetro
-- -- CREATE OR REPLACE PROCEDURE sp_ola_usuario(p_nome VARCHAR(200))
-- -- LANGUAGE plpgsql
-- -- AS $$
-- -- BEGIN
-- --   RAISE NOTICE 'Olá(pelo nome), %', p_nome;
-- --   RAISE NOTICE 'Olá(pelo número), %', $1;
-- -- END;
-- -- $$

-- -- CALL sp_ola_usuario('Ana');




-- -- CREATE DATABASE "20241_fatec_ipi_pbdi_stored_procedures";

-- -- CREATE OR REPLACE PROCEDURE sp_ola_procedures()
-- -- LANGUAGE plpgsql
-- -- AS $$
-- -- BEGIN
-- --   RAISE NOTICE 'Olá, stored procedures';
-- -- END;
-- -- $$;
-- -- CALL sp_ola_procedures();