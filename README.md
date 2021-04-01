# cap-add-demo
This is a simple dockerfile to demonstrate the use of CAP_ADD and uses netcat; testing only

This repo is pushed to randyfay/cap-add-demo

Build with `docker build -t randyfay/cap-add-demo .`

Push with `docker push randyfay/cap-add-demo`

To run it with root privs and see if it can bind to port 80, `docker run -it randyfay/cap-add-demo nc -l 80`

To run it with normal user privs,  `docker run -u 33333 -it randyfay/cap-add-demo nc -l 80`