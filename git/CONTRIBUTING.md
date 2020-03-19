# Contribuindo
Créditos do documento ao time do [Angular](https://github.com/angular/angular/blob/master/CONTRIBUTING.md).

- [Issues, Bugs e novas features](#issue)
- [Submission Guidelines](#submit)

## <a name="issue"></a> Econcontrou um Bug? Quer conversar/sugerir uma nova funcionalidade?
Pode enviar uma [issue](#submit-issue) ou [Pull Request](#submit-pr) com a sugestão. Veja este [guia](#submit).

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

1. Commit suas mudanças usando a convenção de commits se houver.
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

#### Após PR ser mergeado

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

