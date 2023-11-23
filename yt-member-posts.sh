gpg --quiet --batch --yes --decrypt --passphrase="$COOKIE" --output ./cookies.txt cookies.txt.gpg
wget --load-cookies cookies.txt -k -O membership https://www.youtube.com/@AkshatZayn/membership
grep 'contentText' membership > extracted_lines
grep -oP 'contentText\K.*?(?=expandButton)' extracted_lines > final.txt
cut -c 21- final.txt > Member_posts.txt
grep -Fvf <(cut -c 1-20 posts.txt) Member_posts.txt | cat - posts.txt > temp && mv temp posts.txt
rm final.txt extracted_lines Member_posts.txt

jq --raw-input --slurp '{"description":"An updated gist description","files":{"akshat.txt":{"content": . }}}' posts.txt \
 | curl -L \
  -X PATCH \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: $GHTOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/gists/$GISTID \
  -d @-