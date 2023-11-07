# After lot of struggel with ChatGPT, I have created this one line command just to get the value of Market Mood Index as displayed on tickertape at https://www.tickertape.in/market-mood-index
# I will be using this in my personal projects on Android Termux and Github Codespaces to fetch real-time value of Market Mood Index
curl -fsSL https://www.tickertape.in/market-mood-index | grep -oP '\{.*?\}' | grep props | grep -o 'currentValue":[0-9.]*' | cut -d':' -f2
