#!/bin/sh
set -x
<#include "/generic/templates/linuxExportEnvVars.ftl">

# check if the target directory exists 
# if not create it 
if [ ! -d "${deployed.targetPath}" ] ; then
	mkdir -p ${deployed.targetPath}
fi

# unpack the uploaded artifact to the targetPath
/usr/bin/unzip ${step.uploadedArtifactPath} -d ${deployed.targetPath}

# check wether the public dir exists .. if not create 
if [ ! -d "${deployed.targetPath}/public" ] ; then
        mkdir -p ${deployed.targetPath}/public
fi


# add the config template to apaches config dir
/bin/cp ${step.remoteWorkingDirectory.path}/apache_config.conf ${deployed.container.configurationFragmentDirectory}/${deployed.name}.conf

cd ${deployed.targetPath}
ls ${step.remoteWorkingDirectory.path}
/bin/cp ${step.remoteWorkingDirectory.path}/gemrc.sh ~/.gemrc

<#if deployed.useBundler == true >  
 echo "${deployed.container.passengerRubyVersion}" > ${deployed.targetPath}/.ruby_version 
 echo "${deployed.name}" > ${deployed.targetPath}/.ruby_gemset 
 /usr/local/rvm/bin/rvm ${deployed.container.passengerRubyVersion} exec bundle install 
</#if>
