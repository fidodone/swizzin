#!/bin/bash
fila="LOCAL"

if pidof -o %PPID -x "$0"; then
    exit 1
fi

{
    echo ""
    echo ""
    echo "+++ Iniciando serviço: $(date "+%d/%m/%Y - %H:%M:%S") +++"
} > PASTADELOG

while true; do

    let "cyclecount++"
    if [[ $cyclecount -gt 4294967295 ]]; then
        cyclecount=0
    fi

    {
        echo ""
        echo "--- Inicio do ciclo $cyclecount: $(date "+%d/%m/%Y - %H:%M:%S") ---"
        echo ""
        echo ""
        echo "Procurando por arquivos na fila de upload..."
        echo ""
        echo ""
    } >> PASTADELOG

    if [[ $(find "$fila" -type f -mmin +2 | wc -l) -gt 0 ]]; then
        rclone move "$fila" "USER:/NixonSeedBox" \
            --transfers=2 \
            --tpslimit=2 \
            --checkers=2 \
            --min-age=2m \
            --bwlimit=16M \
            --no-traverse \
            --fast-list \
            --stats=30s \
            --exclude="**_HIDDEN~" \
            --exclude=".unionfs/**" \
            --exclude="**partial~" \
            --exclude=".unionfs-fuse/**" \
            --exclude=".fuse_hidden**" \
            --exclude="**.grab/**" \
            --exclude="**qbittorrent**" \
            --exclude="**rutorrent**" \
            --exclude="**ignore**" \
            --exclude="**inProgress**" \
            --log-level INFO \
            --delete-empty-src-dirs 2>&1 | tee -a PASTADELOG

        {
            echo ""
            echo " --- Upload Finalizado! --- "
            echo ""
        } >> PASTADELOG
    else
        {
            echo "Não há arquivos na fila de upload!"
            echo ""
            echo ""
        } >> PASTADELOG
    fi
    {
        echo "--- Ciclo $cyclecount completo em: $(date "+%d/%m/%Y - %H:%M:%S") ---"
        echo ""
        echo ""
    } >> PASTADELOG

    sleep 120
done
