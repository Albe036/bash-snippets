#!/bin/bash
echo "Today " `date`
echo -e "------------------------"
#Manejo de la variable de sistema EXIT_STATUS
SUCCESS_CODE=0
ls ./data 2>/dev/null 
#2>/dev/null --> redirecciona el error a la nada, es decir, no se muestra en pantalla
err_code=$?
if [ $err_code -ne $SUCCESS_CODE ]; then
    echo "La ruta no existe"
else
    echo "La ruta existe!!"
    for file in ./data/*; do
        echo "files --> $file"
    done
fi
#$? --> 0 Exito! Ruta encontrada
#$? --> 2 Error! Ruta no encontrada

echo "End program"

#$? --> 0 Exito!
#$? --> 1 Error!
#$? --> 127 Comando no encontrado!
#$? --> 130 Terminado por el usuario!
