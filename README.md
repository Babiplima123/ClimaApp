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



