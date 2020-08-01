#!/bin/bash -x
##	./bin/deploy/kubernetes/config.sh
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Generate the config maps
## ========================
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=0;


################################################################################
##	functions							      ##
################################################################################


################################################################################
##	main								      ##
################################################################################
function main()
{

	kubectl create configmap "nginx-conf-cm"			\
		--from-file "/run/configs/www/etc/nginx/nginx.conf"
	kubectl create configmap "nginx-confd-security-parameters-cm"	\
		--from-file "/run/configs/www/etc/nginx/conf.d/security-parameters.conf"
	kubectl create configmap "nginx-confd-server-cm"			\
		--from-file "/run/configs/www/etc/nginx/conf.d/server.conf"
}


################################################################################
##	run								      ##
################################################################################
argc=$#;
if [ ${argc} -ne ${ARGC} ]; then
	echo	"Illegal number of parameters (Requires ${ARGC})";
	exit	${EX_USAGE};
fi

main;


################################################################################
##	end of file							      ##
################################################################################
