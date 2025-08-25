#!/bin/bash

# Tipo de build
BUILD_TYPE=${1:-Debug}
# Diretório (padrão .)
PROJECT_DIR=${2:-.}

PROJECT_DIR=$(realpath -m "$PROJECT_DIR")
cd "$PROJECT_DIR" || { echo "Diretório inválido: $PROJECT_DIR"; exit 1; }

PROJECT_NAME=$(basename "$PROJECT_DIR")

BIN="bin/$BUILD_TYPE/$PROJECT_NAME"
OBJ_DIR="obj/$BUILD_TYPE"

mkdir -p "$OBJ_DIR" "bin/$BUILD_TYPE"

echo "Compilando projeto '$PROJECT_NAME' em $BUILD_TYPE..."
echo "Diretório: $PROJECT_DIR"

if [ "$BUILD_TYPE" == "Debug" ]; then
    CXXFLAGS="-Wall -fexceptions -g"
elif [ "$BUILD_TYPE" == "Release" ]; then
    CXXFLAGS="-Wall -fexceptions -O2 -s"
else
    echo "Modo inválido. Use: Debug ou Release"
    exit 1
fi

CPP_FILES=$(find . -maxdepth 1 -name "*.cpp")
OBJ_FILES=""

for src in $CPP_FILES; do
    fname=$(basename "$src")
    objfile="$OBJ_DIR/${fname%.cpp}.o"
    echo "Compilando $src -> $objfile"
    g++ $CXXFLAGS -c "$src" -o "$objfile"
    OBJ_FILES="$OBJ_FILES $objfile"
done

echo "Linkando -> $BIN"
g++ $OBJ_FILES -o "$BIN"

if [ -f "$BIN" ]; then
    echo -e "\n--- Saída do programa ---"
    "./$BIN"
    echo -e "\n-------------------------"
fi
