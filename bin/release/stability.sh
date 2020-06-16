#!/bin/bash -x
##	./bin/release/stability.sh	<stability>
################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Update repository stability status
## ==================================
##
## The stack name has a suffix to help identify it: "stable", "rc" or "exp".
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/sysexits.sh;


################################################################################
##	definitions							      ##
################################################################################
ARGC=1;


################################################################################
##	functions							      ##
################################################################################
function update_suffix()
{
	local	stability="$1";

	sed "/docker stack deploy/s/www_.*\;/www_${stability}\;/"	\
		-i ./etc/docker/swarm/docker-compose.yaml;
	sed "/docker stack rm/s/www_.*\;/www_${stability}\;/"		\
		-i ./etc/docker/swarm/docker-compose.yaml;
	sed "/WWW_STABILITY=/s/\".*\"\;/\"${stability}\"\;/"		\
		-i ./etc/www/config.sh;
}


################################################################################
##	main								      ##
################################################################################
function main()
{
	local	suffix="$1";

	update_suffix	"${suffix}";
}


################################################################################
##	run								      ##
################################################################################
argc=$#;
if [ ${argc} -ne ${ARGC} ]; then
	echo	"Illegal number of parameters (Requires ${ARGC})";
	exit	${EX_USAGE};
fi

main	"$1";


################################################################################
##	end of file							      ##
################################################################################
