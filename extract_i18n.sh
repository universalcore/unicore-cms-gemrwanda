#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsgemrwanda/locale

pot-create -o unicorecmsgemrwanda/locale/unicorecmsgemrwanda.pot unicorecmsgemrwanda/

declare -a arr=(
    "eng_GB" "tha_TH" "ind_ID" "swa_TZ" "hin_IN" "fre_FR" "spa_CO" "spa_MX"
    "spa_AR" "mar_IN" "tel_IN" "por_PT" "mal_IN" "guj_IN" "tam_IN" "urd_IN"
    "urd_PK" "ben_IN" "ben_BD" "nep_NP" "fil_PH")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsgemrwanda/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsgemrwanda/locale/""$lang""/LC_MESSAGES/unicorecmsgemrwanda.po" ]; then
        msginit -l $lang -i unicorecmsgemrwanda/locale/unicorecmsgemrwanda.pot -o unicorecmsgemrwanda/locale/$lang/LC_MESSAGES/unicorecmsgemrwanda.po
    fi

    msgmerge --update unicorecmsgemrwanda/locale/$lang/LC_MESSAGES/unicorecmsgemrwanda.po unicorecmsgemrwanda/locale/unicorecmsgemrwanda.pot
    msgfmt unicorecmsgemrwanda/locale/$lang/LC_MESSAGES/*.po -o unicorecmsgemrwanda/locale/$lang/LC_MESSAGES/unicorecmsgemrwanda.mo
done
