#!/bin/bash

uptime | awk '{ if ($4 == "days,") { print $3 "d " $5 } else { print $3 } }' | tr -d ','
