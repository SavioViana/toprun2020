README.md
======================

# Instalação do code em uma nova sandbox (org de develeop/test)
--------
sfdx force:auth:web:login -a my-sandbox --instanceurl https://test.salesforce.com

sfdx force:mdapi:deploy -d ./src --verbose -u my-sandbox


# Dica de Livros
--------
Segue abaixo todas as literaturas citadas durante o curso
* Clean Code
* Elements of reusable object-oriented software (GOF Design Patterns)
* Domain Driven Design - DDD
* Working Effectively with a legacy Code
* Growing Object-Oriented Software, Guided by Tests

# Padrões Apresentados

Segue abaixo alguns padrões de projeto comentados e alguns aplicados durante o curso

* Repository (DDD)
* Singleton  (GOF Design Patterns - Erich Gamma)
* Factory (GOF Design Patterns - Erich Gamma)
* FixtureFactory (TDD - Kent Back)
* TriggerHanlder (Salesforce)



# Exercícios
1. [US001 - Agendamento de apresentação para clientes Premium](https://github.com/topinformation-public/topi-run-2020/blob/master/exercise-us-001-premium-customer-meeting.md)