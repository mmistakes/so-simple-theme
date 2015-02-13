#!/bin/bash
set +e
source ./env.sh

rm -rf _site
rm -rf _asset_bundler_cache
bundle exec jekyll build
./htmlcompressor --compress-js --compress-css --closure-opt-level advanced --recursive --type html -o _site _site

S3_ID=$S3_ID S3_SECRET=$S3_SECRET bundle exec s3_website push
python pinger.py
exit 0
