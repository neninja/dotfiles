# Contributing

 - [Issues, Bugs e novas features](#issue)
 - [Feature Requests](#feature)
 - [Submission Guidelines](#submit)
 - [Coding Rules](#rules)
 - [Commit Message Guidelines](#commit)

## <a name="issue"></a> Found a Bug?
Se encontrar um bug pode enviar uma [issue](#submit-issue) ou [Pull Request](#submit-pr) com a correção.

## <a name="submit"></a> Submission Guidelines

### <a name="submit-issue"></a> Enviando uma Issue

É imprescindível o envio do cenário do bug/feature.


### <a name="submit-pr"></a> Enviando um Pull Request (PR)
Antes de enviar seu PR, considere seguir as guidelines:

1. Fork o repo.
1. Faça suas mudanças em uma branch nova:
     ```shell
     git checkout -b my-fix-branch master
     ```

1. Commit suas mudanças usando a [convenção de commits descritivos](#commit).
     ```shell
     git commit -a
     ```
    Note: `-a` automaticamente "add" e "rm" arquivos.

1. Push sua branch para Remote:
    ```shell
    git push origin my-fix-branch
    ```

1. Envie o pull request para `master`.
* Se for sugeridas mudanças então:
  * Faça-as.
  * Rebase sua branch e force push para seu fork (isso irá atualizar o PR):
    ```shell
    git rebase master -i
    git push -f
    ```

#### After your pull request is merged

Após seu PR for mergeado, você pode deletar sua branch e baixar as mudanças deste repo:

* Deletar a branch do repositório remoto:
    ```shell
    git push origin --delete my-fix-branch
    ```

* Trocar de branch para a master:
    ```shell
    git checkout master -f
    ```

* Deletar a branch local:
    ```shell
    git branch -D my-fix-branch
    ```

* Atualizar a master local:
    ```shell
    git pull --ff upstream master
    ```

## <a name="commit"></a> Commit Message Guidelines
Totalmente baseado no [angular](https://github.com/angular/angular/commits/master) e [emoji-log](https://github.com/ahmadawais/Emoji-Log/).
Alguns links uteis:
- [Semantic commits](https://www.conventionalcommits.org/en/v1.0.0-beta.2/#summary)
- [Semantic commits](https://hackwild.com/article/semantic-git-commits/)
- [Emoji Log](https://opensource.com/article/19/2/emoji-log-git-commit-messages)
- [Guideline Angular](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-guidelines)

### Commit Message Format
Cada mensagem de commite em um **header**, **body** e **footer**. O primeiro contendo um **type**, **scope** e **subject**:
```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```
O **header** é obrigatório.
O **body** é a descrição prolongada do que foi realizado, podendo ser listado com hífens ou descritos com parágrafos.
O **footer** deve especificar issues, PR ou expliitar BREAKING CHANGES.

```
docs(changelog): update changelog to beta.5
```
```
fix(release): need to depend on latest rxjs and zone.js

The version in our package.json gets copied to the one we publish, and users need the latest of these.
```

<!--### Revert
If the commit reverts a previous commit, it should begin with `revert: `, followed by the header of the reverted commit. In the body it should say: `This reverts commit <hash>.`, where the hash is the SHA of the commit being reverted.-->

#### Type
Deve ser:
- feat: ADICIONA nova feature/funcionalidade para usuário final (afeta MINOR ou pode afetar MAJOR se conter BREAKING CHANGE no footer)
- fix: CORRIGE bug feature/funcionalidade para usuário final (afeta PATCH ou pode afetar MAJOR se conter BREAKING CHANGE no footer)
- refactor: REFATORA, ATUALIZA ou MODIFICA código para usuário final
- docs: ADICIONA, MODIFICA, ATUALIZA ou REMOVE algo na documentação (usar o escopo!)
- style: ESTILIZA o código, não afeta a lógica
- test: ADICIONA, MODIFICA, ATUALIZA ou REMOVE testes, não afeta usuário final
- chore: ADICIONA, MODIFICA, ATUALIZA ou REMOVE arquivos externos ao projeto (gulp, npm, configurações e etc), não afeta usuário final

#### Scope
Escopo do que está sendo modificado, podendo ser palavras pré-definidas (core, animations, common e etc) ou nomes de arquivos (readme). Vlor opcional, se omitido os parentêses devem ser apagados.

#### Subject:
- Usar verbos no imperativo somente
  - feat: adiciona, introduz ...
  - fix: corrige ...
  - refactor: refatora, melhora, atualiza ...
  - docs: adiciona, modifica, atualiza ...
  - style: formata, estrutura, corrige ...
  - test: adiciona, modifica, atualiza, remove ...
  - chore: adiciona, modifica, atualiza, remove ...
- Não capitalizar a primeira letra
- Não usar ponto final na frase

#### Body:
Seção mais descritiva do commit, pode ser usado hifens para listagem.

#### Footer:
Listar issues (Close #123456, PR Close #123456, Fix #123456) ou escrever BREAKING CHANGES

### Breaking Changes:
Todas mudanças drásticas devem ser mencionadas, isso inclui a justificação, mudança e como pode ser feita uma migração

##### [Numerar versões](https://semver.org/#summary):
- MAJOR.MINOR.PATCH
  - MAJOR torna explícita a incompatibilidade de mudanças na API com a versão anterior
  - MINOR adição de funcionalidade sem comprometer uso da API do mesmo modo de versões anteriores
  - PATCH correção de bugs

Créditos do documento ao time do [Angular](https://github.com/angular/angular/blob/master/CONTRIBUTING.md).
