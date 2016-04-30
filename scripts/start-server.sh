#!/usr/bin/env bash

node ./scripts/gen_keys.js

node ./bin/key_server.js | node ./bin/notifier.js >/dev/null
exit $PIPESTATUS[0]
