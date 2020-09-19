# US - 001 : Agendamento de apresentação para clientes Premium.

**Sendo** um Agente de Vendas 

**Posso** de forma automática manter a minha agenda atualizada

**Para** apresentação coorporativa ao novos Clientes Premium com isso melhorar o relacionamento com o mesmo.



## Critérios de Aceite
------------

### Evento criado para Clientes Premim com faturamento acima de $1.000.000,00

**Dado** que um Cliente (Account) com 
categoria (Category__c) "Premium"
E Receita Anual acima de 1.000.000 (um milhão)

**Quando** ele for inserido, ou seja, for criado.

**Então** Um novo Evento deverá ser criado com os seguintes dados:
* Descrição (Description) : 'Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium'
* Assunto (Subject) : 'Apresentação instucional dos produtos Premium'
* Data e Hora de Início (StartDateTime) : Agendar para 1 após a data de criação do Cliente ***¹**
* Data e Hora de Fim (EndDateTime) : Deverá ter uma hora de duração
* Relativo a (WhatId) : Id do Cliente em questão.
* Tipo de Contato (ContactType__c) : 'Telefônico'


### Evento não criado para Cliente Premium com faturamento menor que $1.000.000,00

**Dado** que um Cliente (Account) com 
categoria (Category__c) "Premium"
E Receita Anual de que $600.000,00

**Quando** ele for inserido, ou seja, for criado.

**Então** não deverá ser criado nenhum evento para este cliente.



### Evento não criado para Cliente Standard

**Dado** um Cliente (Account) com categoria (Category__c) "Standard"

**Quando** ele for inserido, ou seja, for criado.

**Então** não deverá ser criado nenhum evento para este cliente.



-----
## Campos necessários 
------
* Criar campo Category em Account do tipo lista de opções com os valores pedidos acima e outros para melhorar o cenários de teste.
* Criar campo ContactType em Atividade e deixa-lo somente visível para o Evento.

## Pontos Obrigatórios

* Code do GitHub

* Todas as classes com 100% de cobertura, utlizando o padrão FixtureFactory para criação de Dados

* Utilização do Pattern Repository

* Utilização do Pattern TriggerHandler

* Utilização do Patterns Filter, Enricher