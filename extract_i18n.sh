#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsgemrwanda/locale

pot-create -o unicorecmsgemrwanda/locale/unicorecmsgemrwanda.pot unicorecmsgemrwanda/

declare -a arr=("eng_GB" "kin_RW")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsgemrwanda/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsgemrwanda/locale/""$lang""/LC_MESSAGES/unicorecmsgemrwanda.po" ]; then
        msginit -l $lang -i unicorecmsgemrwanda/locale/unicorecmsgemrwanda.pot -o unicorecmsgemrwanda/locale/$lang/LC_MESSAGES/unicorecmsgemrwanda.po
    fi

    msgmerge --update unicorecmsgemrwanda/locale/$lang/LC_MESSAGES/unicorecmsgemrwanda.po unicorecmsgemrwanda/locale/unicorecmsgemrwanda.pot
    msgfmt unicorecmsgemrwanda/locale/$lang/LC_MESSAGES/*.po -o unicorecmsgemrwanda/locale/$lang/LC_MESSAGES/unicorecmsgemrwanda.mo
done
