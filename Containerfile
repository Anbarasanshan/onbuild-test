FROM registry.access.redhat.com/ubi8/ubi:8.0

MAINTAINER abc.example.com

RUN   yum install -y --nodocs --disableplugin=subscription-manager httpd && \
      yum clean all --disableplugin=subscription-manager -y && \
      echo "Hello OpenShift from the httpd-parent container!" > ${DOCROOT}/index.html

EXPOSE 80

RUN rm -rf /run/httpd && mkdir /run/httpd

USER root

CMD /usr/sbin/httpd -DFOREGROUND
