source ./secrets
fingerprint_output=$(termux-fingerprint)
secret=$zerodha_mom
auth_result=$(echo "$fingerprint_output" | grep 'AUTH_RESULT')
if [[ "$auth_result" == *"AUTH_RESULT_SUCCESS"* ]]; then
    termux-clipboard-set $(oathtool -b --totp "$secret")
    termux-toast $(oathtool -b --totp "$secret")
else
    echo "Authentication failed. Script execution terminated."
    termux-toast "Execution of script failed."
fi