# Contribuindo

Encontrou um erro? Quer conversar/sugerir uma nova funcionalidade? Pode enviar uma *issue* ou *Pull Request* (PR) com a sugestão.

> Créditos do documento ao time do [Angular](https://github.com/angular/angular/blob/master/CONTRIBUTING.md).

## Enviando uma issue

Lembre de explicar o cenário do bug/feature.

## Enviando um PR

1. *Forke* o projeto.
2. Clone o projeto *forkado*:
    ```sh
    git clone <url-do-projeto-forkado>
    ```

3. Adicione o *upstream*:
    ```sh
    git remote add upstream <url-do-projeto-original>
    ```

4. Crie uma nova branch:
     ```sh
     git checkout -b my-fix-branch
     ```

5. Commit suas mudanças usando a [convenção de commits](https://gist.github.com/nenitf/1cf5182bff009974bf436f978eea1996#emojicom)

6. Atualize sua branch de acordo com o *upstream*, corrija conflitos se necessário.
    ```sh
    git fetch upstream
    git rebase upstream/main
    ```

7. Envie seu código para o *remote*:
    ```sh
    git push -f origin HEAD
    ```

8. Abra o PR para `main`.
* Se forem sugeridas mudanças na revisão do PR então:
  * Faça-as.
  * *Rebase* sua branch e force *push* para seu *fork* (isso atualizará o PR):
    ```sh
    git rebase main -i
    git push -f origin HEAD
    ```

### Após PR

Caso queira manter o projeto para futuros PRs, pode deletar somente sua branch e baixar as mudanças deste projeto:

* Trocar para a branch principal:
    ```sh
    git checkout main
    ```

* Deletar a branch local:
    ```sh
    git branch -D my-fix-branch
    ```

* Deletar a branch do repositório remoto:
    ```sh
    git push origin --delete my-fix-branch
    ```

* Atualizar a branch principal:
    ```sh
    git pull --ff upstream main
    ```
