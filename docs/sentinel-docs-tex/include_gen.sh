#!/usr/bin/env bash

for file in bible/chapters/*; do {
	tmp=${file##*/}
	echo "\include{$tmp}" >> /tmp/chapter_includes.txt
}
done
cat /tmp/chapter_includes.txt
