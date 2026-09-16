ls -la file_and_directory.ext
# not found: return: ls: cannot access 'file_and_directory.ext': No such file or directory
# found: -rw-r--r-- 1 ALOZANO 197121 7077888 Oct  2  2024 file_and_directory.ext

#Buscar archivos o directorios en carpeta y subcarpetas
find . -name "file_and_directory.ext"
#Buscar sin importar minusculas o mayusculas
find . -iname "file_and_directory.ext"
#Buscar por similitures al iniciar o final del archivo
find . -name "*file_and_directory.ext*"