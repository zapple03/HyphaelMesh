# Generate node IP (IPv6) 

#!/bin/bash

IPV6=$(printf "%x:%x:%x\n" $((RANDOM % 256)) $((RANDOM % 65536)) $((RANDOM % 65536)))

