# cap-add-demo
This is a simple dockerfile to demonstrate the use of CAP_ADD and uses netcat; testing only

This repo is pushed to randyfay/cap-add-demo

This is a demonstration repo for a 2021-04-01 bug in staging gitpod.io, https://aledbf-killdocker.staging.gitpod-dev.com/

The key element is that this docker repo has `setcap CAP_NET_BIND_SERVICE=+eip /bin/nc.traditional`, which allows /bin/nc.traditional to access privileged ports (like port 80).

Build and push with `docker buildx build --push --platform=linux/amd64,linux/arm64 -t randyfay/cap-add-demo .`

To run it and see if nc.traditional has cap_net_bind_service, `docker run -it randyfay/cap-add-demo getcap /bin/nc.traditional`

Full steps to demonstrate loss of the cap_net_bind_service capacity on restore of an image in gitpod.io:

* Run this repo with gitpod: https://aledbf-killdocker.staging.gitpod-dev.com/#https://github.com/rfay/cap-add-demo
    
You should see "/bin/nc.traditional = cap_net_bind_service+eip", which means that the nc.traditional binary has the cap_net_bind_service capability.

* Stop the gitpod workspace, then restart it. 

* Run this repo again with gitpod: https://aledbf-killdocker.staging.gitpod-dev.com/#https://github.com/rfay/cap-add-demo
