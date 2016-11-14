Running Apicast with OAuth 
==========================

The API Gateway has a dependency on Redis when adding OAuth support. 

In this case, docker-compose has to be run in order to start up all of the required components. 

The command to do so is 

`docker-compose up -d`

from the directory containing the docker-compose.yml file. 

The `-d` flag starts the containers up in detached mode, if you want to see the output when starting the containers, you should omit this. 

In order for the command to run successfully, you will also need a .env file with the following content:

```
# URI to fetch gateway configuration from. Expected format is: https?://[password@]hostname
THREESCALE_PORTAL_ENDPOINT=https://access_token@example-admin.3scale.net


# Path to a file mounted into docker container that contains the gateway configuration.
# That can be for example cached response from the API.
# THREESCALE_CONFIG_FILE

# Redis host. Used to store access tokens.
REDIS_HOST=redis
# REDIS_PORT=6379

# Limit to subset of services. Comma separated list of service ids.
# APICAST_SERVICES=265,31,42


# What to do when Apicast does not have configuration. Allowed values are: log, exit
# APICAST_MISSING_CONFIGURATION=log

IMAGE_NAME=apicast-test
```

The docker compose file spins up 3 services:

1. APIcast
2. Redis 
3. A very simple "Authorization Server" written in Ruby
