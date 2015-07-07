" Add powerline repo to rtp
set rtp+=~/.dotfiles/powerline/powerline/bindings/vim

" Init powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
