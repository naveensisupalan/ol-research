#!/bin/bash
read -p "Message " msg

git add --all
git commit -m "$msg"
git push -u origin main