#!/bin/sh

# set -xe

CFLAGS="-Wall -Wextra -std=c11 -pedantic -ggdb -I./include/"

os=$(uname)
case "$os" in
    Linux*)
        echo "Linux detected."
        CC=gcc
        LIBS="-lglfw -lGL -ldl -lm"
        ;;
    Darwin*)
        echo "macOS detected."
        CC=clang
        LIBS="-L/usr/local/lib -lglfw -framework OpenGL -ldl"
        ;;
    MINGW* | CYGWIN*)
        echo "Windows detected."
        CC=gcc
        LIBS="-lglfw3 -lopengl32 -lgdi32"
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac

set -xe

$CC $CFLAGS -o main main.c $LIBS
