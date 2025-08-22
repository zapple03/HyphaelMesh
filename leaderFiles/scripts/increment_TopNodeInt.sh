#increment number of nodes (represented in TopNodeInt.txt) when called

#!/bin/bash

#pull previous node number from file
OldTop=$(head ./configs/TopNodeInt.txt | awk '{print $2}')
#update stored value for node number
sed -i "s/$OldTop/$(($OldTop+1))/" ./configs/TopNodeInt.txt
