

## REGRAS DO TESTE DE QUALIDADE.

- **Cada task vale pontos** (difícil = mais pontos).
- Quem entregar mais pontos no final dos 4 dias, ganha 🥇.
- Podem usar um board no Trello ou GitHub Projects.

---
**OBS**: 
Todas as tasks devem ser documentadas em ingles e com formato md. Recomendado o uso da biblioteca mermaid para diagramação e melhor tratamento de markdown. 

## 🔥 Tabela de Tasks por Área (com pontuação)

### **Backend (Node.js + MySQL)**

**Arquitetura MVC**
todo:
As rotas devem estar protegidas;
Autenticação com JWT.

| Task                                                  | Pontos |
|-------------------------------------------------------|--------|
Vamos calcular a pontuação total atual e adicionar as duas novas tarefas:

### Pontuação atual:
| Task                                                                 | Pontos |
|----------------------------------------------------------------------|--------|
| Criar estrutura do projeto com Express + rotas base                  | 10     |
| Criar migrations/tabelas no MySQL (`regions`, etc.)                  | 15     |
| Criar Model `UserModel`                                              | 5      |
| Criar Model `Booking`                                                | 5      |
| Criar Model `Lodging`                                                | 5      |
| Criar Model `Resorts`                                                | 5      |
| Criar rota `GET /user`                                               | 5      |
| Criar rota `GET /regions`                                            | 5      |
| Criar rota `GET /lodging`                                            | 5      |
| Criar rota `GET /resorts`                                            | 5      |
| Criar rota `POST /bookings` com validação                            | 15     |
| Criar autenticação JWT (bônus)                                       | 20     |
| Criar script de seed para povoar o banco                             | 10     |
| Criar testes com Postman/Insomnia (API testável)                     | 10     |
| Criar controllers para organizar as regras de negócio     | 10     |
| Criar middleware para autenticação e erros               | 10     |

**Total:150 pontos**

Se quiser posso gerar esse quadro em Markdown atualizado ou exportar para PDF/planilha. Deseja isso?

### **Mobile App (Flutter)**
Claro! Com base nas tarefas que você listou (que parecem focadas no front-end mobile de uma aplicação de reservas), aqui está uma sugestão organizada de **tasks para o mobile**, incluindo tarefas que talvez estejam implícitas mas são importantes para o app funcionar bem.

---

### Tasks para o mobile (React Native / Flutter / outro framework):

| Task                                                                 | Pontos |
|----------------------------------------------------------------------|--------|
| Configurar projeto mobile e navegação base                          | 5      |
| Criar tela inicial com logo e botão de login/cadastro               | 5      |
| Criar navegação entre as telas principais                           | 5      |
| Criar tela com lista de regiões (dados fixos)                       | 5      |
| Integrar tela de regiões com API (`GET /regions`)                   | 10     |
| Criar tela para selecionar hospedagem, resort e passes              | 10     |
| Buscar dados da API para hospedagem (`GET /lodging`)               | 5      |
| Buscar dados da API para resorts (`GET /resorts`)                  | 5      |
| Criar tela de resumo da reserva                                     | 10     |
| Enviar reserva para a API via `POST /bookings`                      | 15     |
| Criar tela de "minhas reservas" e integrar com API (`GET /user`)    | 15     |
| Implementar animação de carregamento ou feedback visual             | 5      |
| Criar validação de formulário nas telas de cadastro e reserva       | 5      |
| Salvar token JWT e usar nas requisições autenticadas                | 10     |
| Criar fluxo de login e cadastro com autenticação via API            | 10     |
| Tratar erros da API e exibir mensagens ao usuário                   | 5      |

**Total: 140 pontos**
Claro! Aqui está a sua **tabela original expandida para fechar 140 pontos**, seguindo o mesmo modelo e mantendo a padronização:

---

### 🌐 **Landing Page (Web) — Versão Completa com Animações e Proteções**

| Task                                                                                     | Pontos |
|------------------------------------------------------------------------------------------|--------|
| 1. Criar hero section com headline + CTA                                                 | 10     |
| 2. Implementar cards de Regions, Lodging, Resorts, Passes                                | 10     |
| 3. Criar estilo com Tailwind ou CSS responsivo                                           | 10     |
| 4. Adicionar imagens realistas (montanhas, ski, etc.)                                    | 10     |
| 5. Scroll suave entre seções (com âncoras ou JS)                                         | 5      |
| 6. Implementar botão “Book here” com destaque visual                                     | 5      |
| 7. Responsividade mobile                                                                 | 10     |
| 8. Proteger rotas internas com verificação de login                                      | 10     |
| 9. Configurar redirecionamento automático para login (não autenticado)                   | 5      |
| 10. Publicar na Vercel ou Netlify                                                        | 10     |
| 11. Animação de entrada do `Hero` com `Framer Motion` ou `AOS`                           | 10     |
| 12. Animações nos cards (hover e entrada suave)                                          | 10     |
| 13. Efeito parallax com `react-parallax` ou Tailwind `bg-fixed`                         | 10     |
| 14. Feedback visual no botão “Book here” (animação + scroll suave)                       | 5      |
| 15. Splash de carregamento com animação no logotipo (ou spinner)                         | 10     |
| 16. Microinterações: animações em botões e inputs com foco/hover                         | 5      |

 **Total: 140 pontos**
---

### **Design, Planejamento e Docs**

| Task                                                         | Pontos |
|--------------------------------------------------------------|--------|
| Criar wireframe no Figma para o app + landing                | 10     |
| Montar banco ER diagram (Diagrama Entidade-Relacionamento)   | 10     |
| Escrever README completo com instruções                      | 15     |
| Criar apresentação (Pitch final com slides ou vídeo)         | 10     |
| Criar logo ou identidade visual simples                      | 10     |

---

## 🏅 Extras (Bonus Tasks)

| Task                                            | Pontos |
|-------------------------------------------------|--------|
| 🎁 Criar modo escuro no app                     | 10     |
| 🛜 Cache local no app (Hive/SharedPrefs)        | 10     |
| 🔐 Login com validação real                     | 15     |
| 🔍 Sistema de busca nos resorts                 | 10     |
| 🌍 Deploy do backend em Railway ou Render       | 15     |

---

## 📋 Controles:

- GitHub Projects, Trello, Notion ou Linear.app.
- Cada card = uma task com pontuação
- Quem entrega primeiro e com qualidade, ganha os pontos
- "reviews" de PR como forma de validar entrega

---

# DEVOPS
---

### 🐳 **Task: Configurar Docker para API e Banco de Dados**

Perfeito! Aqui está uma versão **expandida da seção de DevOps**, totalizando **50 pontos**, com foco em Docker, Docker Compose, Portainer, e execução completa da API + banco:

---

### 🐳 **Task: Configuração DevOps com Docker**

| Task                                                                                      | Categoria | Pontos |
|-------------------------------------------------------------------------------------------|-----------|--------|
| 1. Criar `Dockerfile` para API (Node.js) com execução do `node_modules` via bind mount    | DevOps    | 10     |
| 2. Criar `Dockerfile` para o banco de dados (MySQL ou PostgreSQL)                         | DevOps    | 10     |
| 3. Criar `docker-compose.yml` para orquestrar API + Banco                                 | DevOps    | 10     |
| 4. Configurar volumes persistentes para banco de dados                                    | DevOps    | 10     |
| 5. Definir rede interna entre containers via Docker Compose                               | DevOps    | 10     |
| 6. Configurar ambiente `.env` com variáveis compartilhadas entre serviços                 | DevOps    | 10     |
| 7. Instalar e configurar o **Portainer** para gerenciamento visual dos containers         | DevOps    | 10     |
| 8. Expor portas corretamente no Docker Compose (`ports`) para acesso externo à API        | DevOps    | 10    |
| 9. Adicionar `depends_on` para garantir ordem de subida dos serviços                      | DevOps    | 10    |
| 10. Garantir que backend consegue conectar com banco (testar `GET /`)                     | DevOps     | 10  |
| 11. Documentação no `README.md` explicando:
|   - Como subir o ambiente (`docker-compose up`)
|   - Como acessar o banco de dados (`localhost:3306`, user e senha)
|   - Porta da API (`localhost:3000`, por exemplo)                | DevOps     | 10  |

### **Total: 100 Pontos**
---

#### ✅ Entregáveis:

1. `Dockerfile` para a API (`Node.js`)
2. `docker-compose.yml` com serviços:
   - `api` (construindo a partir do Dockerfile)
   - `db` (MySQL 8.0 com volume persistente)
3. `.env` com variáveis de ambiente (sem credenciais sensíveis)
4. API funcional com `npm run dev` ou `npm start` rodando no container
5. Documentação no `README.md` explicando:
   - Como subir o ambiente (`docker-compose up`)
   - Como acessar o banco de dados (`localhost:3306`, user e senha)
   - Porta da API (`localhost:3000`, por exemplo)
6. Garantir que backend consegue conectar com banco (testar `GET /`)

---

#### Exemplo de estrutura mínima esperada:

```
📦 api/
 ┣ 📄 Dockerfile
 ┣ 📄 package.json
 ┣ 📄 index.js
📄 docker-compose.yml
📄 .env
📄 README.md
```

---

### **Campanha de Marketing & Validação de Produto**

| Task                                                                                       | Categoria               | Pontos |
|--------------------------------------------------------------------------------------------|--------------------------|--------|
| 1. Criar identidade visual da campanha (logo, paleta de cores, fonte)                      | Marketing                | 10     |
| 2. Criar landing page com foco em captação de leads (ex: waitlist ou formulário de interesse) | Validação/Marketing  | 10     |
| 3. Definir proposta de valor clara e objetiva (textos de headline e CTA da campanha)       | Validação                | 5      |
| 4. Realizar pesquisa com usuários-alvo (mínimo 5 pessoas) para entender necessidades        | Validação                | 10     |
| 5. Criar formulário com perguntas estratégicas para validar o produto                      | Validação                | 5      |
| 6. Criar post para redes sociais (Instagram, LinkedIn, etc.) com imagem e CTA              | Marketing                | 5      |
| 7. Rodar campanha de tráfego pago (ex: Facebook Ads, Google Ads) com verba teste (R$20+)   | Marketing                | 10     |
| 8. Instalar e configurar ferramentas de análise (Google Analytics, Hotjar, etc.)           | Validação/Tech           | 5      |
| 9. Criar lista de e-mails coletados e enviar campanha de follow-up (ex: Mailchimp)         | Marketing                | 5      |
| 10. Criar protótipo interativo com base no feedback dos usuários                           | Validação                | 10     |
| 11. Criar vídeo curto explicando o produto/serviço (pitch em até 60 segundos)              | Marketing                | 5      |
| 12. Realizar entrevistas qualitativas com usuários que se cadastraram (mínimo 3)           | Validação                | 5      |
| 13. Criar relatório de métricas (cliques, conversão, feedbacks) com análise de resultado   | Validação                | 10     |

---

### ✅ **Total: 100 Pontos**

Se quiser, posso adaptar para um modelo Kanban (ex: Trello ou Notion), gerar um PDF ou transformar isso num plano de ação com prazos. Só avisar!
