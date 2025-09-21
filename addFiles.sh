#!/usr/bin/bash
echo '<!doctype html><meta charset="utf-8"><title>My Files</title><h1>My Files</h1><u1>' > index.html
for f in *; do
	[ -f "$f" ] || continue
	printf '<li><a href="%s">%s</a></li>\n' "$f" "$f" >> index.html
done
echo '</u1>' >> index.html
