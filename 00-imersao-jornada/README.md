# 🚀 Projeto Jornada de Dados - Imersão Completa

## 📋 Sobre o Projeto

Este é o **projeto prático da Imersão Jornada de Dados**, uma experiência completa de 4 dias onde você vai construir um projeto real de dados, do zero à decisão com IA.

**Em 4 dias, você vai aprender:**
- **Dia 1:** SQL & Analytics
- **Dia 2:** Python & Ingestão de Dados
- **Dia 3:** Engenharia de Dados
- **Dia 4:** Inteligência Artificial

---

## 🎯 O Projeto

Uma empresa de e-commerce está abrindo sua operação digital e precisa usar dados para tomar decisões melhores. Você vai construir um sistema completo de dados que:

- ✅ Analisa vendas e clientes
- ✅ Compara preços com o mercado
- ✅ Gera insights inteligentes
- ✅ Toma decisões baseadas em dados

**Não é um exercício. É um projeto de mercado.**

---

Download dos arquivos das aulas: [Drive](https://drive.google.com/drive/folders/1ov9F7bYVJyDDBy2Xn4HDYSycTuZAfpWu?usp=sharing)
---

## 📚 As 4 Aulas da Imersão

### 📊 Dia 1: SQL & Analytics
**Objetivo:** Entender o negócio com SQL

- Descobrir os produtos mais vendidos
- Identificar os principais clientes
- Comparar preços com o mercado
- Criar segmentações de clientes

**O que você aprende:** A pensar como analista de dados usando SQL.

**Material:** [Aula 1 - SQL & Analytics](./aulas/aula-01-sql/)

---

### 🐍 Dia 2: Python & Ingestão de Dados
**Objetivo:** Dados não nascem prontos

- Ler dados de CSVs e combinar múltiplos arquivos
- Consumir APIs REST para buscar dados externos
- Fazer web scraping para coletar dados de sites
- Conectar com bancos de dados (SQLite, PostgreSQL)
- Tratar e limpar dados inconsistentes
- Exportar dados para diferentes formatos

**O que você aprende:** A pensar como engenheiro de dados usando Python para integrar diferentes fontes de dados.

**Entrega do dia:** Scripts Python que coletam, tratam e exportam dados de múltiplas fontes.

**Material:** [Aula 2 - Python & Ingestão](./aulas/aula-02-python/)

---

### ⚙️ Dia 3: Engenharia de Dados
**Objetivo:** Transformar scripts em produto

- Arquitetura de dados
- Modelagem analítica
- Pipelines e orquestração

**Frase-chave:** Dados bons precisam escalar.

**Material:** [Aula 3 - Engenharia de Dados](./aulas/aula-03-engenharia/) *(em breve)*

---

### 🤖 Dia 4: Claude Code & Python
**Objetivo:** Levar os dados até quem toma decisão

- Dashboard Streamlit para 3 diretores (Comercial, CS, Pricing)
- Agente de IA que gera relatórios diários às 8h da manhã
- Claude Code como ferramenta de desenvolvimento assistido

**Frase-chave:** Pipeline sem consumo não gera valor.

**Material:** [Aula 4 - Claude Code & Python](./aulas/aula-04-claude-code/)

---

## 🎲 Os 4 Datasets do Projeto

Este projeto usa **4 datasets sintéticos** gerados com Faker para simular dados reais de e-commerce:

- **`produtos.csv`** - 200 produtos do catálogo
- **`clientes.csv`** - 50 clientes cadastrados
- **`vendas.csv`** - ~3.000 vendas (últimos 30 dias)
- **`preco_competidores.csv`** - ~680 preços de concorrentes

**Características:**
- Dados realistas (não aleatórios)
- Distribuições não-normais (como dados reais)
- Relacionamentos entre tabelas
- Problemas de integridade para prática (produtos não vendidos, vendas não cadastradas)

---

## 🚀 Como Começar

### Passo 1: Gerar os Datasets

```bash
# Instalar dependências
pip install faker

# Gerar os CSVs
python generate_datasets.py
```

Os arquivos serão criados na pasta `data/`:
- `produtos.csv`
- `clientes.csv`
- `vendas.csv`
- `preco_competidores.csv`

---

### Passo 2: Começar a Aula 1

Siga as instruções completas em: **[Aula 1 - SQL & Analytics](./aulas/aula-01-sql/README.md)**

**Resumo rápido:**
1. Importe os CSVs em um banco SQL (SQLite ou PostgreSQL)
2. Execute os 9 exemplos SQL em ordem (`exemplo-01` a `exemplo-09`)
3. Responda as perguntas de negócio

---

## 📊 Estrutura dos Datasets

### produtos.csv
```
id_produto, nome_produto, categoria, marca, preco_atual, data_criacao
```

**Exemplos de produtos:**
- Smartphone Galaxy A54
- Panela de Pressão
- Tênis Nike Air Max
- TV LED 50 Polegadas

**Total:** 200 produtos

---

### clientes.csv
```
id_cliente, nome_cliente, estado, pais, data_cadastro
```

**Nota:** A segmentação de clientes (VIP, TOP_TIER, REGULAR) deve ser criada usando CASE WHEN baseado no comportamento de compra (receita total). Isso faz parte do aprendizado do Dia 1!

**Total:** 50 clientes

---

### vendas.csv
```
id_venda, data_venda, id_cliente, id_produto, canal_venda, quantidade, preco_unitario
```

**Cálculo importante:**
- Receita da venda = `quantidade × preco_unitario`

**Total:** ~3.000 vendas (últimos 30 dias)

---

### preco_competidores.csv
```
id_produto, nome_concorrente, preco_concorrente, data_coleta
```

**Concorrentes monitorados:**
- Mercado Livre
- Amazon
- Magalu
- Shopee

**Total:** ~680 registros (1 coleta por produto/concorrente)

---

## 🗄️ Esquema das Tabelas Principais

### 📦 produtos (Produtos)

| Coluna | Tipo | Descrição | Exemplo |
|--------|------|-----------|---------|
| `id_produto` | TEXT (PK) | ID único do produto | `prd_20d170bd9bf7` |
| `nome_produto` | TEXT | Nome do produto | `Smartphone Galaxy A54` |
| `categoria` | TEXT | Categoria do produto | `Eletrônicos`, `Casa`, `Cozinha` |
| `marca` | TEXT | Marca do produto | `Sony`, `Samsung`, `Apple` |
| `preco_atual` | REAL | Preço atual (R$) | `73.99` |
| `data_criacao` | TEXT | Data de criação (ISO) | `2022-03-19 15:57:18` |

**Total de registros:** 200 produtos

---

### 👥 clientes (Clientes)

| Coluna | Tipo | Descrição | Exemplo |
|--------|------|-----------|---------|
| `id_cliente` | TEXT (PK) | ID único do cliente | `cus_c6a2c1df9a70` |
| `nome_cliente` | TEXT | Nome completo do cliente | `João Gabriel da Paz` |
| `estado` | TEXT | Estado (UF) | `SP`, `RJ`, `MG` |
| `pais` | TEXT | País | `Brasil` |
| `data_cadastro` | TEXT | Data de cadastro (ISO) | `2024-02-17 10:57:18` |

**Total de registros:** 50 clientes

**Nota:** A segmentação de clientes (VIP, TOP_TIER, REGULAR) deve ser criada usando CASE WHEN baseado no comportamento de compra. Veja `aulas/aula-01-sql/exemplo-07-case-when.sql` para aprender `CASE WHEN` e o modelo dbt `aulas/aula-03-dbt/models/gold/customer_success/clientes_segmentacao.sql` para a segmentação completa.

---

### 💰 vendas (Vendas)

| Coluna | Tipo | Descrição | Exemplo |
|--------|------|-----------|---------|
| `id_venda` | TEXT (PK) | ID único da venda | `sal_f2414a3f34b6` |
| `data_venda` | TEXT | Data e hora da venda (ISO) | `2025-12-13 13:15:07` |
| `id_cliente` | TEXT (FK) | ID do cliente | `cus_63ade3c52c55` |
| `id_produto` | TEXT (FK) | ID do produto | `prd_91f3a368678f` |
| `canal_venda` | TEXT | Canal de venda | `ecommerce`, `loja_fisica` |
| `quantidade` | INTEGER | Quantidade vendida | `1`, `2`, `3` |
| `preco_unitario` | REAL | Preço unitário da venda (R$) | `116.99` |

**Total de registros:** ~3.000 vendas (últimos 30 dias)

**Relacionamentos:**
- `id_cliente` → `clientes.id_cliente`
- `id_produto` → `produtos.id_produto`

**Cálculo importante:**
- Receita da venda = `quantidade × preco_unitario`

---

### 🏪 preco_competidores (Preços de Concorrentes)

| Coluna | Tipo | Descrição | Exemplo |
|--------|------|-----------|---------|
| `id_produto` | TEXT (FK) | ID do produto | `prd_20d170bd9bf7` |
| `nome_concorrente` | TEXT | Nome do concorrente | `Mercado Livre`, `Amazon`, `Magalu`, `Shopee` |
| `preco_concorrente` | REAL | Preço do concorrente (R$) | `72.51` |
| `data_coleta` | TEXT | Data da coleta (ISO) | `2026-01-08 14:38:10` |

**Total de registros:** ~680 registros

**Relacionamentos:**
- `id_produto` → `produtos.id_produto`

**Concorrentes:**
- Mercado Livre
- Amazon
- Magalu
- Shopee

**Característica especial:**
- Cada combinação `id_produto + nome_concorrente` é única (1 coleta por produto/concorrente)

---

## 🔗 Diagrama de Relacionamentos

```
┌─────────────┐
│  clientes   │
│             │
│ id_cliente  │◄─────┐
│    ...      │      │
└─────────────┘      │
                     │
┌─────────────┐      │      ┌─────────────┐
│  produtos   │      │      │   vendas    │
│             │      │      │             │
│ id_produto  │◄─────┼──────┤ id_cliente  │
│    ...      │      │      │ id_produto  │
└─────────────┘      │      │    ...      │
      │              │      └─────────────┘
      │              │
      │              │
      ▼              │
┌─────────────────┐  │
│preco_competidores│ │
│                 │  │
│   id_produto    │──┘
│ nome_concorrente│
│    ...          │
└─────────────────┘
```

---

## 🎯 Perguntas de Negócio que Vamos Responder

Este projeto foi criado para responder perguntas reais de negócio usando dados. Abaixo estão todas as perguntas que podemos responder:

### 📊 Análise de Produtos

1. **Quais produtos temos no catálogo?**
2. **Quais são os produtos mais caros?**
3. **Quais produtos nunca foram vendidos?**
4. **Quais são os produtos mais vendidos?**
5. **Qual é a distribuição de produtos por categoria?**

### 💰 Análise de Vendas

6. **Qual é o total de vendas e receita?**
7. **Qual é a distribuição de receita por canal de venda?**
8. **Quais são as vendas por período?**
9. **Quais vendas foram feitas de produtos não cadastrados?**

### 👥 Análise de Clientes

10. **Quem são nossos clientes?** (criar segmentação usando CASE WHEN)
11. **Quais clientes compram mais?**
12. **Quais clientes nunca compraram?**

### 🏪 Análise Competitiva

13. **Quais produtos estão mais caros que os concorrentes?**
14. **Quais produtos estão mais baratos no concorrente?**
15. **Qual é a diferença percentual entre nossos preços e dos concorrentes?**
16. **Quais produtos top sellers estão mais caros que todos os concorrentes?**

### 📈 Análises Avançadas

17. **Qual é a receita total por categoria?**
18. **Quais categorias geram mais de R$ 50.000 em receita?**
19. **Qual é o ticket médio por segmento de cliente?**
20. **Quais produtos têm preço acima da média geral?**
21. **Quais produtos estão mais caros que a média dos concorrentes?**

---

## 📚 Estrutura do Projeto

```
Projeto-Jornada-De-Dados/
├── data/                          # CSVs gerados
│   ├── produtos.csv
│   ├── clientes.csv
│   ├── vendas.csv
│   └── preco_competidores.csv
├── generate_datasets.py          # Gerador de dados sintéticos
├── aulas/
│   ├── aula-01-sql/              # Dia 1: SQL & Analytics
│   │   ├── exemplo-01 … exemplo-09-*.sql  # 9 exemplos SQL progressivos
│   │   ├── README.md             # Guia completo do Dia 1
│   │   └── KPIS.md               # KPIs e perguntas de negócio
│   ├── aula-02-python/           # Dia 2: Python & Ingestão (em breve)
│   ├── aula-03-engenharia/       # Dia 3: Engenharia de Dados (em breve)
│   └── aula-04-claude-code/      # Dia 4: Claude Code & Python
└── README.md                      # Este arquivo
```

---

## ⚙️ Configurações do Gerador

Você pode ajustar as constantes no início do arquivo `generate_datasets.py`:

```python
N_PRODUCTS = 200          # Quantidade de produtos
N_CUSTOMERS = 50         # Quantidade de clientes
DAYS = 30                # Dias de vendas
SALES_PER_DAY = 100      # Vendas por dia
TOP_PRODUCTS = 30        # Produtos "top sellers"
```

**Nota:** A segmentação de clientes (VIP, TOP_TIER, REGULAR) não é gerada automaticamente. Ela deve ser criada usando CASE WHEN baseado no comportamento de compra (receita total). Isso faz parte do aprendizado do Dia 1!

---

## 🎲 Características dos Dados

### Distribuições Realistas (Não-Normais)

- **Produtos:** 30 produtos "top sellers" vendem muito mais
- **Clientes:** Todos os clientes têm peso igual na geração (segmentação será criada depois com CASE WHEN)
- **Preços:** Distribuídos em buckets (R$ 29,90 a R$ 1.499,90)
- **Quantidades:** Maioria compra 1 unidade (72%), poucos compram mais
- **Horários:** Picos em manhã (8-12h) e tarde (15-19h)
- **Canais:** 72% ecommerce, 28% loja física
- **Promoções:** 55% sem desconto, 45% com desconto (5% a 15%)
- **Concorrentes:** Nem todos têm preço para todos os produtos (85% de cobertura)
- **Tênis:** Produtos de tênis são os menos vendidos e têm preço o dobro dos concorrentes

---

## 🔧 Seed e Reproducibilidade

O script usa `SEED = 42` para garantir que os dados gerados sejam sempre os mesmos (reproducibilidade).

Para gerar dados diferentes, altere o `SEED` ou remova a linha `random.seed(SEED)`.

---

## 📝 Notas Técnicas

- **Encoding:** UTF-8
- **Separador:** Vírgula (CSV padrão)
- **Datas:** Formato ISO (YYYY-MM-DD HH:MM:SS)
- **Preços:** 2 casas decimais (R$)
- **IDs:** UUIDs curtos (prefixo + 12 caracteres hex)
- **Nomes de produtos:** Produtos brasileiros reais (ex: "Smartphone Galaxy A54", "Panela de Pressão")

---

## ✅ Validação

Após gerar, o script imprime um resumo:

```
✅ CSVs gerados com sucesso:
- data/produtos.csv           (products=200 | top_sellers=30)
- data/clientes.csv            (customers=50)
- data/vendas.csv              (sales=3000 | ~100/dia por 30 dias)
- data/preco_competidores.csv  (rows=680 | competitors=4)
```

**Nota:** A segmentação de clientes deve ser criada usando CASE WHEN baseado no comportamento de compra.

---

## 🐛 Troubleshooting

**Erro: "ModuleNotFoundError: No module named 'faker'"**
```bash
pip install faker
```

**Erro: "Permission denied" ao criar pasta data/**
```bash
mkdir -p data
chmod 755 data
```

---

## 🚀 Próximos Passos

### Para Começar a Imersão:

1. **Gere os datasets:** Execute `python generate_datasets.py`
2. **Comece o Dia 1:** Siga as instruções em [Aula 1 - SQL & Analytics](./aulas/aula-01-sql/README.md)
3. **Execute os exemplos:** 9 exemplos SQL em ordem progressiva
4. **Avance para Dia 2:** Python & Ingestão de Dados

---

## 🎯 Resultado Final da Imersão

Ao final dos 4 dias, você terá:

✅ **Projeto real no GitHub**  
✅ **SQL aplicado a negócio**  
✅ **Pipeline de dados funcionando**  
✅ **IA interpretando dados e gerando insights**  

**Isso é o que o mercado procura.**

---

## 💡 Frase de Ouro

> **"Você não vai aprender ferramentas. Você vai aprender como dados resolvem problemas reais."**

Cada query, cada script, cada pipeline que você construir deve responder uma pergunta de negócio. Sempre pergunte: **"Por que isso importa?"**

---

## 📚 Material de Apoio

- **[Aula 1 - SQL & Analytics](./aulas/aula-01-sql/README.md)** - Guia completo do primeiro dia
- **[KPIs da Aula 1](./aulas/aula-01-sql/KPIS.md)** - Lista completa de KPIs e perguntas

---

**Boa jornada! 🚀**
