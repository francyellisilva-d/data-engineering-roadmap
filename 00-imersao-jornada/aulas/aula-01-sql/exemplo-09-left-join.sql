-- ============================================
-- EXEMPLO 09: LEFT JOIN - Quem ficou de fora?
-- ============================================
-- Conceito: LEFT JOIN mantém TODAS as linhas da tabela da esquerda, mesmo sem par na direita
--           COALESCE troca NULL por um valor padrão (ex: 0)
-- Pergunta de negócio: Existem produtos que nunca venderam? Clientes que nunca compraram?
--                      Existem vendas de produtos que não estão no catálogo?
-- Conexão com dbt: gold precos_competitividade faz LEFT JOIN com vendas_por_produto
--                  e usa COALESCE(receita_total, 0) para produtos sem venda
--                  gold clientes_segmentacao faz LEFT JOIN vendas + silver_clientes

-- ============================================
-- 1. INNER JOIN x LEFT JOIN: a diferença na prática
-- ============================================
-- INNER JOIN só devolve as linhas que têm par nas DUAS tabelas
-- LEFT JOIN devolve TODAS as linhas da esquerda (produtos)
-- Quando não existe venda, as colunas de vendas vêm como NULL

SELECT
    'INNER JOIN' AS tipo_join,
    COUNT(DISTINCT p.id_produto) AS total_produtos
FROM produtos p
INNER JOIN vendas v
    ON p.id_produto = v.id_produto

UNION ALL

SELECT
    'LEFT JOIN' AS tipo_join,
    COUNT(DISTINCT p.id_produto) AS total_produtos
FROM produtos p
LEFT JOIN vendas v
    ON p.id_produto = v.id_produto;

-- O LEFT JOIN traz mais produtos: a diferença são os produtos que nunca venderam
-- (UNION ALL só empilha os dois resultados para comparar lado a lado)


-- ============================================
-- 2. Produtos que nunca venderam
-- ============================================
-- Padrão clássico: LEFT JOIN + WHERE coluna_da_direita IS NULL
-- Se v.id_venda é NULL, é porque o produto não encontrou nenhuma venda

SELECT
    p.id_produto,
    p.nome_produto,
    p.categoria,
    p.preco_atual
FROM produtos p
LEFT JOIN vendas v
    ON p.id_produto = v.id_produto
WHERE v.id_venda IS NULL
ORDER BY p.categoria, p.nome_produto;


-- ============================================
-- 3. Clientes que nunca compraram
-- ============================================
-- Mesmo padrão, agora com a tabela clientes à esquerda
-- Se o resultado vier vazio, também é uma resposta: todo cliente cadastrado já comprou!

SELECT
    c.id_cliente,
    c.nome_cliente,
    c.estado,
    c.data_cadastro
FROM clientes c
LEFT JOIN vendas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venda IS NULL
ORDER BY c.data_cadastro;


-- ============================================
-- 4. Qualidade de dados: vendas de produtos fora do catálogo
-- ============================================
-- Invertendo a ordem: agora vendas fica à esquerda
-- Se p.id_produto é NULL, a venda aponta para um produto que não existe em produtos
-- Com INNER JOIN (exemplo 06) essas vendas SOMEM sem avisar!

SELECT
    v.id_produto,
    COUNT(*) AS total_vendas,
    SUM(v.quantidade * v.preco_unitario) AS receita_total
FROM vendas v
LEFT JOIN produtos p
    ON v.id_produto = p.id_produto
WHERE p.id_produto IS NULL
GROUP BY v.id_produto
ORDER BY receita_total DESC;


-- ============================================
-- 5. Receita por produto, incluindo quem vendeu zero
-- ============================================
-- LEFT JOIN + GROUP BY mantém todos os produtos no relatório
-- Sem venda, SUM devolve NULL; COALESCE troca esse NULL por 0
-- É o mesmo COALESCE(receita_total, 0) do precos_competitividade no dbt

SELECT
    p.nome_produto,
    p.categoria,
    COUNT(v.id_venda) AS total_vendas,
    COALESCE(SUM(v.quantidade * v.preco_unitario), 0) AS receita_total
FROM produtos p
LEFT JOIN vendas v
    ON p.id_produto = v.id_produto
GROUP BY p.nome_produto, p.categoria
ORDER BY receita_total ASC
LIMIT 20;

-- Repare: COUNT(v.id_venda) conta só valores não nulos, então dá 0 para quem não vendeu
-- (COUNT(*) contaria a linha do produto e daria 1, o que estaria errado)


-- ============================================
-- 6. Pegadinha: filtro no WHERE x filtro no ON
-- ============================================
-- Pergunta: quantas vendas no e-commerce cada produto teve (incluindo quem teve zero)?

-- ❌ ERRADO: o filtro no WHERE descarta as linhas com NULL (canal_venda é NULL!)
--    Na prática, o LEFT JOIN vira um INNER JOIN e os produtos sem venda somem
SELECT
    COUNT(DISTINCT p.id_produto) AS total_produtos
FROM produtos p
LEFT JOIN vendas v
    ON p.id_produto = v.id_produto
WHERE v.canal_venda = 'ecommerce';

-- ✅ CERTO: o filtro no ON escolhe QUAIS vendas entram no join,
--    mas todos os produtos continuam no resultado
SELECT
    COUNT(DISTINCT p.id_produto) AS total_produtos
FROM produtos p
LEFT JOIN vendas v
    ON p.id_produto = v.id_produto
    AND v.canal_venda = 'ecommerce';
