# puppet-centos5
This dockerfile provides a centos5 container with puppet server 2.7 installed for legacy systems.

Building the container:
```sh
$ sudo docker build  --rm -t puppet-centos5 .
```
Running the container:
```sh
sudo docker run -i -t -d -p 8140:8140/tcp -v puppet-var:/var/lib/puppet -v puppet-etc:/etc/puppet --name puppet-centos5 puppet-centos5
```
