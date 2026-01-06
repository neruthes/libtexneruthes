#!/bin/bash

case "$1" in
    *.typ )
        PPI=600 typst c --root . "$1" --input USE_NOTO=1
        pdf_path="${1/.typ/.pdf}"
        if [[ -e "$pdf_path" ]]; then
            dirname "_dist/$pdf_path" | xargs mkdir -p &&
            mv "$pdf_path" "_dist/$pdf_path" &&
            realpath "_dist/$pdf_path" | xargs du -h
        fi
        ;;
esac
