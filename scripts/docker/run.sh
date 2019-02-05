#!/bin/bash

source /usr/share/yunohost/helpers

[ "$architecture" == "amd64" ] && export version_diaspora=0.7.9.0
[ -z $version_diaspora ] && ynh_die "Sorry, your $architecture architecture is not supported ..."

db_pwd=$(ynh_app_setting_get $app dbpwd)
export POSTGRES_PASSWORD=$db_pwd

docker-compose -p $app -f $data_path/docker-compose.yml up -d 1>&2
CR=$?

echo "sorry, waiting 300s for startup" 1>&2
sleep 300

echo $CR
