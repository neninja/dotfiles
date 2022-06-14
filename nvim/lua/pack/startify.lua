vim.g['startify_custom_header_quotes'] = {
  {'wtf neni?', '- Rei ????'},
  {'Bom trabalho meu amorzinho, te amo mto', '- Luizi 2020'},
  {'O apressado come cru', '- Mãe 2020'},
  {'Se deu hein', '- Pai 2019'},
  {'Quem não tem cabeça, tem perna', '- Mãe 2020'},
  {'Quem come quieto come sempre', '- Luizi 2019'},
  {'Vish kk 🍑', '- LubaTV'},
  {'Oooh! I burned my moooovie! 🔥', '- Miena 2020'},
  {'Se um passarinho sujar você,', 'não reclame. Agradeça que as', 'vacas não voam', '- Miena 2020'},
  {'Para quem só sabe usar martelo,', 'todo problema é um prego.', '- Abraham Maslow'},
  {'Sua única limitação é você mesmo', '- Rocketseat 🚀 GoStack11'},
  {'Faça seu melhor, mas sempre com', 'prazo de entrega', '- Rocketseat 🚀 GoStack11'},
  {'Não espere para plantar, apenas', 'tenha paciência para colher', '- Rocketseat 🚀 GoStack11'},
  {'Sucesso não é o resultado de um ', 'jogo, mas o destino de uma jornada', '- Rocketseat 🚀 GoStack11'},
  {'Para quem fica melhor a cada dia,', 'ficar pronto é utopia', '- Rocketseat 🚀 GoStack11'},
  {'Só deseje as coisas as quais você', 'está disposto a lutar', 'ficar pronto é utopia', '- Rocketseat 🚀 GoStack11'},
  {'Não espere resultados brilhantes', 'se suas metas não forem claras', '- Rocketseat 🚀 GoStack11'},
  {'Não existe linha de chegada,', 'a vitória está em se manter correndo', '- Rocketseat 🚀 GoStack11'},
  {'Mude você e todo o resto mudará naturalmente', '- Rocketseat 🚀 GoStack11'},
  {'O tempo que leva para realizar seus sonhos', 'vai passar de qualquer forma', '- Rocketseat 🚀 GoStack11'},
  {'Nada no mundo supera a persistência', '- Rocketseat 🚀 GoStack11'},
  {'。　　•　 　ﾟ　　。', '　.　　　　.　　ඞ　。　　 。', '.　　 。　　　　  。 . 　　 •    •', 'nenitf was not the impostor'},
}
vim.g['startify_lists'] = {
  { type = 'sessions', header = {'sessões'} },
  { type = 'commands', header = {'comandos'} },
}
vim.g['startify_files_number'] = 5
vim.g['startify_commands'] = {
  {d = {'dotfiles', ':lua GoToDotfiles()'}},
  {g = {'go projects', ':e ~/go/src/github.com/nenitf'}},
  {p = {'php projects', ':e ~/dev/php'}},
}

function GoToDotfiles()
  vim.cmd('e '..dotfiles_fullpath_nvim..'vimrc | call NN_SetGitDir()')
end

