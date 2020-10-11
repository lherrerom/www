################################################################################
##      Copyright (C) 2020        Alejandro Colomar Andrés                    ##
##      SPDX-License-Identifier:  GPL-2.0-only                                ##
################################################################################
##
## Deploy stack
## ============
##
################################################################################


################################################################################
##	source								      ##
################################################################################
source	lib/libalx/sh/containers/kubernetes/deploy.sh;
source	lib/libalx/sh/containers/openshift/deploy.sh;
source	lib/libalx/sh/containers/swarm/deploy.sh;


################################################################################
##	definitions							      ##
################################################################################


################################################################################
##	functions							      ##
################################################################################
## sudo
function alx_stack_deploy()
{
	local	mode="$1";	## "swarm", "kubernetes", or "openshift"
	local	project="$2";
	local	stack="$3";

	case "${mode}" in
	"kubernetes")
		alx_kube_deploy		"${project}" "${stack}";
		;;
	"openshift")
		alx_oc_deploy		"${project}" "${stack}";
		;;
	"swarm")
		alx_swarm_deploy	"${project}" "${stack}";
		;;
	esac
}


################################################################################
##	end of file							      ##
################################################################################