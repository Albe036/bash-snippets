#!/bin/bash
pathOne="./dirOne"
pathTwo="./dirTwo"

#Comprobacion de argumentos
if [ $# -eq 0 ]; then
    echo "Rutas por defecto --> $pathOne y $pathTwo"
elif [ $# -eq 1 ]; then
    echo "Error! Se necesitan 2 argumentos, se ha proporcionado solo 1"
    exit 1
elif [ $# -gt 2 ]; then
    echo "Error! Solo se permiten 2 argumentos"
    exit 1
fi

if [[ ! -d "$pathOne" ]]; then
  echo "La ruta $pathOne no existe"
  exit 1
fi
if [[ ! -d "$pathTwo" ]]; then
  echo "La ruta $pathTwo no existe"
  exit 1
fi
echo "-----------------------------"
echo "Numero de archivos en cada ruta:"
totalFilesOne=$(ls -1q "$pathOne" | wc -l)
totalFilesTwo=$(ls -1q "$pathTwo" | wc -l)
echo "Total de archivos en $pathOne --> $totalFilesOne"
echo "Total de archivos en $pathTwo --> $totalFilesTwo"

echo "-----------------------------"
echo "Comparando archivos en ambas rutas:"
# Iteramos sobre los archivos de la primera carpeta
for file in $(ls "$pathOne"); do
    if [[ ! -e "$pathTwo/$file" ]]; then
        echo -e "\e[31monly at path one: --> $file\e[0m"
    fi
done
for file in $(ls "$pathTwo"); do
    if [[ ! -e "$pathOne/$file" ]]; then
        echo -e "\e[31monly at path two: --> $file\e[0m"
    fi
done
interFiles=($(comm -12 <(ls "$pathOne" | sort) <(ls "$pathTwo" | sort)))
echo "-----------------------------"
if [ ${#interFiles[@]} -eq 0 ]; then
    echo "No hay archivos en común."
else
    echo "Se encontraron ${#interFiles[@]} archivos en común:"
    for file in "${interFiles[@]}"; do
        diff_count=$(diff -u "$pathOne/$file" "$pathTwo/$file" | grep -E "^[+-][^+-]" | wc -l)
        if [ "$diff_count" -gt 0 ]; then
            echo -e "\e[31m$file -> $diff_count lineas distintas.\e[0m"
        fi
    done
fi