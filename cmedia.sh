#!/bin/bash


calculate_mean() {

    data_file="$1.txt"
    if [[ ! -f "$data_file" ]]; then
        echo "No se encuentran los datos para la ciudad $1."
        return
    fi

    total=0
    num_lines=0
    while read -r line; do
        uso=$(echo "$lineas" | cut -d' ' -f2)
        total=$((total + uso))
        num_lineas=$((num_lineas + 1))
    done < "$data_file"

    mean=$(bc -l <<< "$total/$num_lineas")
    echo "La media de consumo de la ciudad $1 es: $mean"
}

if [[ -z "$1" ]]; then
    echo "Debe introducir una ciudad como parámetro."
else
    calcula_mean "$1"
fi