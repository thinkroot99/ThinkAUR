#!/bin/bash

# Verificăm dacă pachetul dialog este instalat și îl instalăm dacă nu este
if ! command -v dialog &> /dev/null; then
    echo "Instalez dialog..."
    sudo pacman -S --noconfirm dialog
fi

# Definirea listei cu AUR Helper-uri și descrierilor lor în română
aur_helpers=("yay" "paru" "aura" "pikaur" "aurman" "pacseek")
descriptions=("yay - Un AUR Helper versatil și ușor de folosit. Poate sincroniza baza de date AUR, căută pachete și multe altele."
              "paru - Un AUR Helper scris în Rust cu accent pe viteza și eficiență. Suportă opțiuni de căutare avansată și instalare recursivă."
              "aura - Un AUR Helper scris în Haskell, cunoscut pentru performanță și flexibilitate. Vine cu opțiuni avansate pentru gestionarea pachetelor."
              "pikaur - Un AUR Helper cu o sintaxă similară cu yaourt, care poate căuta și instala pachete AUR."
              "aurman - Un AUR Helper minimalist scris în Perl. Concentrează pe simplitate și performanță."
              "pacseek - Un instrument simplu pentru căutarea pachetelor Arch și AUR.")

# Funcție pentru afișarea meniului de selecție
show_menu() {
    dialog --clear --backtitle "Alege un AUR Helper" \
        --title "Instalare AUR Helper" \
        --menu "Alege un AUR Helper:" 20 70 7 \
        "${aur_helpers[0]}" "${descriptions[0]}" \
        "${aur_helpers[1]}" "${descriptions[1]}" \
        "${aur_helpers[2]}" "${descriptions[2]}" \
        "${aur_helpers[3]}" "${descriptions[3]}" \
        "${aur_helpers[4]}" "${descriptions[4]}" \
        "${aur_helpers[5]}" "${descriptions[5]}" \
        2>&1 >/dev/tty
}

# Afișarea meniului și preluarea alegerii utilizatorului
choice=$(show_menu)

# Instalarea AUR Helper selectat
case $choice in
    "${aur_helpers[0]}")
        echo "Instalez yay..."
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        cd ..
        rm -rf yay
        ;;
    "${aur_helpers[1]}")
        echo "Instalez paru..."
        sudo pacman -S --needed base-devel
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        cd ..
        rm -rf paru
        ;;
    "${aur_helpers[2]}")
        echo "Instalez aura..."
        sudo pacman -S --needed base-devel
        git clone https://aur.archlinux.org/aura.git
        cd aura
        makepkg -si
        cd ..
        rm -rf aura
        ;;
    "${aur_helpers[3]}")
        echo "Instalez pikaur..."
        sudo pacman -S --needed base-devel
        git clone https://aur.archlinux.org/pikaur.git
        cd pikaur
        makepkg -si
        cd ..
        rm -rf pikaur
        ;;
    "${aur_helpers[4]}")
        echo "Instalez aurman..."
        sudo pacman -S --needed perl
        git clone https://aur.archlinux.org/aurman.git
        cd aurman
        makepkg -si
        cd ..
        rm -rf aurman
        ;;
    "${aur_helpers[5]}")
        echo "Instalez pacseek..."
        sudo pacman -S --needed base-devel
        git clone https://aur.archlinux.org/pacseek.git
        cd pacseek
        makepkg -si
        cd ..
        rm -rf pacseek
        ;;
    *)
        echo "Nicio selecție validă."
        ;;
esac
