# cap-add-demo

This is a reproduction case for gitpod.io bug https://github.com/gitpod-io/gitpod/issues/3721

This repo is pushed to hub.docker.com as randyfay/cap-add-demo

The key element is that this docker repo has `setcap CAP_NET_BIND_SERVICE=+eip /bin/nc.traditional`, which allows /bin/nc.traditional to access privileged ports (like port 80).

Build and push with `docker buildx build --push --platform=linux/amd64,linux/arm64 -t randyfay/cap-add-demo .`

To run it and see if nc.traditional has cap_net_bind_service, `docker run -it randyfay/cap-add-demo getcap /bin/nc.traditional`

**Full steps to demonstrate loss of the cap_net_bind_service capacity on restore of an image in gitpod.io:**

* Run this repo with gitpod: https://aledbf-killdocker.staging.gitpod-dev.com/#https://github.com/rfay/cap-add-demo
    
You should see "/bin/nc.traditional = cap_net_bind_service+eip", which means that the nc.traditional binary has the cap_net_bind_service capability.

* Stop the gitpod workspace, then restart it. 

* Run this repo again with gitpod: https://aledbf-killdocker.staging.gitpod-dev.com/#https://github.com/rfay/cap-add-demo

You will not see the required output, in other words you will *not* see "/bin/nc.traditional = cap_net_bind_service+eip", because the cap_net_bind_service_capability has been lost.
