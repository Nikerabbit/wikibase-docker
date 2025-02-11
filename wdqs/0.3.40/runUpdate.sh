#!/usr/bin/env bash
# This file is provided by the wikibase/wdqs docker image.

cd /wdqs

# TODO env vars for entity namespaces, scheme and other settings
/wait-for-it.sh $WIKIBASE_HOST:80 -t 300 -- \
/wait-for-it.sh $WDQS_HOST:$WDQS_PORT -t 300 -- \

WIKIBASE_CONCEPT_URI="${WIKIBASE_CONCEPT_URI:-${WIKIBASE_SCHEME}://${WIKIBASE_HOST}}"
./runUpdate.sh -h http://$WDQS_HOST:$WDQS_PORT -- --wikibaseUrl $WIKIBASE_SCHEME://$WIKIBASE_HOST --conceptUri $WIKIBASE_CONCEPT_URI --entityNamespaces $WDQS_ENTITY_NAMESPACES
