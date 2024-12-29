#!/bin/bash

mkdir tmp

# generate the data url for the font data:font/woff2;base64,
font_closure="data:font/woff2;base64,"
font_data_url="$font_closure$(base64 -w 0 ./src/s.woff2)"
echo "Font data url: $font_data_url"
echo ""



# replace "s.woff" with the data url for the font
cat ./src/index.html | sed "s*s.woff2*$font_data_url*g" > ./tmp/pre_index.html

html-minifier ./tmp/pre_index.html --file-ext html --collapse-whitespace --remove-comments --minify-css true --minify-js true --output ./tmp/index.html

# Minify the index.html file
minified_html=$(tr -d '\n' < tmp/index.html | tr -s ' ')


# Percent encode the minified HTML
percent_encoded_html=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$minified_html'''))")

# Add the closure before the encoded HTML
final_string="data:text/html;charset=utf-8,$percent_encoded_html"

rm -rf ./tmp

# Print the length of the final string
echo "Length of the final string: ${#final_string}"

# Print the final string to the console
echo "$final_string"