# US - 002 : Sincronização de Dados do Projeto com Sistema Externo

**Sendo** um gerente de projeto

**Posso** de forma automática sincronizar os dados de Projetos Enterprise na Salesforce com o meu Sistema Legado

**Para** que possa realizar o planejamento de futuros projetos na pipeline


## Critérios de Aceite
------------

### Integrar Projetos do Tipo Enterprise com sistema legado

**Dado** que estou no Projeto do Tipo (Type__c) "Enterprise"
e alterei o Status (Status__c) para "Iniciado"

**Quando** ele for atualizado.

**Então** deverá ser enviado para o Sistema de Gerenciamento TopiRun2020, conforme mapeamento XX
no final do processamento atualizar o campo _Data da ultima Sincronização_ (LastSyncDate__c) com a data e hora do dia 
E Status Sincronização (SynchronizationStatus__c) "Integrado com sucesso";



### Erro ao enviar um projeto para o sistema legado

**Dado** realizei a chamado ao serviço  

**Quando** ele retorna um http code <> 200

**Então** deverá o Status Sincronização (SynchronizationStatus__c) deverá ser atualizado para "Erro na sincronização de projetos"
E o Detalhe do Erro (ErrorMessage__c)  com o conteúdo do campo "message" (confirme mapeamento de response de erro)



# Dados do Serviço de Sincronismo de projeto

* URL : https://run.mocky.io/v3/e61d7a35-d227-49e5-b5e5-7e0e2fdcee2d
* Metodo : PUT

### Mapeamento de Campos
----


### Request
-----

| Origem | Destino | Obrigatório | Tipo
|:---|:---|:--:|:---|
| Project__c.ProjectName__c | name | x | String (255)
| Project__c.Id        | code | x | String (255)
| Project__c.Status__c | status | x | String (255) 
| Project__c.StartDate__c | startDate | x| Date
| Project__c.EndDate__c | endDate | x | Date
| Project__c.Budget__c | budget | | Double

#### Exemplo de Payload 

``` javascript

{ 
    "name" : "TopiRun2020"
    "code" : "2424232"
    "status" : "Iniciado"
    "startDate" : "2020-01-01"
    "endDate" : "2020-12-01"
    "budget" : 200000.00
 }

```

### Response de Sucesso

| Origem | Destino | Obrigatório | Tipo
|:---|:---|:---:|:---|
| projectId | Project__c.ExternalId | x | String (255)
| externalId | Project__c.Id | x | String (255)

#### Exemplo de Payload de Sucesso

* Http Code 200

``` javascript
{ 
    "projectId" : "01932190123"
    "externalId" : "01232139123812"
 }

```


### Response de Falha

| Origem | Destino | Obrigatório | Tipo
|:---|:---|:---:|:---|
| errorMessage | Project__c.ErrorMessage__c | x | String (500)

#### Exemplo de Payload de Sucesso

* Http Code 400

``` javascript
{
    "errorMessage" : "Invalid Start Date"
}
```