# Using Diaspora with docker-compose

The enclosed `docker-compose.yml` file can be used to run your Diaspora
pod in its own containerized environment. 

# Steps to use this configuration

1. Edit the `diaspora.yml.example` file to suit your pod (hint: you must change the URL!),
   and rename the file `diaspora.yml`.
2. Customize the `database.yml` file to use a different password than `somepassword`
3. Change the `docker-compose.yml` file so that the postgres database uses the same password

Once that's done, you can run the pod with `docker-compose up -d`. The data in the database
and user-uploaded images will be placed into Docker volumes; you'll want to back them up. 

You'll also need to configure a web server like Nginx or Apache to provide TLS 
termination. This can be added to the `docker-compose.yml` file or not, depending 
on your particular environment. The diaspora server will be available inside the compose
environment at `http://diaspora:3000`. Some examples are available (on the wiki)[https://wiki.diasporafoundation.org/Installation/Debian/Jessie]
(look for the section labeled, "Reverse Proxy").

# Upgrading

From inside the directory containing your `docker-compose.yml` file:
1. `docker-compose pull`
2. `docker-compose up -d`

Current versions of the Diaspora code and all the supplemental packages, Ruby, gems, etc.
will all be installed, and the database will be automatically upgraded to the current 
version. 
