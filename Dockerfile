FROM centos:5
LABEL version="0.0.1-beta"
LABEL maintainer="alisio.meneses@gmail.com"
COPY  ./files/yum.repos.d /etc/yum.repos.d/
RUN yum install -y \
    epel-release \
    git \
    vim-enhanced
RUN rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-5.noarch.rpm
RUN yum install -y puppet-server-2.7.26
WORKDIR /etc/puppet
EXPOSE  8140/tcp
VOLUME  /etc/puppet
VOLUME  /var/lib/puppet
CMD puppet master --no-daemonize
# docker build  --rm -t puppet-centos5 .
# docker run -i -t -d -p 8140:8140/tcp -v puppet-var:/var/lib/puppet -v puppet-etc:/etc/puppet --name puppet-centos5 puppet-centos5
