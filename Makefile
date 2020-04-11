PREFIX=/usr/share/dict
DATA=/tmp/turkish-words.json
CACHE=${PREFIX}/turkish-words
CACHEDIR=/usr/share/sozlukgovtr/
URL='https://sozluk.gov.tr/autocomplete.json'

imla:
	[ -d ${PREFIX} ] || { mkdir -p ${PREFIX}; sudo chmod 644 ${DATA}; }
	if ! [ -s ${CACHE} ]; then if ! [ -s ${DATA} ]; then curl -so ${DATA} ${URL} || exit 2; fi; jq -r '.[].madde' ${DATA} > ${CACHE}; sudo chmod 644 ${CACHE}; fi
	install imla /usr/local/bin

sozlukgovtr:
	[ -d ${CACHEDIR} ] || { mkdir -p ${CACHEDIR}; sudo chmod 777 ${CACHEDIR}; }
	install sozlukgovtr /usr/local/bin

uninstall:
	rm -f ${DATA}
	rm -f ${CACHE}
	rm -f ${CACHEDIR}
	rm -f /usr/local/bin/imla
	rm -f /usr/local/bin/sozlukgovtr
