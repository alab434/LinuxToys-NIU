#!/bin/bash
#
# name: LinuxToys
# icon: gnome-terminal
# description: A collection of tools for Linux in a user-friendly way.
# keywords: linux, scripts

## Caminho para os scripts
SCRIPTS_PASTA="$HOME/bash/linuxtoys"

## Links
LINK_BASE="https://github.com/psygreg/linuxtoys"
declare -A LINK_AJUDA=(
  ["Ajuda"]="$LINK_BASE/wiki"
  ["Utilitários"]="$LINK_BASE/Utilities"
  ["Produtividade"]="$LINK_BASE/Office-&-Productivity"
  ["Jogos"]="$LINK_BASE/Gaming"
  ["Extras"]="$LINK_BASE/Extras"
  ["Desenvolvedores"]="$LINK_BASE/Developers"
  ["Otimizar"]="$LINK_BASE/Optimized-Defaults"
)
## Links Externos
declare -A LINK_EXTERNO=(
  ["GitHub"]="$LINK_BASE"
  ["Doações"]="https://ko-fi.com/psygreg"
  ["YouTube"]="https://www.youtube.com/channel/UCPxdFwXHOuxR2eVGJaprD6w"
)
## Separadores
declare -A SEPARADOR=(
  ["icones"]="_______"
  ["comandos"]="____________________"
  ["descricao"]="_______________________________________________________________________________________"
)
## Resolução da Janela: FWVGA
declare -A RESOLUCAO=(
  ["largura"]=854
  ["altura"]=480
)

## Janela Principal
while true; do
  CATEGORIA=$(zenity --list \
    --title="🐧 LinuxToys" \
    --text="Selecione uma categoria:" \
    --window-icon="utilities-tools" \
    --column="    📁" --column="Categoria" --column="Descrição" \
      "    🧰" "Utilitários" "These apps will be installed as flatpaks when feasible to do so." \
      "    📅" "Produtividade" "Most of these applications are installed as flatpaks, as for a professional environment." \
      "    👾" "Jogos" "The Gaming menu options install packages as displayed by themselves." \
      "    🧩" "Extras" "Here you can find the performance tweaks that are also part of the Optimized Defaults." \
      "    🧑‍💻" "Desenvolvedores" "Most of these will be installed as native packages as developers usually require." \
      ${SEPARADOR["icones"]} ${SEPARADOR["comandos"]} ${SEPARADOR["descricao"]} \
      "    🛠️" "Otimizar" "The included resources in Optimized Defaults." \
      "    🧔‍♂️" "Seleção do Psygreg" "Isto instalará as escolhas recomendadas do Psygreg para jogos e qualidade de vida." \
      "    📺" "Modo Console" "..." \
      ${SEPARADOR["icones"]} ${SEPARADOR["comandos"]} ${SEPARADOR["descricao"]} \
      "    🐙" "GitHub" "A collection of tools for Linux in a user-friendly way..." \
      "    💰" "Doações" "Buy a coffe for Victor “psygreg” Gregory..." \
      ${SEPARADOR["icones"]} ${SEPARADOR["comandos"]} ${SEPARADOR["descricao"]} \
      "    ❓" "Ajuda" "LinuxToys documentation..." \
      "    ℹ️" "Sobre" "" \
    --width=${RESOLUCAO["largura"]} --height=${RESOLUCAO["altura"]} \
    --ok-label="📂 Abrir Categoria Selecionada" --cancel-label="🚪 Sair do App" \
    --print-column=2)

  ## 
  [ -z "$CATEGORIA" ] && exit 0
  
  ## Ignorar separador
  if [[ "$CATEGORIA" == ${SEPARADOR["comandos"]} ]]; then
    continue
  fi

  ## Chama a ajuda da categoria
  if [[ "$CATEGORIA" == "Ajuda" ]]; then
    if zenity --question --window-icon="help" \
    --title="🐧 LinuxToys" \
    --text="Deseja abrir a página de $CATEGORIA no navegador?"; then
      xdg-open "${LINK_EXTERNO[$CATEGORIA]}"
    fi
    continue
  fi

  if [[ "$CATEGORIA" == "GitHub" ]]; then
    if zenity --question --window-icon="help" \
    --title="🐧 LinuxToys" \
    --text="Deseja abrir a página do $CATEGORIA no navegador?"; then
      xdg-open "${LINK_EXTERNO[$CATEGORIA]}"
    fi
    continue
  fi

  if [[ "$CATEGORIA" == "Doações" ]]; then
    if zenity --question --window-icon="help" \
      --title="🐧 LinuxToys" \
      --text="Deseja abrir a página de $CATEGORIA no navegador?"; then
      xdg-open "${LINK_EXTERNO[$CATEGORIA]}"
    fi
    continue
  fi

  if [[ "$CATEGORIA" == "Sobre" ]]; then
   zenity --info --window-icon="about" \
      --title="Sobre" \
      --text="🐧 LinuxToys\nVersão: 9.999.99\nFeito com <3 por psygreg\nLicença: GNU GPLv3"
      continue
  fi

  ## Lista das Categorias
  case "$CATEGORIA" in
    "Utilitários")
      OPTIONS=(
        FALSE "Mission Center" "A modern system monitor for Linux, providing real-time CPU, GPU."
        FALSE "Solaar" "A Linux device manager for Logitech’s Unifying Receiver"
        FALSE "Flatseal" "A permissions manager for Flatpak applications, allowing users to review."
        # ${SEPARADOR["icones"]} ${SEPARADOR["comandos"]} ${SEPARADOR["descricao"]}
        # "   ❓" "Ajuda" "Mostrar instruções para: $CATEGORIA..."
      )
      ;;
    "Produtividade")
      OPTIONS=(
        "   🌍" "Zen Browser" "A Firefox-based browser focused on performance and minimalism."
        "   📄" "OnlyOffice" "An office application suite that matches Microsoft's offering more."
        # ${SEPARADOR["icones"]} ${SEPARADOR["comandos"]} ${SEPARADOR["descricao"]}
        # "   ❓" "Ajuda" "Mostrar instruções para: $CATEGORIA..."
      )
      ;;
    "Jogos")
      OPTIONS=(
        "   🦦" "Lutris" "The swiss army knife of gaming on Linux."
        "   🔢" "Heroic Games Launcher" "A launcher made to manage games from Epic Games Store, GOG."
        # ${SEPARADOR["icones"]} ${SEPARADOR["comandos"]} ${SEPARADOR["descricao"]}
        # "   ❓" "Ajuda" "Mostrar instruções para: $CATEGORIA..."
      )
      ;;
    "Extras")
      OPTIONS=(
        "   🛡️" "Firewall Setup" "Sets up a firewall with ideal defaults using ufw."
        "   🔁" "Swapfile" "Creates a 8GB file that takes the role that would usually be taken by a swap partition."
        "   📦" "Flatpak Enabler" "Installs flatpak on your system."
        # ${SEPARADOR["icones"]} ${SEPARADOR["comandos"]} ${SEPARADOR["descricao"]}
        # "   ❓" "Ajuda" "Mostrar instruções para: $CATEGORIA..."
      )
      ;;
    "Desenvolvedores")
      OPTIONS=(
        "   📝" "VSCodium" "A telemetry-free build of Visual Studio Code."
        # ${SEPARADOR["icones"]} ${SEPARADOR["comandos"]} ${SEPARADOR["descricao"]}
        # "   ❓" "Ajuda" "Mostrar instruções para: $CATEGORIA..."
      )
      ;;
    *)
      zenity --error --text="Categoria selecionada inválida!"
      continue
      ;;
  esac

  ## Janela Categorias
  SCRIPT_ESCOLHIDO=$(zenity --list --checklist \
    --title="🐧 LinuxToys  >  Categoria  >  $CATEGORIA" \
    --text="Selecione o script para executar:" \
    --column="📋" --column="Script" --column="Descrição" \
    "${OPTIONS[@]}" \
    --width=${RESOLUCAO["largura"]} --height=${RESOLUCAO["altura"]} \
    --ok-label="🚀 Executar Scripts Selecionados" --cancel-label="↩️ Voltar" \
    --print-column=2)

  [ -z "$SCRIPT_ESCOLHIDO" ] && continue

  ## Abre a ajuda
  if [[ "$SCRIPT_ESCOLHIDO" == "Ajuda" ]]; then
    if zenity --question \
    --title="🐧 LinuxToys  >  Ajuda  >  $CATEGORIA" \
    --text="Deseja abrir a página de ajuda para $CATEGORIA?" \
    --window-icon="help"; then
      xdg-open "${LINK_AJUDA[$CATEGORIA]}"
    fi
    continue
  fi

  ## Normaliza nome do arquivo para minusculas, underline e remove acentos
  SCRIPT_NOME=$(echo "$SCRIPT_ESCOLHIDO" | iconv -f utf8 -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | tr -cd '[:alnum:]_')

  ## Executa o script
  SCRIPT_CAMINHO="$SCRIPTS_PASTA/$CATEGORIA/$SCRIPT_NOME.sh"
  if [[ -f "$SCRIPT_CAMINHO" ]]; then
    bash "$SCRIPT_CAMINHO"
  else
    zenity --error --text="Script não encontrado: $SCRIPT_CAMINHO"
  fi

done

