#!/bin/bash
# 文档 https://www.php.cn/php-weizijiaocheng-441928.html

#获取php.ini目录
phpIniPath=$(php -r "echo php_ini_loaded_file();")
#获取php目录
phpdPath=$(php -r "\$list = explode(',', php_ini_scanned_files());if(isset(\$list[0])){echo \$list[0];}")

#安装librdkafka
cd /usr/local/src
git clone https://github.com/edenhill/librdkafka.git
cd librdkafka/
./configure
make && make install

#安装rdkafka
cd /usr/local/src
git clone https://github.com/arnaud-lb/php-rdkafka.git
cd php-rdkafka
phpize
./configure
make all -j 5
make install

# 指定版本 3.0.3
# wget https://pecl.php.net/get/rdkafka-3.0.3.tgz
# tar -xzvf rdkafka-3.0.3.tgz
# cd rdkafka-3.0.3
# phpize
# ./configure
# make all -j 5
# make install

#手动修改php.ini  extension=rdkafka.so
