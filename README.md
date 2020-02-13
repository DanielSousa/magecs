# magecs

Run Magento Code Sniffer tool on docker


## Download

    curl -sS https://raw.githubusercontent.com/DanielSousa/magecs/master/magecs > magecs

Move file to /usr/local/bin

    sudo mv magecs /usr/local/bin

Make the file executable
    
    sudo chmod 755 /usr/local/bin/magecs

## Requirements

- Docker

## Running MageCS tool

Navigate to the directory you want to run the tool and run:

    magecs

For Magento 1 add the parameter m1

    magecs --m1

## Default phpcs values for Magento 1

- severity=10
- extensions=php,phtml
- report_width=120


## Default phpcs values for Magento 2

- severity=10
- extensions=php,phtml
- report_width=120
