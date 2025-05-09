#!/bin/sh

font_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
font_file="HackNerdFontMono-Regular.ttf"

theme() {
    cat <<EOF > ~/.termux/colors.properties
        ! -----------------------------------------------------------------------------
        ! File: gruvbox-dark.xresources
        ! Description: Retro groove colorscheme generalized
        ! Author: morhetz <morhetz@gmail.com>
        ! Source: https://github.com/morhetz/gruvbox-generalized
        ! Last Modified: 6 Sep 2014
        ! -----------------------------------------------------------------------------
        
        ! hard contrast: background: #1d2021
        background: #282828
        ! background: #282828
        ! soft contrast: background: #32302f
        foreground: #ebdbb2
        ! Black + DarkGrey
        color0:  #282828
        color8:  #928374
        ! DarkRed + Red
        color1:  #cc241d
        color9:  #fb4934
        ! DarkGreen + Green
        color2:  #98971a
        color10: #b8bb26
        ! DarkYellow + Yellow
        color3:  #d79921
        color11: #fabd2f
        ! DarkBlue + Blue
        color4:  #458588
        color12: #83a598
        ! DarkMagenta + Magenta
        color5:  #b16286
        color13: #d3869b
        ! DarkCyan + Cyan
        color6:  #689d6a
        color14: #8ec07c
        ! LightGrey + White
        color7:  #a89984
        color15: #ebdbb2
EOF
}

# Installs nerd font
font() {
    pkg update && pkg upgrade -y
    pkg install unzip curl -y
    curl -L "$font_url" -o font.zip
    unzip font.zip -d font
    cp "font/$font_file" ~/.termux/font.ttf
}

theme
font
termux-reload-settings
