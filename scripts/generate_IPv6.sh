# Generate node IP (IPv6) 

#!/bin/bash

GlobalID="xx.xxxx.xxxx"
SubnetID="yyyy"

ULA="fd$GlobalID:$SubnetID::/64"

echo $ULA
