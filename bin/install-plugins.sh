#!/bin/bash
cd ../storage/plugins

for f in *; do
    if [ -d "$f" ]; then
	cd $f
	export name=`grep "\"id\"" kibana.json  | cut -d '"' -f4`
	echo "INSTALL $name plugin"
        docker cp build/*.zip odfe-kibana:/usr/share/kibana/$f.zip
	docker exec odfe-kibana bin/kibana-plugin remove -s $name
	docker exec odfe-kibana bin/kibana-plugin install -q file:///usr/share/kibana/$f.zip
        docker exec odfe-kibana rm /usr/share/kibana/$f.zip
	echo
	cd ..
    fi
done


echo "RESTART Kibana"
docker restart odfe-kibana
echo
echo "PLUGINS INSTALL TERMINATED"
echo
