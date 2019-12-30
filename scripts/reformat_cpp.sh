#!/bin/sh
set -eu

SCRIPT_DIR=$(dirname "$0")
case $SCRIPT_DIR in
    "/"*)
        ;;
    ".")
        SCRIPT_DIR=$(pwd)
        ;;
    *)
        SCRIPT_DIR=$(pwd)/$(dirname "$0")
        ;;
esac

TOPDIR="$SCRIPT_DIR/.."

for i in "$TOPDIR"/include/proj/*.hpp "$TOPDIR"/include/proj/internal/*.hpp \
         "$TOPDIR"/src/iso19111/*.cpp "$TOPDIR"/test/unit/*.cpp "$TOPDIR"/src/apps/projinfo.cpp \
         "$TOPDIR"/src/tracing.cpp "$TOPDIR"/src/grids.hpp "$TOPDIR"/src/grids.cpp \
         "$TOPDIR"/src/filemanager.hpp "$TOPDIR"/src/filemanager.cpp \
         "$TOPDIR"/src/sqlite3.hpp "$TOPDIR"/src/sqlite3.cpp ; do
    if ! echo "$i" | grep -q "lru_cache.hpp"; then
        "$SCRIPT_DIR"/reformat.sh "$i";
    fi
done
