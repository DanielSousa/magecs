# MageCS

Run Magento Code Sniffer tool on docker


## Download

    curl -sS https://raw.githubusercontent.com/danielsousa/magecs/master/magecs > magecs

Move file to /usr/local/bin

    sudo mv magecs /usr/local/bin

Make the file executable
    
    sudo chmod 755 /usr/local/bin/magecs

## Requirements

- Docker


## Usage


    magecs [<options>] [<phpcs/phpcbf arguments>]


### Options

    -help  Display this usage information.
    -path  One or more files and/or directories to check
    -m1    Check according to MEQP Coding Standards (Magento 1)
    -cbf   Run PHP Code Beautifier and Fixer (phpcbf) tool

## Default phpcs values 

### Magento 1

- severity=10
- extensions=php,phtml
- report_width=120


### Magento 2

- report_width=120
