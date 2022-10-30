" insert→normal時に自動で日本語→英語に変換

let &shell='/usr/bin/bash --login'
autocmd InsertLeave * :call system('${zenhan} 0')
autocmd CmdlineLeave * :call system('${zenhan} 0')
