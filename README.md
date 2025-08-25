# CodeBlocks Projects Helper

Scripts simples para **criar, compilar e executar projetos C++ no estilo do Code::Blocks** diretamente pelo terminal Linux.
A ideia é reproduzir a mesma estrutura de pastas e arquivos (`bin/Debug`, `obj/Debug`, `.cbp`, etc.), para que o projeto continue sendo **totalmente compatível com o Code::Blocks**, mas sem precisar abrir a IDE para tarefas básicas.

---

## Objetivo

* Criar projetos Code::Blocks direto no terminal
* Compilar e rodar rapidamente sem abrir IDE
* Manter compatibilidade total com o Code::Blocks

---

## Instalação

Clone o repositório em um diretório da sua preferência:

```bash
git clone https://github.com/gustavogordoni/codeblocks-projects.git
cd codeblocks-projects/
```

Dê permissão de execução nos scripts:

```bash
chmod +x cb_create_project.sh cb_build_run.sh
```

---

## Uso básico

### Criar um novo projeto

```bash
./cb_create_project.sh NomeDoProjeto [diretorio]
```

* **NomeDoProjeto**: obrigatório, será o nome da pasta e do projeto.
* **diretorio**: opcional. Se omitido, o projeto será criado no diretório atual (`.`).

Exemplos:

```bash
# cria projeto "Teste" no diretório atual
./cb_create_project.sh Teste

# cria projeto "Jogo" na pasta ~/Projetos
./cb_create_project.sh Jogo ~/Projetos

# cria projeto "Calc" um nível acima
./cb_create_project.sh Calc ..
```

---

### Compilar e executar um projeto

```bash
./cb_build_run.sh [Debug|Release] [diretorio]
```

* **Debug|Release**: modo de build (padrão = `Debug`).
* **diretorio**: caminho do projeto (padrão = diretório atual).

Exemplos:

```bash
# compila e roda projeto atual em Debug
./cb_build_run.sh

# compila e roda projeto atual em Release
./cb_build_run.sh Release

# compila projeto "Teste" dentro de ~/Projetos em Debug
./cb_build_run.sh Debug ~/Projetos/Teste
```

O script gera:

* Objetos (`.o`) em `obj/Debug` ou `obj/Release`
* Binário final em `bin/Debug/Projeto` ou `bin/Release/Projeto`
* Executa o binário automaticamente após compilar

---

## Alias no shell

Para facilitar, edite seu `~/.bashrc` ou `~/.zshrc` e adicione:

```bash
alias cbnew='[diretório-script]/cb_create_project.sh'
alias cbbuild='[diretório-script]/cb_build_run.sh'
```
Por exemplo, para caso os scripts estejam em `~/Downloads/codeblocks-projects/` faça:

```bash
alias cbnew='~/Downloads/codeblocks-projects/cb_create_project.sh'
alias cbbuild='~/Downloads/codeblocks-projects/cb_build_run.sh'
```

### Como usar com alias

```bash
# cria projeto "MeuApp" no diretório atual
cbnew MeuApp

# cria projeto "Jogo" em ~/Projetos
cbnew Jogo ~/Projetos

# compila e roda projeto atual em Debug
cbbuild

# compila e roda projeto atual em Release
cbbuild Release

# compila projeto em um diretório específico
cbbuild Debug ~/Projetos/MeuApp
```

---

## Requisitos

* Linux/macOS com **g++** instalado:

  ```bash
  sudo apt install build-essential   # Debian/Ubuntu
  sudo dnf groupinstall "Development Tools"  # Fedora
  ```
* `realpath` (já incluso na maioria das distros)

---

## Estrutura gerada

Um projeto típico criado terá:

```
MeuProjeto/
 ├── bin/
 │   ├── Debug/
 │   │   └── MeuProjeto   (binário compilado Debug)
 │   └── Release/
 │       └── MeuProjeto   (binário compilado Release)
 ├── obj/
 │   ├── Debug/
 │   │   └── main.o
 │   └── Release/
 │       └── main.o
 ├── main.cpp
 └── MeuProjeto.cbp
```

Compatível para abrir direto no **Code::Blocks**.
