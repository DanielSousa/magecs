FROM php:7.0-cli-alpine

# Install Magento Coding Standards
ARG MCS_VERSION="15"
ARG MEQP_VERSION="4.0.0"
RUN set -eux

# Install Magento Coding Standards
RUN set -eux &&\
    apk --no-cache add git &&\
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer &&\
    mkdir -p "/opt/" &&\
    cd "/opt/" &&\
    composer create-project magento/magento-coding-standard:${MCS_VERSION} magento-coding-standard &&\
    cd "/opt/magento-coding-standard/" &&\
    composer install --no-dev --optimize-autoloader

# Configure phpcs defaults
RUN /opt/magento-coding-standard/vendor/bin/phpcs --config-set default_standard Magento2 &&\
    /opt/magento-coding-standard/vendor/bin/phpcs --config-set report_width 120

# Configure phpcbf defaults
RUN /opt/magento-coding-standard/vendor/bin/phpcbf --config-set default_standard Magento2

# Install MEQP
# Install Composer
RUN cd "/opt/" &&\
    git clone -v --single-branch --depth 1 https://github.com/magento/marketplace-eqp.git --branch ${MEQP_VERSION} &&\
    rm -rf marketplace-eqp/.git &&\
    cd "/opt/marketplace-eqp/" &&\
    composer install --no-dev --optimize-autoloader

# Configure phpcs defaults
RUN /opt/marketplace-eqp/vendor/bin/phpcs --config-set default_standard MEQP1 &&\
    /opt/marketplace-eqp/vendor/bin/phpcs --config-set severity 10 &&\
    /opt/marketplace-eqp/vendor/bin/phpcs --config-set extensions php,phtml &&\
    /opt/marketplace-eqp/vendor/bin/phpcs --config-set report_width 120

# Configure phpcbf defaults
RUN /opt/marketplace-eqp/vendor/bin/phpcbf --config-set default_standard MEQP1

WORKDIR /mnt/src

ENTRYPOINT ["/opt/magento-coding-standard/vendor/bin/phpcs"]

CMD ["--version"]
