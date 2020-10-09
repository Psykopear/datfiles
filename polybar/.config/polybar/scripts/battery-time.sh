#!/bin/bash
upower -i `upower -e | grep BAT` | grep -E "to\ empty|to\ full" | cut -d':' -f 2 | sed -e 's/^ *//'
