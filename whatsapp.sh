#!/bin/bash
phno=$(termux-clipboard-get)
last_ten=${phno: -10}
#echo Opening https://wa.me/91$last_ten
termux-open-url https://wa.me/91$last_ten
exit

#This script can be used to open whatsapp chat box of any unsaved mobile number currently in the clipboard.
#This will only work for Indian Numbers with (+91) prefix. For other countries, you may change the prefix number.
