# 🧾 Relatório de Mapeamento de Elementos HTML
📅 Data: 09/06/2025

## ✅ Critério: Ordem Preferencial de Seletores
Segui a seguinte ordem para priorizar os seletores:
1. ID (se único)
2. Seletor customizado (ex: data-testid)
3. Name (se único)
4. Class name
5. CSS combinador
6. XPath sem texto ou índice
7. Links
8. XPath com texto ou índice

---

## Site: https://www.livelo.com.br/
- Botão do carrinho 
  🔸 Seletor customizado:  
  [data-testid="button_l-cart__button"]
- Botão de login
  🔸 ID
  #l-header__button_login
- Botão de cadastro
  🔸 ID
  #l-header__button_register

## Site: www.divvino.com.br
- Array de botões de categorias
  🔸Class Name  .divvino-clubed-header-modalitie-0-x-headerModalitiesDropdownList
- Array de produtos
  🔸 Seletor:
  div.vtex-store-drawer-0-x-drawer.vtex-store-drawer-0-x-drawer--mainMenuHeaderItem.vtex-store-drawer-0-x-opened.vtex-store-drawer-0-x-opened--mainMenuHeaderItem.left-0.fixed.top-0.bottom-0.bg-base.z-999.flex.flex-column > div > div.vtex-store-drawer-0-x-childrenContainer.vtex-store-drawer-0-x-childrenContainer--mainMenuHeaderItem.flex.flex-grow-1 > nav
- Icone de lupa da busca
  🔸 Aria _label
   Buscar produtos
- Botão de ir no carrinho
  🔸Seletor
  body > div.render-container.render-route-store-search-category > div > div.vtex-store__template.bg-base > div > div.vtex-sticky-layout-0-x-wrapper > div > div.vtex-flex-layout-0-x-flexRow.vtex-flex-layout-0-x-flexRow--mobileHeaderLine1 > div > div:nth-child(3) > aside > div > div > button > div > span

## Site: https://www.google.com/
- Campo de busca
  🔸Name
  [name="q"]
- Botão de “Pesquisa Google”
  🔸Class Name
  .hvhmMe
- Array de links trazidos na busca
  🔸Class Name
  .G43f7e

## Site: https://www.americanas.com.br 
(Mapeamento de um site de minha escolha)
- Icone de busca
  🔸Seletor Customizado
  [data-testid="search-input"]
- Descrições dos produtos
  🔸Class Name
- Arrays de produtos
  🔸Seletor Customizado
  [data-testid="fs-list"]

