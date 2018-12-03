SPELLING_MISTAKES="$(cat "$1" | aspell list -t -d en_US | grep -i -v -f dictionary.txt)";

if [[ "${SPELLING_MISTAKES}" != "" ]]
then
    echo "Spelling mistakes found in $1"
    echo "${SPELLING_MISTAKES}" | sed "s/^/    /g"
    exit 1
fi

