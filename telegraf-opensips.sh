#!/bin/bash
# Author: Akhil Jalagam

active_calls=`sudo /usr/local/sbin/opensipsctl fifo dlg_list | grep dialog: | wc -l`
echo "{\"active_calls\": $active_calls}"
