MAKEFLAGS = --no-builtin-rules --no-builtin-variables --always-make
.DEFAULT_GOAL := help

SHELL  = /usr/bin/env bash

bench:
	/home/isucon/isubata/bench/bin/bench -data=/home/isucon/isubata/bench/data -remotes=localhost -output=result.json

alp:
	sudo alp -r --sum -f $(file) --aggregates '/history/\d+,/channel/\d+,/profile/\w+,/icons/\S+'

restart:
	sh /home/isucon/isubata/scripts/restart.sh

rotate:
	sh /home/isucon/isubata/scripts/rotate_alplog.sh

set-slow-log:
	sudo mysql -uisucon -pisucon -e "set global slow_query_log = 1"
	sudo mysql -uisucon -pisucon -e "set global long_query_time = 0.2"
	sudo mysql -uisucon -pisucon -e "set global log_queries_not_using_indexes = 1"

mysqldumpslow:
	sudo mysqldumpslow -s t /var/lib/mysql/118-27-20-146-slow.log > ~/tmp/slow.log

restart-mysql:
	sudo /etc/init.d/mysql restart
