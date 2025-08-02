#increment number of nodes (represented in TopNodeInt.txt) when called

#!/bin/bash

OldTop=$(head ./configs/TopNodeInt.txt | awk '{print $2}')

NewTop=$(($OldTop+1))
#update stored value for number of nodes
sed -i "s/$OldTop/$NewTop/" ./configs/TopNodeInt.txt
