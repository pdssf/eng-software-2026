# Reprodução dos Experimentos de Detecting False Alarms from Automatic Static Analysis Tools: How Far are We?

Este repositório contém os artefatos utilizados para reprodução parcial dos experimentos realizados no artigo [Detecting False Alarms from Automatic Static Analysis Tools: How Far are We?](https://arxiv.org/pdf/2202.05982).

## Estruturas de pastas

- `data` contém os dados utilizados para execução dos experimentos.
- `src` contém os scripts usados para gerar os resultados dos experimentos. `run.sh` executa todos os experimentos e salva os resultados em arquivos de logs. Depois gera arquivos CSV correspondentes às tabelas reportadas no artigo.
- `logs` contém as saídas de todos os experimentos executados. As métricas de precisão, recall, F1 e AUC são extraídas do final destes arquivos. O repositório já contém os logs da última execução.
- `tables` contém os arquivos CSV correspondentes às tabelas do artigo gerados a partir das métricas extraídas dos arquivos de log. O repositório já contém as tabelas geradas na última execução.

## Execução

O repositório contém um arquivo `Dockerfile` para facilitar a execução dos experimentos.

1. Construa a imagem docker: `docker build -t es-experiment`
2. Inicie um container:

```bash
docker create --name es-experiment es-experiment
docker start -a es-experiment
```

3. Copie os resultados para a sua máquina:

```bash
podman cp es-experiment:/experiment/logs ./logs
podman cp es-experiment:/experiment/tables ./tables
```

### Execução Local

Alternativamente, você pode executar os experimentos localmente. Você precisará de python versão 3.12. Em uma máquina Linux ou MacOS, execute os segundos comandos no diretório raiz do repositório:

1. Crie um ambiente virtual: `python3 -m venv .venv`
2. Ative o ambiente virtual: `source .venv/bin/activate`
3. Instale as dependências: `pip install -r requirements.txt`
4. Navegue para o diretório `src`: `cd src`
5. Conceda permissão de execução ao script `run.sh`: `chmod +x run.sh`
6. Execute o script: `./run.sh`

Após o término da execução, os logs estarão no diretório [logs](logs) e as tabelas no diretório [tables](tables).
