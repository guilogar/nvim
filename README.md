<u>
    <h4>Configuracion de NeoVIM</h4>
</u>

Configuración Personal del NeoVim, con lldb como debugger para C y C++

Para empezar, eso incluye los archivos para la configuración del vim, ya con el emmet incluido en el autoload.

Para que la configuracion en el NeoVIM funcione, se debe clonar este repositorio en ~/.config/nvim/

Para los plugin de instalación, tan solo hay que hacer <i>git submodule update --init --recursive</i> dentro de ~/.config/nvim/

Después de instalar vim-plug, se debe abrir el editor por primera vez de tal forma: nvim +PlugInstall +BundleInstall

Para que el YouCompleteMe funcione, se nesecita además la versión de vim "compilada" en python.

Para entornos gnome, se soluciona instalando vim-nox, <i>sudo apt-get install vim-nox</i>.

Para el resto de escritorios y distribuciones de Linux, 
este <a href="http://stackoverflow.com/questions/20160902/how-to-solve-requires-python-2-x-support-in-linux-vim-and-it-have-python-2-6-6">post</a> 
de stackoverflow da muy buena información.

PD: Para mas informacion con lldb.nvim, ejecutar ":h lldb" después de instalar el plugin tal y como dice critiqjo en su README.md
('<a href="https://github.com/critiqjo/lldb.nvim">critiqjo/lldb.nvim</a>').
