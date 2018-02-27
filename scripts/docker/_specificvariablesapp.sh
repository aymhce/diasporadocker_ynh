#!/bin/bash

source /usr/share/yunohost/helpers

mkdir -p $data_path/data

db_pwd=$(ynh_app_setting_get $app dbpwd)
if [ "$db_pwd" == "" ]
then
	db_pwd=$(ynh_string_random 24)
	ynh_app_setting_set $app dbpwd $db_pwd
fi

if [ -f docker/docker-compose.yml ]
then
	cp docker/docker-compose.yml $data_path/.
fi

if [ -d ../conf/app/ ]
then
	ynh_replace_string "YNH_URL" "$domain" ../conf/app/diaspora.yml
	ynh_replace_string "YNH_PWD" "$db_pwd" ../conf/app/database.yml
fi
