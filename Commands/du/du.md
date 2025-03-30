## Comando para encontrar o top five arquivos e diretórios com maior tamanho

Some of you would like to display the above result in human readable format. i.e you might want to display the largest files in KB, MB, or GB.

>du -hs * | sort -rh | head -5

To display the largest folders/files including the sub-directories, run:
>du -Sh | sort -rh | head -5