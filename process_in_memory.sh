#!/bin/bash

# pasta de salva logs
if [ ! -d log ]
then
	mkdir log
fi

process_in_memory(){
	# comando que realiza a listaegem dos processos
	list_processo=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

	for pid in $list_process
	do
		# lista nomes do processo
		name_process=$(ps -p $pid -o comm=)
		# adc data e hora da execucao no nome do processo
		echo -n $(date +%F, %H:%M:%S,) >> log/$name_process.log
		# pega o tamanho do processo
		size_process=$(ps -p $pid -o size | grep [0-9])
		# transforma em megabyte
		echo "$(bc <<< "scale=2;$size_process/1024") MB" >> log/$name_process.log
	done
}

process_in_memory
if [ $? -eq 0 ]
then
	echo "realizado com sucesso"
else
	echo "ocorreu erros no processo"
fi
