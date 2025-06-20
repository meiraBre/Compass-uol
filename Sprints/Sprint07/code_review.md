## Checklist de Code Review
- **Squad Revisora:** QA-ntastic Five
- **Squad Revisada:** Codetectives
- **Data:** 18/06/2025
- **Aplicação Alvo:** [Automação de Testes Web com Robot Framework | ServeRest - Codetectives](https://github.com/luismagriss/codetectives)

---

## Resumo
Este documento consolida as observações feitas durante a revisão de código do projeto de automação de testes. O objetivo é destacar os pontos positivos e fornecer recomendações construtivas para aprimorar a qualidade, manutenibilidade e robustez do código.

---

## ✅ Pontos Fortes
- Estrutura de diretórios bem organizada, com clara separação entre *tests*, *resources*, *fixtures* e *dynamics*  
- Implementação do padrão **Page Object Model**, deixando page objects em arquivos dedicados  
- Código enxuto e legível  
- Boa cobertura de testes (login, cadastro de usuários, listagem/criação de produtos – cenários positivos e negativos)  
- Validações de mensagens de sucesso e erro em diversos fluxos  
- Reaproveitamento de componentes via `base.resource`  
- Geração dinâmica de dados de teste com **FakerLibrary**  
- Testes escritos em estilo BDD (*Given – When – Then*) com tags e documentação  
- Diretório `/tests` intuitivo e de fácil navegação  
- Uso de *fixtures* (`users.json`) para dados estáticos quando necessário  

---

## 🛠️ Melhorias Sugeridas
1. **Padronização**
   - Padronização de nomes de arquivos (CamelCase *vs* snake_case)  
   - Manter um único idioma nos nomes de Keywords (Português ou Inglês)  
   - Centralizar `Library` e `Resource` repetidos em `base.resource`  
2. **Configuração**
   - Centralizar todas as URLs em `env.resource`; remover hard-codes  
   - Consolidar `variables.resource` dentro de `base.resource` (ou vice-versa)  
   - Verificar necessidade de `env.robot` se já existe `env.resource`  
3. **Código Duplicado / Reaproveitamento**
   - Mover Keywords de validação de mensagens para um `validation.resource` único  
   - Eliminar duplicatas como `"Alert should be"` presentes em mais de um arquivo  
   - Transformar Keywords muito específicas em funções reutilizáveis com argumentos (ex.: `UserDynamic.robot`)  
4. **Requisitos & Ambiente**
   - Completar `requirements.txt` (`robotframework-browser`, `robotframework-faker`, `robotframework-jsonlibrary`, `robotframework-requests`, etc.)  
   - Padronizar a abertura do navegador (`Start Session`) em todos os testes  
5. **Qualidade de Seletores**
   - Reduzir uso excessivo de **XPath**; preferir seletores CSS  
6. **Isolamento & Limpeza de Dados**
   - Implementar teardown para remover usuário/produto criado após cada teste (via API)  
   - Tornar os testes independentes, evitando dependência em execuções anteriores  
7. **Robustez**
   - Incluir `Wait Until`/timeouts adequados e estratégias de retry para elementos instáveis
