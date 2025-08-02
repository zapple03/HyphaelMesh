# Detects usable system interfaces, MACs, IPs

#!/bin/bash

# Get all default routes with their metrics and interfaces
mapfile -t ROUTES < <(ip route show default | awk '{for(i=1;i<=NF;i++) if ($i=="dev") iface=$(i+1); else if ($i=="metric") metric=$(i+1)} END {print metric, iface}')

# Initialize
METRIC=99999
IFACE=""

for LINE in "${ROUTES[@]}"; do
    METRIC=$(echo "$LINE" | awk '{print $1}')
    IFACE=$(echo "$LINE" | awk '{print $2}')
    
    # Ensure the interface is up
    if ip link show "$IFACE" | grep -q "state UP"; then
	# Find the route with the lowest metric
        if (( METRIC < LOWEST_METRIC )); then
          METRIC=$METRIC
	  IFACE=$IFACE     
        fi
    fi
done

if [ -n "$IFACE" ]; then
    echo "Best interface: $IFACE (metric $METRIC)"
else
    echo "No active wireless interface with a default route found."
fi
