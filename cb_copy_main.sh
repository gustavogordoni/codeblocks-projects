#!/bin/bash

BASE_DIR="$(pwd)"
DEST_DIR="$BASE_DIR/moodle"

mkdir -p "$DEST_DIR"

for dir in */; do
    
    if [ -d "$dir" ]; then        
        CBP_FILE=$(ls "$dir"/*.cbp 2>/dev/null | head -n 1)
        MAIN_CPP=$(ls "$dir"/*.cpp 2>/dev/null | grep "main.cpp" | head -n 1)
    
        if [ -n "$CBP_FILE" ] && [ -n "$MAIN_CPP" ]; then
            PROJ_NAME=$(basename "$CBP_FILE" .cbp)
            DEST_FILE="$DEST_DIR/$PROJ_NAME.cpp"

            echo "Copiando $MAIN_CPP → $DEST_FILE"
            cp "$MAIN_CPP" "$DEST_FILE"
        fi
    fi
done

echo "Cópia concluída! Arquivos estão em $DEST_DIR"
