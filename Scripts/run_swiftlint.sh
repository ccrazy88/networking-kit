#!/bin/sh

if which swiftlint >/dev/null; then
    swiftlint
else
    echo "[warning] cannot run swiftlint because it isn't installed"
fi
