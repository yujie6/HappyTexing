echo "[1/7] Downloading vim-plug..."

if [ -e $HOME/.vim/autoload/plug.vim ]
then
		echo "You already got vim-plug."
else
   		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
echo "[2/7] Installing zathura..."
if [ 3 -le $(apt list 2>/dev/null | grep zathura | wc -l ) ]
then
        echo "You already got zathura."
else
 		sudo apt install zathura
fi

echo "[3/7] Configuring zathura..."
mv ./zathurarc $HOME/.config

echo "[4/7] Adding 5 plugins to your vim-plug"
echo "Do you want your .vimrc to be replaced by the one in the repo?" 
echo "Input y or n"
read name
case $name in
		Y | y)
			if [ -e $HOME/.vimrc ] 
			then
				cat << EOF >> $HOME/.vimrc
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
Plug 'sirver/ultisnips'
Plug 'drewtempelmeyer/palenight.vim'
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'vim-airline/vim-airline'
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
Plug 'neomake/neomake'
call plug#end()
EOF
			else 
				echo "oh it seems like you didn't got .vimrc?"
				cp ./.vimrc $HOME
			fi;;

		n | N)
			echo ;;
		*)
			echo "error choice";;
esac


source 2>/dev/null ~/.vimrc

echo "[5/7] Installing Inkscape..."
echo "Inkscape is a powerful svg drawing tool, it can also draw with latex"
echo "With shortcut manager we can draw good figures very quick"
echo "This part is optional, type 'y,n' to decide install or not"
read dd
case $dd in
         Y | y)
			cd $HOME/Documents
			sudo apt install inkscape
			pip3 install inkscape-figures
			git clone https://github.com/gillescastel/inkscape-shortcut-manager.git
			;;
		 n | N)
			echo "That's ok, let's move on";;
		 *)
			echo	"error choice"	;;
esac

echo "[6/7] Moving tex.snippet to the directory"
if [ -e $HOME/.vim/UltiSnips ]
then
		cp ./tex.snippets $HOME/.vim/UltiSnips
else 
		mkdir -p $HOME/.vim/UltiSnips
		cp ./tex.snippets $HOME/.vim/UltiSnips
fi
 

echo "[7/7] Install them manually"
echo "Hey, it's almost done now. But there is one more thing to do "
echo "manually. Open vim and type <:PlugInstall PlugName> to install"
echo "For example: <:PlugInstall vimtex>."
echo "Then you can have a good time texing"








