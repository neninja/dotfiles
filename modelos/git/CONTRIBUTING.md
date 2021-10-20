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

5. Ao final do desenvolvimento, atualize sua branch de acordo com o *upstream*. Corrija conflitos se necessário.
```sh
git pull upstream main
```

> Os commits serão *squashados*, então não se preocupe em utilizar `rebase`

6. Envie seu código para o *remote*:
```sh
git push origin HEAD
```

7. Abra o PR para `main`.
    - Se forem sugeridas mudanças na revisão do PR então:
        1. Faça-as.
        2. Atualize novamente sua branch: ``git pull upstream main``
        3. Atualize novamente seu *fork* (isso atualizará o PR): ``git push origin HEAD``

### Após PR concluído

Caso queira manter o projeto para futuras contribuições, pode deletar somente sua branch e baixar as mudanças do projeto:

1. Trocar para a branch principal:
```sh
git checkout main
```

2. Deletar a branch local:
```sh
git branch -D my-fix-branch
```

3. Deletar a branch do repositório remoto:
```sh
git push origin --delete my-fix-branch
```

4. Atualizar a branch principal:
```sh
git fetch --all
git reset --hard upstream/main
```
