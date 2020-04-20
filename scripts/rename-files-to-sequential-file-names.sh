#!/bin/sh
sequence=1
for i in *; do
	new=$(printf "%d.jpg" "$sequence")
	mv -- "$i" "$new"
	let sequence=sequence+1
done