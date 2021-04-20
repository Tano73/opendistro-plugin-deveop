#!/bin/bash
. $HOME/.bashrc

cd /develop/kibana

echo yarn kbn bootstrap
yarn kbn bootstrap

cd /develop/kibana/plugins

for f in *; do
    if [ -d "$f" ]; then
	cd $f
	echo "BUILD $f plugin"
	echo
        echo "$f -- yarn build"
        yarn build #--kibana-version 7.10.2
	echo
	cd ..
    fi
done
