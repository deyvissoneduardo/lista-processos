#!/bin/bash

# comando que realiza a listaegem dos processos
list_processo=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for pid in $list_process
do
	# lista nomes do processo
	echo $(ps -p $pid -o comm=)
done
