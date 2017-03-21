#!/bin/sh

DEBUG=

if [ -n "${DEBUG}" ]; then
  >&2 cat /src/.codacy.json
  >&2 echo
fi

TOOL=$(cat /src/.codacy.json | jq -r .tools[].name)

if [ "${TOOL}" != "vera++" ]; then
  >&2 echo "Wrong tool requested: \"${TOOL}\""
  exit 1
fi

FILES=$(jq -r '..|.files? | select(. != null) | reduce .[] as $x (""; . + " /src/\($x)")' /src/.codacy.json)
RULES=$(jq -r '..|.patterns? | select(. != null) | reduce .[].patternId? as $x (""; . + " -R \($x)")' /src/.codacy.json)
PARAMS=$(jq  -r '..|.patterns? | select(. != null) | reduce .[].parameters[]? as $x (""; . + " -P \($x.name)=\($x.value)")' /src/.codacy.json)
COMMAND="vera++ --show-rule ${RULES} ${PARAMS} ${FILES}"

if [ -n "${DEBUG}" ]; then
  >&2 echo "RULES = \"${RULES}\""
  >&2 echo "FILES = \"${FILES}\""
  >&2 echo "PARAMS = \"${PARAMS}\""
  >&2 echo "COMMAND = \"${COMMAND}\""
fi

unset MESSAGE
if [ -n "${RULES}" ]; then
  OUT=$(${COMMAND} | sed 's/\\/\\\\/g')
  if [ -n "${DEBUG}" ]; then
    >&2 echo "OUT =\n${OUT}"
  fi
  MESSAGE=$(echo "${OUT}" | sed 's/\\/\\\\/g' | awk 'BEGIN { FS = ": ?"; ORS = ""} {printf "{\"filename\":\""$1"\",\"message\":\""$4"\",\"patternId\":\""$3"\",\"line\":"$2"}\n" }' | sed 's|/src/||g')
else
  if [ -n "${DEBUG}" ]; then
    >&2 echo "NOT RUNNING"
  fi
fi

if [ -z "${MESSAGE}" ]; then
  if [ -n "${DEBUG}" ]; then
    >&2 echo "MESSAGE is empty"
  fi
  # do nothing
else
  if [ -n "${DEBUG}" ]; then
    >&2 echo "MESSAGE = \n${MESSAGE}"
  fi
  echo "${MESSAGE}"
fi
