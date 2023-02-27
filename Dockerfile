FROM wordpress:apache
# FROM wordpress:6.0.2-apache
# # Set environment variables used by the Wordpress image
# # DB_USER and DB_PASSWORD are included as an example. However,
# # these should be removed and set during docker run.
# #COPY . /usr/src/wordpress
COPY . /var/www/html
...
ARG VERSION
ENV VERSION $VERSION
ARG BUILD_TIMESTAMP
ENV BUILD_TIMESTAMP $BUILD_TIMESTAMP
...
# WORKDIR /usr/src/wordpress
# RUN set -eux; \
# 	find /etc/apache2 -name '*.conf' -type f -exec sed -ri -e "s!/var/www/html!$PWD!g" -e "s!Directory /var/www/!Directory $PWD!g" '{}' +; \
# 	cp -s wp-config-docker.php wp-config.php
# COPY custom-theme/ ./wp-content/themes/custom-theme/
# COPY custom-plugin/ ./wp-content/plugins/custom-plugin/

