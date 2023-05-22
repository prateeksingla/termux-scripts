diff <(cat test.html | grep -A 28 "Individuals and") <(curl -v --silent https://www.incometax.gov.in/iec/foportal/downloads/income-tax-returns 2>&1 | grep -A 28 "Individuals and")
# Checks for diffrence in test.html and online version.
