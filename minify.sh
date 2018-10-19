#!/bin/sh
rm -rf public
rm -rf public-minified
zola build
cp -ar public public-minified
find public-minified -name "*.html" -exec sh -c 'path="{}"; path2="${path}.2"; cp $path $path2; cat $path2 | htmlmin > $path; rm $path2' \;