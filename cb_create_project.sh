#!/bin/bash

# Pojeto
PROJECT_NAME=$1
# Diretório alvo
TARGET_DIR=${2:-.}

if [ -z "$PROJECT_NAME" ]; then
    echo "Uso: $0 <nome_do_projeto> [diretorio]"
    exit 1
fi

TARGET_DIR=$(realpath -m "$TARGET_DIR")
PROJECT_DIR="$TARGET_DIR/$PROJECT_NAME"

mkdir -p "$PROJECT_DIR/bin/Debug" "$PROJECT_DIR/bin/Release"
mkdir -p "$PROJECT_DIR/obj/Debug" "$PROJECT_DIR/obj/Release"

cat > "$PROJECT_DIR/main.cpp" << 'EOF'
#include <iostream>
using namespace std;

int main() {
    cout << "Hello, World!" << endl;
    return 0;
}
EOF

cat > "$PROJECT_DIR/$PROJECT_NAME.cbp" << EOF
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<CodeBlocks_project_file>
    <FileVersion major="1" minor="6" />
    <Project>
        <Option title="$PROJECT_NAME" />
        <Option pch_mode="2" />
        <Option compiler="gcc" />
        <Build>
            <Target title="Debug">
                <Option output="bin/Debug/$PROJECT_NAME" prefix_auto="1" extension_auto="1" />
                <Option object_output="obj/Debug/" />
                <Option type="1" />
                <Option compiler="gcc" />
                <Compiler>
                    <Add option="-g" />
                </Compiler>
            </Target>
            <Target title="Release">
                <Option output="bin/Release/$PROJECT_NAME" prefix_auto="1" extension_auto="1" />
                <Option object_output="obj/Release/" />
                <Option type="1" />
                <Option compiler="gcc" />
                <Compiler>
                    <Add option="-O2" />
                </Compiler>
                <Linker>
                    <Add option="-s" />
                </Linker>
            </Target>
        </Build>
        <Compiler>
            <Add option="-Wall" />
            <Add option="-fexceptions" />
        </Compiler>
        <Unit filename="main.cpp" />
        <Extensions />
    </Project>
</CodeBlocks_project_file>
EOF

<<<<<<< HEAD
echo "Projeto '$PROJECT_NAME' criado em: $PROJECT_DIR"
=======
echo "Projeto '$PROJECT_NAME' criado em: $PROJECT_DIR"
>>>>>>> cc0402ac6c0ad7f5ba9ad8945b10b9dc8d83b097
