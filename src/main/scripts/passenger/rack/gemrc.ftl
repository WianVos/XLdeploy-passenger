:verbose: false
install: --no-wrappers
update: --no-wrappers
<#if deployed.container.httpProxyUrl?? >
http_proxy: ${deployed.container.httpProxyUrl}
https_proxy: ${deployed.container.httpProxyUrl}
</#if>
