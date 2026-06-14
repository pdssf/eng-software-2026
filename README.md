# Reprodução dos Experimentos de Detecting False Alarms from Automatic Static Analysis Tools: How Far are We?

Este repositório contém os artefatos utilizados para reprodução parcial dos experimentos realizados no artigo [Detecting False Alarms from Automatic Static Analysis Tools: How Far are We?](https://arxiv.org/pdf/2202.05982) e um experimento adicional utilizando o SpotBugs em revisões mais recentes de um subconjunto dos projetos utilizados no artigo.

## Estruturas de pastas e contribuições

- `classification`: contém os artefatos utilizados pelos experimentos do artigo. Estes foram, em maior parte, extraídos do [repositório](https://github.com/soarsmu/SA_retrospective) disponibilizado pelos autores e ajustados para resolver problemas encontrados na execução e imprimir resultados mais detalhados. Além disso, foram adicionados um utilitário para geração das tabelas reportadas no artigo e os arquivos `requirements.txt` e `Dockerfile` para facilitar reprodução dos experimentos em um ambiente isolado.
  - `findbugs-xml-reports`: contém os bugs reportados pela execução do FindBugs em revisões dos projetos utilizados nos experimentos.
  - `data`: contém dados extraídos dos reportes do FindBugs sobre os bugs encontrados nas revisões dos projetos, como os valores computados das "Golden features". Estes são os dados utilizados pelos modelos de classificação dos bugs.
  - `src`: contém os scripts usados para gerar os resultados dos experimentos. `run.sh` executa todos os experimentos e salva os resultados em arquivos de logs. Depois gera arquivos CSV correspondentes às tabelas reportadas no artigo.
  - `logs`: contém as saídas de todos os experimentos executados. As métricas de precisão, recall, F1 e AUC são extraídas do final destes arquivos. O repositório já contém os logs da última execução.
  - `tables`: contém os arquivos CSV correspondentes às tabelas do artigo gerados a partir das métricas extraídas dos arquivos de log. O repositório já contém as tabelas geradas na última execução.
- `stats`: contém os artefatos utilizados pelo experimento adicional. Este experimento consiste da execução do SpotBugs (sucessor do FindBugs) em 6 revisões dos últimos 7 anos de 7 dos 9 projetos originais utilizados pelo artigo. Desta execução, são extraídas contagens de bugs agregadas por diferentes atributos e contagem de bugs acionáveis por revisão de acordo com a heurística de __closed-warning__ (definida pelo artigo) utilizando cada outra revisão futura como referência.
  - `mining`: contém os scripts utilizados para recuperar 6 revisões de 7 projetos, executar os builds e coletar os resultados do SpotBugs para cada revisão.
  - `data`: contém, para cada projeto analisado, um diretório com um arquivo `commits.txt` com os hashes dos commits das revisões utilizadas para este projeto (ordenados do mais recente para o mais antigo) e um arquivo XML para cada revisão com a saída do SpotBugs para o build correspondente.
  - `src`: contém os scripts utilizados para interpretar as saídas do SpotBugs e computar estatísticas relacionadas.
  - `tables`: contém, para cada projeto analisado, diversos arquivos CSV com estatísticas extraídas das saídas do SpotBugs.
    - `[projeto]/counts`: contém, para cada revisão do projeto, cinco arquivos CSV com a contagem de bugs por: categoria, tipo, classe, método e campo.
    - `common.csv`: arquivo CSV com a contagem de bugs em comum entre cada par de revisões do projeto.

## Execução

O repositório contém três arquivos `Dockerfile` para facilitar a execução dos experimentos. Um em `classification` para a reprodução dos experimentos de classificação do artigo, um em `stats/mining` para a mineração dos dados usados pelo experimento com SpotBugs e um em `stats` para o experimento com SpotBugs.

### Experimento de classificação

1. Construa a imagem docker em `classification`:

```bash
cd classification
docker build -t es-classification .
```

2. Inicie um container:

```bash
docker create --name es-classification es-classification
docker start -a es-classification
```

3. Copie os resultados para a sua máquina:

```bash
podman cp es-classification:/experiment/logs ./logs
podman cp es-classification:/experiment/tables ./tables
```

#### Execução Local

Alternativamente, você pode executar os experimentos localmente. Você precisará de python versão 3.12. Em uma máquina Linux ou MacOS, execute os seguintes comandos no diretório `classification`:

1. Crie um ambiente virtual: `python3 -m venv .venv`
2. Ative o ambiente virtual: `source .venv/bin/activate`
3. Instale as dependências: `pip install -r requirements.txt`
4. Navegue para o diretório `src`: `cd src`
5. Conceda permissão de execução ao script `run.sh`: `chmod +x run.sh`
6. Execute o script: `./run.sh`

Após o término da execução, os logs estarão no diretório [logs](logs) e as tabelas no diretório [tables](tables).

### Experimento com SpotBugs

1. Construa a imagem docker em `stats`:

```bash
cd stats
docker build -t es-stats .
```

2. Inicie um container:

```bash
docker create --name es-stats es-stats
docker start -a es-stats
```

3. Copie os resultados para a sua máquina:

```bash
docker cp es-stats:/experiment/tables ./tables
```

#### Mineração de dados

Se desejar coletar novos dados para o experimento, utilize o `Dockerfile` em [`mining`](stats/mining). É importante levar em consideração que versões mais atuais dos projetos podem exigir requisitos diferentes para o build. Nesse caso, pode ser necessário atualizar alguns dos scripts de execução do SpotBugs (em [`stats/mining/scripts/spotbugs/`](stats/mining/scripts/spotbugs)).

1. Construa a imagem docker em `mining`:

```bash
cd mining
docker build -t es-stats-mining .
```

2. Inicie um container:

```bash
docker create --name es-stats-mining es-stats-mining
docker start -a es-stats-mining
```

3. Copie os resultados para a sua máquina:

```bash
docker cp es-stats-mining:/data ../data
```
