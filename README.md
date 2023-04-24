

Documentação Técnica proposta: 

Git Workflow ClimaApp - para Projeto Aplicativo consumir API 

Introdução: 

Este documento tem como objetivo apresentar o Git Workflow e uma proposta a ser realizada no Projeto de ClimaApp. 

O Git é um sistema de controle de versão amplamente utilizado no desenvolvimento de software, permitindo que várias pessoas trabalhem juntas em um mesmo projeto sem que ocorram conflitos entre as alterações realizadas. Neste documento, serão apresentadas as principais etapas do processo de desenvolvimento com Git, incluindo as nomenclaturas utilizadas, fluxos de trabalho e as ferramentas recomendadas.

Git Workflow utilizado no projeto ClimaAPP é baseado no modelo de ramificação "Git Flow". Esse modelo define uma série de (branch) ramificações do projeto, cada uma com um propósito específico, permitindo que as alterações sejam integradas ao projeto de maneira organizada e controlada.

As Branchs utilizadas no Git Flow são as seguintes:

Master: Brach principal do projeto, contendo as versões estáveis e prontas para produção. 

Develop: Branch de desenvolvimento, onde as alterações são integradas e testadas antes de serem enviadas para a branch Master. 

Feature: Branch utilizada para o desenvolvimento de novas funcionalidades, criada a partir da branch Develop. Cada nova funcionalidade deve ser desenvolvida em sua própria branch Feature. 

Release: Branch utilizada para preparar uma nova versão para produção, criada a partir da branch Develop. Nesta branch, são realizados testes finais e correções de bugs antes da publicação da nova versão. 

Bugfix: Branch utilizada para correção de bugs em testes finais, criada a partir da Realease. 

Hotfix: Branch utilizada para correção de bugs críticos em produção(emergencial), criada a partir da branch Master. 

Fluxo de Trabalho 

O fluxo de trabalho com Git Flow consiste nas seguintes etapas:

Criar branch Feature: A partir da branch Develop, que é criada uma nova branch Feature para o desenvolvimento de uma nova funcionalidade de acordo ao card de cada task, funcionalidade. 

Desenvolver Feature: Na branch Feature, as alterações são desenvolvidas e testadas localmente pelo desenvolvedor. 

Enviar Feature: Após a finalização do desenvolvimento, a branch Feature é enviada para o repositório remoto. 

Iniciar Pull Request: É criado um Pull Request (PR) para a branch Develop, solicitando a revisão e a integração da nova funcionalidade aos Desenvolvedores envolvidos no projeto. 

Revisar Pull Request: O PR é revisado por outros desenvolvedores da equipe, que sugerem melhorias e correções necessárias. 

Integrar Feature: Após a revisão e a correção dos problemas encontrados, a nova funcionalidade é integrada à branch Develop. 

Criar Release: Quando a versão estiver pronta para produção, é criada uma nova branch Release a partir da branch Develop. 

Testar Release: Na branch Release, são realizados testes finais e correções de bugs antes da publicação da nova versão, geralmente esta branch é a disponibilizada ao time de QA para testes finais. 

Publicar Release: Após a aprovação dos testes, a nova versão é publicada e integrada à branch Master. 

Criar Hotfix: Caso ocorra um bug crítico em produção é criado uma branch chamada Hotfix.


GitWorkFlow do Projeto ClimaApp

Padrões de commit para repositório git

Cada commit deverá ser vinculado a um card do Project. Temos duas branchs no nosso repositório, uma para desenvolvimento "dev", branch na qual deverá ser desenvolvido o chamado. 
A segunda branch é a "master", nossa branch de produção os arquivos só deverão ser comitados para essa branch após a demanda ter sido terminada e homologada. 

Obs.: As branchs locais deverão ser criadas apartir da branch "dev".

Abaixo o grafico do repositório:

![Padrão WorkFlow do Projeto](https://codigomaromba.files.wordpress.com/2019/01/gitflow-1.png)

Exemplo de chamado no GitHub Projects

![Cards GitHub Project](https://docs.github.com/assets/cb-110288/images/help/projects/project-board-basic-kanban-template.png)

O exemplo acima mostra em etapas como é descrito o chamado:

Titulo do chamado;
Descrição completa;
Número do card.

Desenvolvimento de GitWorkFlow no projeto ClimaApp. 

A cada novo card (task) deve se criar uma nova Branch Feature a partir da Branch Develop. 

Comando para criação de uma nova Branch 
git checkout -b "#numero-do-card" Cria uma branch local na sua maquina para desenvolvimento. OBS.: todas as branchs locais deve ser criadas a partir da branch "develop".

Para um bom entendimento das alterações no código, sugere-se a cada novo arquivo ou funcionalidade nova criada realizar um commit.

git add . comando que adiciona os arquivos aalterados para a lista a ser comitado.
git commit -m "#numero-do-card-no-trello: commit message" Prepara a lista para subida no servidor.

Após terminar todas as subtarefas da task seguir o passo a passo abaixo:

Abrir Pull Request para análise dos devs. 
Comando para Push local para repositório remoto. 
git push origin nome da branch feature
Aguardar análise dos devs e as possíveis sugestões.
Após a PR ser aprovada e ser realizado o merge com a branch Dev, realizar o Pull no git local. 
Comando para Pull local
git pull origin develop

Após ser desenvolvida todas as task features e ter sido realizadas todas as análises e aprovações e merge na develop pelos desenvolvedores abrir branch Realese para teste finais e correção de possíveis bugs. 
Comando para criação de nova branch Realese. 
git checkout -b "realese"

Após acabar a etapa de testes finais e correções de Bug, subir a versão da branch realease atualizada com todas as possíveis correções de bugs e mergear com a master. 
Por fim gerar versão atualizada a partir da master para a produçõo, subindo o projeto para produção.

Caso seja encontrado Bug abrir branch bugfix a partir da branch realease

git checkout -b "bugfix-numero-do-card-do-bug"


Qualquer outra dúvida sobre git http://git-scm.com/documentation





