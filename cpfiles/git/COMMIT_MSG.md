# Guia/Padronização de mensagens de commits
<!--
https://www.conventionalcommits.org/pt-br/v1.0.0-beta.4/
https://hackwild.com/article/semantic-git-commits/
https://github.com/angular/angular/commits/master
https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-guidelines
https://opensource.com/article/19/2/emoji-log-git-commit-messages
https://github.com/ahmadawais/Emoji-Log/
https://gist.github.com/stephenparish/9941e89d80e2bc58a153
-->
A criação de um padrão de mensagens de commit permite:
- Automatizar changelogs
```
# Todas mudanças
git log <last tag> HEAD --pretty=format:%s

# Todas features
git log <last tag> HEAD --grep FEAT
```
- Filtrar commits (feature, bugfix, refatoração, documentação, estilização, testes, build/ci/deploy)

## Padrão
Cada mensagem de commit Tem um **cabeçalho**, **corpo** e **rodapé**. O primeiro contendo um **tipo**, **escopo** e **assunto**:
```
<tipo>[(escopo opcional)]: <título>

[corpo opcional]

[rodapé opcional]
```
O **cabeçalho** é obrigatório (com exceção do escopo). *Deve possuir apenas uma linha e não pode ultrapassar 50 caracteres*
O **corpo** é a descrição prolongada do que foi realizado, podendo ser listado com hífens ou descritos com parágrafos. *Não deve ultrapassar 70 caracteres por linha*
O **rodapé** deve especificar issues, PR ou explicitar BREAKING CHANGES. *Não deve ultrapassar 70 caracteres por linha*

### Cabeçalho
#### Tipo
Vai especificar a tipificação do commit. É constituído de uma palavra com letras sem capitalização, podendo ser:
- feat: **adiciona**, **modifica** ou **remove** feature/funcionalidade para usuário final - sempre afeta [MINOR](https://semver.org/#summary) ou talvez [MAJOR](https://semver.org/#summary) se conter BREAKING CHANGE no rodapé
- fix: **CORRIGE** *bug* de feature/funcionalidade para usuário final - sempre afeta [PATCH](https://semver.org/#summary) ou talvez [MAJOR](https://semver.org/#summary) se conter BREAKING CHANGE no rodapé
- refactor: **refatora** código, não afeta usuário final
- improve: **adiciona**, **modifica** ou **remove** algo na base de código que não afeta o usuário final
- docs: **adiciona**, **modifica** ou **remove** algo na documentação
- style: **estiliza** o código, não afeta a lógica do algoritmo
- test: **adiciona**, **modifica** ou **remove** testes, não afeta usuário final
- chore: **adiciona**, **modifica** ou **remove** arquivos externos ao projeto (gulp, npm, configurações e etc), não afeta usuário final

#### Escopo
Substantivo que representa o escopo das modificações. Valor opcional, os parentêses devem ser apagados caso esteja em branco.

| Valor   | Tipificações    | Afeta               |
|---------|:---------------:|---------------------|
| readme  | DOCS            |  Arquivo README.md  |


#### Assunto
- Uma frase
- Verbos no imperativo somente
  - feat: adiciona, introduz, simplifica ...
  - fix: adiciona, corrige, remove ...
  - refactor: refatora, melhora, atualiza ...
  - improve: adiciona, modifica, atualiza, remove ...
  - docs: adiciona, modifica, atualiza ...
  - style: formata, estrutura, corrige ...
  - test: adiciona, modifica, atualiza, remove ...
  - chore: adiciona, modifica, atualiza, remove ...
- Não capitalizar a primeira letra
- Não usar ponto final na frase
- Podem ser usadas abreviações cabíveis, como add (adiciona), rm (remove) e etc

### Corpo:
Seção mais descritiva do commit, pode ser usado hífens para listagem.

### Rodapé:
Usado para referenciar issues (Close #123456, PR Close #123456, Fix #123456) ou escrever BREAKING CHANGES (use em capslock)

#### Breaking Changes:
Todas mudanças drásticas devem ser mencionadas, isso inclui a justificação, mudança e como pode ser feita uma migração

## Exemplos
```
docs(readme): add instrução de instalação
```
```
feat(parser): add capacidade de interpretar arrays
```
```
feat(browser): add evento onUrlChange

Adiciona novo evento para $browser:
- ..
- ..

BREAKING CHANGES $browser.onHashChange removido (use onUrlChange no lugar)
```
```
fix(compile): add unit tests para IE9

Antigo IEs serializa html uppercase, porém IE9 não.

Close #392
```
```
feat(directive): rm ng:disabled, ng:checked, ng:multiple, ng:readonly, ng:selected
```
```
style(location): add ; esquecidos
```
```
improve: add método genérico de inserção no banco de dados
```
```
docs(readme): atualiza how to
```
```
feat(compile): simplifica bindings

Modifica opções de parâmetros para:
  - @attr - atributo (incluindo interpolação)
  - =model - model
  - &expr - execução

Essa modificação simplifica o numero de opções disponíveis para
o desenvolvedor.

BREAKING CHANGES parâmetros de escopo isolados foram modificados
e injeção de diretiva removida

Exemplo de migração:

Antes:

scope: {
  myAttr: 'attribute',
  myBind: 'bind',
  myExpression: 'expression',
  myEval: 'evaluate',
  myAccessor: 'accessor'
}

Depois:

scope: {
  myAttr: '@',
  myBind: '@',
  myExpression: '&',
  myAccessor: '=''
}

PR Close #3
```

<!--
## [Numerar versões](https://semver.org/#summary):
- MAJOR.MINOR.PATCH
  - MAJOR torna explícita a incompatibilidade de mudanças na API com a versão anterior
  - MINOR adição de funcionalidade sem comprometer uso da API do mesmo modo de versões anteriores
  - PATCH correção de bugs
-->
