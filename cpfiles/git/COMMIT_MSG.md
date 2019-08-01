# Guia/Padronização de mensagens de commits
<!--
https://www.conventionalcommits.org/en/v1.0.0-beta.2/#summary
https://hackwild.com/article/semantic-git-commits/
https://github.com/angular/angular/commits/master
https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-guidelines
https://opensource.com/article/19/2/emoji-log-git-commit-messages
https://github.com/ahmadawais/Emoji-Log/
-->
## Commit Message Format
Cada mensagem de commit Tem um **cabeçalho**, **corpo** e **rodapé**. O primeiro contendo um **tipo**, **escopo** e **assunto**:
```
<tipo>(<escopo>): <título>
<LINHA EM BRANCO>
<corpo>
<LINHA EM BRANCO>
<rodapé>
```
O **cabeçalho** é obrigatório (com exceção do escopo). *Deve possuir apenas uma linha e não pode ultrapassar 51 caracteres*
O **corpo** é a descrição prolongada do que foi realizado, podendo ser listado com hífens ou descritos com parágrafos. *Não deve ultrapassar 70 caracteres por linha*
O **rodapé** deve especificar issues, PR ou explicitar BREAKING CHANGES. *Não deve ultrapassar 70 caracteres por linha*
```
📖 DOCS(readme): add instrução de instalação
```

### Cabeçalho
#### Tipo
Vai especificar a tipificação do commit. É constituído de: ``<emoji> <PALAVRA-EM-MAIÚSCULO>``, sendo os possíveis valores de tipo:
- 📦 FEAT: **adiciona** nova feature/funcionalidade para usuário final - afeta [MINOR](https://semver.org/#summary) ou pode afetar [MAJOR](https://semver.org/#summary) se conter BREAKING CHANGE no rodapé
- 🐛 FIX: **CORRIGE** bug feature/funcionalidade para usuário final - afeta [PATCH](https://semver.org/#summary) ou pode afetar [MAJOR](https://semver.org/#summary) se conter BREAKING CHANGE no rodapé
- 👌 REFACTOR: **refatora,** **atualiza** ou **modifica** código para usuário final
- 📖 DOCS: **adiciona**, **modifica**, **atualiza** ou **remove** algo na documentação (usar o escopo!)
- 🎨 STYLE: **estiliza** o código, não afeta a lógica
- ✅ TEST: **adiciona**, **modifica**, **atualiza** ou **remove** testes, não afeta usuário final
- 🔧 CHORE: **adiciona**, **modifica**, **atualiza** ou **remove** arquivos externos ao projeto (gulp, npm, configurações e etc), não afeta usuário final

#### Escopo
Escopo do que está sendo modificado, valor opcional, se omitido os parentêses devem ser apagados.
Valores aceitos quando as alterações:
- readme: São diretas no readme [tipos: DOCS]

#### Assunto
- Usar verbos no imperativo somente
  - 📦 FEAT: adiciona, introduz ...
  - 🐛 FIX: corrige ...
  - 👌 REFACTOR: refatora, melhora, atualiza ...
  - 📖 DOCS: adiciona, modifica, atualiza ...
  - 🎨 STYLE: formata, estrutura, corrige ...
  - ✅ TEST: adiciona, modifica, atualiza, remove ...
  - 🔧 CHORE: adiciona, modifica, atualiza, remove ...
- Não capitalizar a primeira letra
- Não usar ponto final na frase

### Corpo:
Seção mais descritiva do commit, pode ser usado hifens para listagem.

### Rodapé:
Usado para referenciar issues (Close #123456, PR Close #123456, Fix #123456) ou escrever BREAKING CHANGES

#### Breaking Changes:
Todas mudanças drásticas devem ser mencionadas, isso inclui a justificação, mudança e como pode ser feita uma migração

<!--
## [Numerar versões](https://semver.org/#summary):
- MAJOR.MINOR.PATCH
  - MAJOR torna explícita a incompatibilidade de mudanças na API com a versão anterior
  - MINOR adição de funcionalidade sem comprometer uso da API do mesmo modo de versões anteriores
  - PATCH correção de bugs
-->
