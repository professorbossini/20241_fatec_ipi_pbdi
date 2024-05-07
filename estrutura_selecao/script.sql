-- Active: 1714478873185@@127.0.0.1@5432@20241_fatec_ipi_pbdi_selecao@public
DO $$
DECLARE
  valor INT := fn_gera_valor_aleatorio_entre(1, 12);
  mensagem VARCHAR(200);
BEGIN
  RAISE NOTICE 'Valor gerado: %', valor;
  CASE valor
    WHEN 1, 3, 5, 7, 9 THEN
      mensagem := 'Ímpar';
    WHEN 2, 4, 8, 10 THEN
      mensagem := 'Par';
    ELSE
      mensagem := 'Fora do intervalo';
  END CASE;
  RAISE NOTICE 'O valor é %', mensagem;
END;
$$






-- IF/ELSIF/ELSE
-- DO $$ DECLARE 
-- 	a INT := fn_gera_valor_aleatorio_entre (0, 20);
-- 	b INT := fn_gera_valor_aleatorio_entre (0, 20);
-- 	c INT := fn_gera_valor_aleatorio_entre (0, 20);
-- 	delta NUMERIC(10, 2);
-- 	raizUm NUMERIC(10, 2);
-- 	raizDois NUMERIC(10, 2);
-- BEGIN
-- 	RAISE NOTICE '%x% + %x + % = 0', a, U&'\00B2', b, c;
-- 	IF a = 0 THEN RAISE NOTICE 'Não vai rolar, não é de segundo grau';
-- 	ELSE delta := (b ^ 2) - (4 * a * c);
-- 	IF delta > 0 THEN raizUm := (b * -1 + |/ delta) / (2 * a);
-- 	raizDois := (b * -1 - |/ delta) / (2 * a);
-- 	RAISE NOTICE 'Duas raizes: % e %', raizUm, raizDois;
-- 	ELSEIF delta = 0 THEN raizUm := (b * -1 + |/ delta) / (2 * a);
-- 	RAISE NOTICE 'Uma raiz: %', raizUm;
-- 	ELSE RAISE NOTICE 'Sem raiz';
-- END
-- 	IF;
-- END
-- 	IF;
-- END;
-- $$
-- 	--IF/ELSE: Verificar a paridade de um número
	-- DO $$
	--   DECLARE
	--     valor INT := fn_gera_valor_aleatorio_entre(1, 100);
	--   BEGIN
	--     RAISE NOTICE 'O valor gerado foi %', valor;
	--     IF valor % 2 BETWEEN SYMMETRIC 0 AND 0 THEN
	--       RAISE NOTICE 'O valor % é par', valor;
	--     ELSE
	--       RAISE NOTICE 'O valor % é ímpar', valor;
	--     END IF;
	--   END;
	-- $$
	--IF: gerar um valor aleatório entre 1 e 100 e exibir a metade dele se ele for menor do que 20
	-- DO $$ DECLARE
	-- 	valor INT;
	-- BEGIN
	-- 	valor := fn_gera_valor_aleatorio_entre (1, 100);
	-- 	RAISE NOTICE 'O valor gerado é %', valor;
	--   --reescrever usando o predicado between
	--   --reescrever usando NOT BETWEEN
	--   IF valor NOT BETWEEN 21 AND 100 THEN
	--   -- IF valor BETWEEN 1 AND 20 THEN
	-- 	-- IF valor <= 20 THEN
	--   RAISE NOTICE 'A metade do valor % é %',
	-- 	valor,
	-- 	valor / 2::FLOAT;
	-- END
	-- 	IF;
	-- END;
	-- $$
	-- DO $$
	--   DECLARE
	--     valor INT;
	--   BEGIN
	--     valor := fn_gera_valor_aleatorio_entre(1, 100);
	--     RAISE NOTICE 'O valor gerado é %', valor;
	--     IF valor <= 20 THEN
	--       RAISE NOTICE 'A metade do valor % é %', valor, valor / 2::FLOAT;
	--     END IF;
	--   END;
	-- $$
	-- CREATE OR REPLACE FUNCTION
	--   fn_gera_valor_aleatorio_entre(
	--     lim_inferior INT,
	--     lim_superior INT
	--   ) RETURNS INT AS $$
	--   BEGIN
	--   -- 13 e 17
	--   -- RANDOM() --0 <= RANDOM() < 1
	--   --13 + RANDOM() * 4
	--     RETURN lim_inferior +
	--       FLOOR(RANDOM() * (lim_superior - lim_inferior + 1))::INT;
	--   END;
	--   $$ LANGUAGE plpgsql;
	--   0,5 = 0
	--   1,2 = 1
	--   2,01 = 2
	--   1 * 10 = 10
	--   0 * 10 = 0
	--   0,2 * 10 = 2
	--   0,5 * 10 = 5
