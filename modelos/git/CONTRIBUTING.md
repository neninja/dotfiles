# Contribuindo

- [Issues, Bugs e novas features](#issue)
- [Submission Guidelines](#submit)

> Créditos do documento ao time do [Angular](https://github.com/angular/angular/blob/master/CONTRIBUTING.md).

## <a name="issue"></a> Econcontrou um Bug? Quer conversar/sugerir uma nova funcionalidade?
Pode enviar uma [issue](#submit-issue) ou [Pull Request](#submit-pr) com a sugestão. Veja este [guia](#submit).

## <a name="submit"></a> Submission Guidelines

### <a name="submit-issue"></a> Enviando uma Issue

É imprescindível o envio do cenário do bug/feature.

### <a name="submit-pr"></a> Enviando um Pull Request (PR)
Antes de enviar seu PR, considere seguir as guidelines:

1. Fork o repo.
1. Clone o repo forkado.
1. Adicione `upstream`:
    ```sh
    git remote add upstream <url-original-do-projeto>
    ```

1. Faça suas mudanças em uma branch nova:
     ```sh
     git checkout -b my-fix-branch main
     ```

1. Commit suas mudanças usando a [convenção de commits](https://gist.github.com/nenitf/1cf5182bff009974bf436f978eea1996#emojicom).
     ```sh
     git commit -a
     ```
1. Atualize sua branch de acordo com o upstream, corrija conflitos se necessário.
    ```sh
    git fetch upstream
    git rebase upstream/main
    ```

1. Push sua branch para Remote:
    ```sh
    git push origin HEAD
    ```

1. Envie o pull request para `main`.
* Se for sugeridas mudanças então:
  * Faça-as.
  * Rebase sua branch e force push para seu fork (isso irá atualizar o PR):
    ```sh
    git rebase main -i
    git push -f
    ```

#### Após PR ser mergeado

Após seu PR for mergeado, você pode deletar sua branch e baixar as mudanças deste repo:

* Deletar a branch do repositório remoto:
    ```sh
    git push origin --delete my-fix-branch
    ```

* Trocar de branch para a main:
    ```sh
    git checkout main -f
    ```

* Deletar a branch local:
    ```sh
    git branch -D my-fix-branch
    ```

* Atualizar a main local:
    ```shell
    git pull --ff upstream main
    ```

