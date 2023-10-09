fingerprint_output=$(termux-fingerprint)
# Example output is shown below:
# {
# "errors": [],
# "failed_attempts": 0,
# "auth_result": "AUTH_RESULT_SUCCESS"
# }

auth_result=$(echo "$fingerprint_output" | grep 'AUTH_RESULT')
if [[ "$auth_result" == *"AUTH_RESULT_SUCCESS"* ]]; then
    termux-clipboard-set $(oathtool -b --totp 'YOUR_SECRET_KEY')
    termux-toast $(oathtool -b --totp 'YOUR_SECRET_KEY')
else
    echo "Authentication failed. Script execution terminated."
    termux-toast "Execution of script failed."
fi
