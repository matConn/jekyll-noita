#!/usr/bin/env bash

echo "Enter bookmark url and name:";
read url name;
echo "- [$name]($url)" >> bookmarks/index.md;
