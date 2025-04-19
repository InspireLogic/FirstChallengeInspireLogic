# Projeto com Docker: Node.js + PostgreSQL + Portainer



API	http://localhost:3000
Banco	localhost:3306 (MySQL)	
Portainer	http://localhost:9000	

# 🚀 FirstChallengeInspireLogic

API Node.js, banco de dados MySQL e painel de controle via Portainer. O ambiente é totalmente containerizado com Docker e Docker Compose.

---


## estrutura relevante para os containers

<pre>```bash

FirstChallengeInspireLogic/
│
├── .idea/                            # Configurações do IDE (geralmente WebStorm ou PhpStorm)
├── Api/
│   ├── src/                          # Código-fonte da API
│   ├── .env-example                  # Exemplo do .env para referência
│   ├── .gitignore                   
│   ├── package.json
│   └── package-lock.json
│
├── DatabaseScript/                  # Scripts de banco de dados 
│
├── Dockers/
│   ├── api/
│   │   ├── node_modules/            # Dependências do Node.js
│   │   ├── dockerfile
│   │   ├── index.js                
│   │   └── package.json
│   ├── .env                         
│   ├── .env-example
│   ├── .gitignore                   
│   ├── docker-compose.yml
│   └── readme.md
│
├── mobile/                          
│
├── Brief.md
├── BriefPt.md
├── estrutura_api.md
├── package.json
├── package-lock.json
├── README.md
└── TasksModelsGPT.md</pre>


---

## 🧪 Pré-requisitos

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- (Opcional) [VS Code + extensão Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

---

## ⚙️ Configuração

### 1. Clone o repositório


git clone https://github.com/InspireLogic/FirstChallengeInspireLogic.git
cd FirstChallengeInspireLogic


# Crie um arquivo .env na raiz do projeto (ao lado do docker-compose.yml) com o seguinte conteúdo:

DB_USER=root #usuário banco de dados
DB_HOST=localhost #host do banco de dados
DB_PASSWORD=pizza #sua senha do mysql
DB_NAME=artic_travels # nome do banco de dados
DB_PORT=3306

# 🐳 Subindo os serviços

# Execute o seguinte comando a partir da raiz do projeto:


docker-compose up --build -d


# Esse comando irá:

    Construir a imagem da API com base no Dockerfile em Dockers/api/

    Subir o banco de dados MySQL

    Iniciar o Portainer para monitoramento

# serviços iniciados: api, db, portainer

    API:	http://localhost:3000	
    Banco:	localhost:3306 (MySQL)	
    Portainer:	http://localhost:9000	

# Subir os containers

    docker-compose up --build

# Derrubar os containers

    docker-compose down

# Acessar o terminal do container da API

    docker exec -it firstchallengeinspirelogic-api-1 sh

# Limpeza (caso algo dê errado)

    docker-compose down -v --remove-orphans
    docker system prune -a