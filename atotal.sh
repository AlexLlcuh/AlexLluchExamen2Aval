#!/bin/bash


calculate_total() {
    data_file="$1.txt"
    if [[ ! -f "$data_file" ]]; then
        echo "No se encontran datos para la ciudad $1."
        return
    fi
    total=0
    while read -r line; do
        usage=$(echo "$line" | cut -d' ' -f2)
        total=$((total + usage))
    done < "$data_file"
    echo "El consumo total de la ciudad $1 es: $total"
}


while true; do
    read -p "Introduce el nombre de la ciudad: " city
    calculate_total "$city"
    if [[ -f "$city.txt" ]]; then
        break
    fi
done