# 📌 NutritionAppointmentApp

Aplicação iOS desenvolvida em SwiftUI para conectar profissionais de nutrição com usuários, permitindo busca, filtragem e visualização de perfis detalhados.

---

## 🚀 Tecnologias Utilizadas

- Swift
- SwiftUI
- SwiftData
- Async Await Para chamadas ao serviço
- MVVM Architecture
- Dependency Injection
- Arquitetura modular organizada em camadas (Presentation, Domain, Data, Core)
- Cache de dados local com SwiftData
- Navegação e state management utilizando @StateObject e @Environment
- MockProfessionalManager para simulação de dados em testes e desenvolvimento

---

## 📖 Sobre o Projeto

O **NutritionAppointmentApp** permite que os usuários encontrem profissionais de nutrição com base em filtros de ordenação, como melhor classificação, mais popular e melhor correspondência. Utiliza SwiftData para caching e performance otimizada.

---

## ✅ O Que Foi Feito

- 🔹 Implementação da listagem de profissionais com ordenação dinâmica
- 🔹 Arquitetura modularizada com camadas separadas (Presentation, Domain, Data, Core)
- 🔹 Injeção de dependências com `AppContainer`
- 🔹 Implementação de cache com SwiftData para evitar requisições desnecessárias
- 🔹 Integração com API para busca de profissionais
- 🔹 Detalhes do profissional com informações relevantes
- 🔹 UI responsiva e adaptada a diferentes tamanhos de tela
- 🔹 MockProfessionalManager criado para testes e simulação de dados sem necessidade de conexão com API real
- 🔹 Adição de uma url para imagens visto que as vindas do serviço retornavam 404

---

## ❌ O Que Faltou Fazer

- 🔸 Paginação Na lista de professionais
- 🔸 Melhorias na experiência do usuário (UI refinada)
- 🔸 Adição de testes unitários e de integração
- 🔸 Suporte offline mais robusto

---

## 🔧 O Que Pode Ser Melhorado

- 🔹 Melhorias na arquitetura para maior indenpendeincia entre camadas
- 🔹 Melhor gestão de erros e mensagens de feedback ao usuário
- 🔹 Implementação de testes unitários para cobertura do código
- 🔹 Implementação de animações e melhorias na UI
- 🔹 Otimizações na performance das requisições e cache

---

## 📸 Evidências

| App With Service | App With Mock|
| --- | --- |
| <video src="https://github.com/user-attachments/assets/25e455c7-6190-4674-bddb-ef4d91b3b9f7" width="300"> | <video src="https://github.com/user-attachments/assets/34a4c752-3f21-48e9-84c1-cdf6656c9ca9" width="300"> |

---

## 📌 Como Executar o Projeto

1. Clone o repositório:
   ```sh
   git@github.com:kevenm4/NutritionAppointmentSearch.git
   ```
2. Abra o projeto no Xcode.
3. Execute o projeto em um simulador ou dispositivo.
4. Para testar com dados mockados, utilize `MockProfessionalManager` como repositório de profissionais.

---

## 📬 Contato

- ✉️ Email: [kevenesmael8@gmail.com](mailto:kevenesmael8l@gmail.com)
- 💼 LinkedIn: [Keven Esmael](https://www.linkedin.com/in/keven-vieira-andrade/)

