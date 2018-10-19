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
COPY  ./files/puppet/puppet.conf /etc/puppet.conf
RUN   mkdir -p /etc/puppet-environments/production/{manifest,modules,template}
RUN   mkdir -p /etc/puppet-environments/testing/{manifest,modules,template}
RUN   mkdir -p /etc/puppet-environments/dev/{manifest,modules,template}
WORKDIR /etc/puppet
EXPOSE  443/tcp
EXPOSE  8140/tcp
EXPOSE  61613/tcp
VOLUME  /etc/puppet
VOLUME  /etc/puppet-environments
VOLUME  /var/lib/puppet
CMD puppet master --no-daemonize
# docker build  --rm -t puppet-centos5 .
# docker run -i -t -d -p 8140:8140/tcp -v puppet-var:/var/lib/puppet -v puppet-etc:/etc/puppet --name puppet-centos5 puppet-centos5
