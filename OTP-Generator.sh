# Follwing are pre-requisites for running this script:
# 1. Termux should be installed in your android phone, preferrably from [F-Droid](https://f-droid.org/en/packages/com.termux/).
# 2. Termux API should also be successfully installed.
# 3. [Optional] You can put this script in ~/.shortcut with Termux Widgets installed to create homescreen shortcut action for this termux script.

fingerprint_output=$(termux-fingerprint)
# Example output is shown below:
# {
# "errors": [],
# "failed_attempts": 0,
# "auth_result": "AUTH_RESULT_SUCCESS"
# }

auth_result=$(echo "$fingerprint_output" | grep 'AUTH_RESULT')
# To grab the line containing this text => "auth_result": "AUTH_RESULT_SUCCESS"

if [[ "$auth_result" == *"AUTH_RESULT_SUCCESS"* ]]; then
# If fingerprint authentication is successful, then set the TOTP to clipboard and display as toast
    termux-clipboard-set $(oathtool -b --totp 'YOUR_SECRET_KEY')
    termux-toast $(oathtool -b --totp 'YOUR_SECRET_KEY')
else
# Else Terminate Execution
    echo "Authentication failed. Script execution terminated."
    termux-toast "Authentication failed. Script execution terminated."
fi

# TO-DO:
# 1. Encrypt the script or the secret key to make it more secure.
