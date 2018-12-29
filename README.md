# bitloop-client-api-load-balancer

## Usage

### 1. Configure.
   Edit `config.conf` to config load balance strategies.Values will be configured to `bitloop.conf`. 
   The configure map is:
    |config.conf|bitloop.conf|
    |:---|:---|
    |SERVER_NAME|server_name|
    |SERVER_PORT|listen|
    |NODE_NAME|upstream|
  `SSL`,determine if use ssl when accessing to API.


### 2. Docker build.
   `$docker build -t bitloop-nginx .`
### 3. Docker run.
   if use http:
   `$docker run -v $PWD/logs:/var/log/nginx/bitloop bitloop-nginx` 
   if use https:
   `$docker run -v $PWD/logs:/var/log/nginx/bitloop -v $PWD/ssl:/ssl bitloop-nginx` 

