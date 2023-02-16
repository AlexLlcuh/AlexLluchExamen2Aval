#!/bin/bash

print_min_max() {
    data_file="$1.txt"
    if [[ ! -f "$data_file" ]]; then
        echo "No se encuentran los datos para la ciudad $1."
        return
    fi

    max_uso=0
    min_uso=99999999
    max_mes=0
    min_mes=0
    max_año=0
    min_año=0

    while read -r line; do

        mes=$(echo "$linea" | cut -d' ' -f1)
        año=$(echo "$linea" | cut -d' ' -f3)
        Uso=$(echo "$linea" | cut -d' ' -f2)

        if (( uso> max_uso )); then
            max_uso=$uso
            max_mes=$mes
            max_año=$year
        fi
        if (( uso < min_uso )); then
            min_uso=$uso
            min_mes=$mes
            min_año=$year
        fi
    done < "$data_file"

    echo "Ciudad: $1"
    echo "Consumo máximo: $max_uso kWh ($max_mes/$max_year)"
    echo "Consumo mínimo: $min_uso kWh ($min_mes/$min_year)"
}


if [[ $# -ne 1 ]]; then
    echo "Uso: $0 [nombre de la ciudad]"
    exit 1
fi

print_min_max "$1"