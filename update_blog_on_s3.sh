#!/bin/bash
echo Pushing changes to blog to s3://sriku.org
fossil add public
pushd public
for f in `fossil changes | awk '{print $2}'`; do
    echo $f
    s3cmd -q -P put $f s3://sriku.org/$f
done
popd
fossil commit -m "Pushed article(s) to blog"
