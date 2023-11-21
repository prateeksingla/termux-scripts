wget --load-cookies cookies.txt -p -k https://www.youtube.com/@AkshatZayn/membership
grep 'contentText' www.youtube.com/@AkshatZayn/membership > extracted_lines
grep -oP 'contentText\K.*?(?=expandButton)' extracted_lines > final.txt
cut -c 21- final.txt > Member_posts.txt
grep -Fvf <(cut -c 1-20 posts.txt) Member_posts.txt | cat - posts.txt > temp && mv temp posts.txt
rm final.txt extracted_lines Member_posts.txt
rm -rf www.youtube.com
