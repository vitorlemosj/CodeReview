# 📋 Relatório de Code Review

## 1) Nome de quem fez o Code Review  
**João Vitor Moreira Lemos**

## 2) Nome do colega que criou o código  
**Carlos Eduardo Sarubi De Souza**

## 3) Link do repositório e branch avaliada  
- https://github.com/vitorlemosj/CodeReview.git
- **Branch avaliada:** `main`

## 4) Resultado do Code Review  

### ✅ Pontos Positivos  
- Estrutura bem organizada seguindo padrões do **Robot Framework** (`*** Settings ***`, `*** Variables ***`, `*** Test Cases ***`).  
- Uso adequado da **RequestsLibrary**, com sessões criadas para diferentes APIs (`api` e `api_livros`).  
- Boas práticas de automação: testes cobrem os principais métodos HTTP (**GET, POST, PUT, DELETE**).  
- Log de saída (`Log To Console`) garante visibilidade dos resultados durante a execução.  
- Validação consistente dos códigos de status HTTP (`200`, `201`, `204`).  

### ⚠️ Pontos de Melhoria  
1. **Padronização dos nomes de variáveis e sessões**  
   - Exemplo: `api` e `api_livros` poderiam seguir convenção uniforme, como `session_users` e `session_books`.  

2. **Uso de palavras incorretas em Keywords**  
   - No caso do teste *Atualizar Usuário*, foi utilizado `Create On Dictionary` em vez de `Create Dictionary`. Isso pode gerar erro de execução.  

3. **Documentação dos testes**  
   - O campo `[Documentation]` está presente mas vazio. Seria interessante descrever **objetivo, pré-condições e resultados esperados** de cada caso.  

4. **Reaproveitamento de sessões**  
   - Cada teste cria uma nova sessão (`Create Session`). Poderia ser otimizado criando a sessão no **Setup** e reaproveitando entre os casos de teste.  

5. **Validação mais robusta**  
   - Atualmente só é validado o `status_code`. Poderia incluir verificações adicionais no corpo da resposta (`response.json()`), validando campos obrigatórios.  

6. **Separação de cenários de usuários e livros**  
   - Melhorar a organização criando **suites diferentes** (`usuarios.robot`, `livros.robot`) para manter clareza.  

---

### 📌 Conclusão  
O código atende bem à proposta de testes de API, cobrindo operações CRUD de forma clara.  
As melhorias recomendadas visam aumentar a padronização, clareza da documentação e robustez das validações.
