# ClimaApp
Aplicativo consumir API

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
Desenvolvimento da demanda

A cada novo card (task) deve se criar uma nova Branch Feature a partir da Branch Develop 

Comando para criação de uma nova Branch 
git checkout -b r#numero-do-card Cria uma branch local na sua maquina para desenvolvimento. OBS.: todas as branchs locais deve ser criadas a partir da branch "dev".

Para um bom entendimento das alterações no código, sugere-se a cada novo arquivo ou funcionalidade nova criada realizar um commit 

git add . Adiciona o arquivo para a lista.
git commit -m "#numero-do-card-no-trello: commit message" Prepara a lista para subida no servidor.

Após terminar todas as subtarefas da task seguir o passo a passo abaixo:

git checkout dev Volta para brach "dev", na qual você fará o push dos arquivos
git pull --rebase origin "branch" Atualiza a branch local com a branch remota
git cherry-pick "hash-do-commit" Obs.: Para descobrir a hash do seus commits git log origin/"branch-local".."branch-remota"
git push origin dev

Qualquer outra dúvida sobre git http://git-scm.com/documentation


Documentação Técnica: Git Workflow para Projeto XYZ
Introdução
Este documento tem como objetivo apresentar o Git Workflow que será utilizado para o projeto XYZ. O Git é um sistema de controle de versão amplamente utilizado no desenvolvimento de software, permitindo que várias pessoas trabalhem juntas em um mesmo projeto sem que ocorram conflitos entre as alterações realizadas. Neste documento, serão apresentadas as principais etapas do processo de desenvolvimento com Git, incluindo as nomenclaturas utilizadas, fluxos de trabalho e as ferramentas recomendadas para o uso no projeto XYZ.

Git Workflow
O Git Workflow utilizado no projeto XYZ é baseado no modelo de ramificação "Git Flow". Esse modelo define uma série de ramificações do projeto, cada uma com um propósito específico, permitindo que as alterações sejam integradas ao projeto de maneira organizada e controlada.

Ramificações
As ramificações utilizadas no Git Flow são as seguintes:

Master: Ramificação principal do projeto, contendo as versões estáveis e prontas para produção.
Develop: Ramificação de desenvolvimento, onde as alterações são integradas e testadas antes de serem enviadas para a ramificação Master.
Feature: Ramificação utilizada para o desenvolvimento de novas funcionalidades, criada a partir da ramificação Develop. Cada nova funcionalidade deve ser desenvolvida em sua própria ramificação Feature.
Release: Ramificação utilizada para preparar uma nova versão para produção, criada a partir da ramificação Develop. Nesta ramificação, são realizados testes finais e correções de bugs antes da publicação da nova versão.
Hotfix: Ramificação utilizada para correção de bugs críticos em produção, criada a partir da ramificação Master.
Fluxo de Trabalho
O fluxo de trabalho com Git Flow consiste nas seguintes etapas:

Criar Feature: A partir da ramificação Develop, é criada uma nova ramificação Feature para o desenvolvimento de uma nova funcionalidade.
Desenvolver Feature: Na ramificação Feature, as alterações são desenvolvidas e testadas localmente pelo desenvolvedor.
Enviar Feature: Após a finalização do desenvolvimento, a ramificação Feature é enviada para o repositório remoto.
Iniciar Pull Request: É criado um Pull Request (PR) para a ramificação Develop, solicitando a revisão e a integração da nova funcionalidade.
Revisar Pull Request: O PR é revisado por outros desenvolvedores da equipe, que sugerem melhorias e correções necessárias.
Integrar Feature: Após a revisão e a correção dos problemas encontrados, a nova funcionalidade é integrada à ramificação Develop.
Criar Release: Quando a versão estiver pronta para produção, é criada uma nova ramificação Release a partir da ramificação Develop.
Testar Release: Na ramificação Release, são realizados testes finais e correções de bugs antes da publicação da nova versão.
Publicar Release: Após a aprovação dos testes, a nova versão é publicada e integrada à ramificação Master.
Criar Hotfix: Caso ocorra um bug crítico em



