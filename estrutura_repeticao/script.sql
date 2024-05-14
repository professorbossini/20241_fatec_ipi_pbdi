--FOREACH com SLICE
DO $$
DECLARE
  vetor INT[] := ARRAY[1, 2, 3];
  matriz INT[] := ARRAY[
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  var_aux INT;
  vet_aux INT[];
BEGIN
  FOREACH vet_aux SLICE 3 IN ARRAY matriz LOOP
    RAISE NOTICE '%', vet_aux;
  END LOOP;
END;
$$

--FOREACH
-- DO $$
-- DECLARE
--   valores INT[] := ARRAY[
--     1, 10, 5, 4, 3, 2, 1, 6, 5  
--   ];
--   valor INT;
--   soma INT := 0;
-- BEGIN
  
--   FOREACH valor IN ARRAY valores LOOP
--     RAISE NOTICE 'Valor da vez: %', valor;
--     soma := soma + valor;
--   END LOOP;
--   RAISE NOTICE 'Soma: %', soma;
-- END;
-- $$
-- --calculando a média com FOR
-- DO $$
-- DECLARE
--   aluno RECORD;
--   media NUMERIC(10, 2) := 0;
--   total INT;
-- BEGIN
--   FOR aluno IN
--     SELECT * FROM tb_aluno
--   LOOP
--     --mostrar a nota do aluno atual
--     RAISE NOTICE '%', aluno.nota;
--     --acumular a media em 2 segundos
--     media := media + aluno.nota;
--   END LOOP;
--   -- guardar a quantidade de linhas na variável total
--   SELECT COUNT(*) FROM tb_aluno INTO total;
--   RAISE NOTICE 'Media: %', media / total;
-- END;
-- $$

-- DO $$
-- BEGIN
--   --use um for para inserir 10 notas (0 a 10)
--   FOR i IN 1..10 LOOP
--     INSERT INTO tb_aluno (nota) VALUES
--     (fn_gera_valor_aleatorio_entre(0, 10));
--   END LOOP;
-- END;
-- $$

-- SELECT * FROM tb_aluno;


-- CREATE TABLE tb_aluno(
--   cod_aluno SERIAL PRIMARY KEY,
--   nota INT
-- );


--for: iterando sobre intervalos
-- DO $$
-- BEGIN
--   RAISE NOTICE 'pulando de um em um...';
--   FOR i IN 1..10 LOOP
--     RAISE NOTICE '%', i;
--   END LOOP;
--   RAISE NOTICE 'E agora? Não mostra nada...';
--   FOR i IN 10..1 LOOP
--     RAISE NOTICE '%', i;
--   END LOOP;
--   RAISE NOTICE 'Agora pulando de um em um ao contrário...';
--   FOR i IN REVERSE 10..1 LOOP
--     RAISE NOTICE '%', i;
--   END LOOP;
--   RAISE NOTICE 'Pular de 1 a 50 de 2 em 2';
--   FOR i IN 1..50 BY 2 LOOP
--     RAISE NOTICE '%', i;
--   END LOOP;
--   RAISE NOTICE 'Pular de 50 a 1 de 2 em 2';
--   FOR i IN REVERSE 50..1 BY 2 LOOP
--     RAISE NOTICE '%', i;
--   END LOOP;
-- END;
-- $$

-- DO $$
-- DECLARE
--   nota INT;
--   media NUMERIC(10, 2) := 0;
--   contador INT := 0;
-- BEGIN
--   -- [-1 a 10]
--   SELECT fn_gera_valor_aleatorio_entre(0, 11) - 1 INTO nota;
--   -- RAISE NOTICE '%', nota;
--   WHILE nota >= 0 LOOP
--     -- exibir a nota
--     RAISE NOTICE 'A nota é %', nota;
--     -- acumular o valor gerado na variável média
--      media := media + nota;
--     -- contar mais um
--     contador := contador + 1;
--     -- gerar outro valor, atualizando a variável nota, garantindo a eventual saida
--     SELECT fn_gera_valor_aleatorio_entre(0, 11) - 1 INTO nota;
--   END LOOP;
--   -- se pelo menos uma nota tiver sido gerada, calcular a media
--   IF contador >= 1 THEN
--     media := media / contador;
--     RAISE NOTICE 'Media: %', media;
--   --senão, informar que nenhuma nota foi gerada
--   ELSE
--     RAISE NOTICE 'Nao temos media, nenhuma nota gerada';
--   END IF;
-- END;
-- $$

-- DO $$
-- DECLARE
--   i INT;
--   j INT;
-- BEGIN
--   i := 0;
--   <<externo>>
--   LOOP
--     i := i + 1;
--     EXIT WHEN i > 10;
--     j := 1;
--     <<interno>>
--     LOOP
--       RAISE NOTICE '% %', i, j;
--       j := j + 1;
--       EXIT WHEN j > 10;
--       EXIT externo WHEN j > 5;
--     END LOOP;
--   END LOOP;
-- END;
-- $$

-- --vejamos como funciona a instrução continue
-- DO $$
-- DECLARE
--   contador INT := 1;
-- BEGIN
--   LOOP
--     contador := contador + 1;
--     EXIT WHEN contador > 100;
--     IF contador % 7 = 0 THEN
--       --ignore o restante da iteração atual
--       CONTINUE;
--     END IF;

--     --ignorar os valores 11, 22, 33 usando case/when

--     --também dá para fazer assim
--     CONTINUE WHEN contador % 11 = 0;

--     RAISE NOTICE 'Contador: %', contador; 
--   END LOOP;
-- END;
-- $$


--contando de a 1 a 10
--saída com if/exit
-- DO $$
-- DECLARE
--  contador INT := 1;
-- BEGIN
--   LOOP
--     RAISE NOTICE '%', contador;
--     contador := contador + 1;
--     EXIT WHEN contador > 10;
--     -- IF contador > 10 THEN
--     --   EXIT;
--     -- END IF;
--   END LOOP;
-- END;
-- $$


-- loop simples
-- DO $$
-- BEGIN
--   LOOP
--     RAISE NOTICE 'Teste loop simples...';
--   END LOOP;
-- END;
-- $$




-- -- Active: 1714478873185@@127.0.0.1@5432
-- CREATE DATABASE "20241_fatec_ipi_pbdi_repeticao";

-- CREATE OR REPLACE FUNCTION fn_gera_valor_aleatorio_entre (lim_inferior INT, lim_superior
-- INT) RETURNS INT AS
-- $$
-- BEGIN
-- RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
-- END;
-- $$ LANGUAGE plpgsql;