<cfinclude template="./plugin/config.cfm" />
<cfset local = StructNew() />

<cfsavecontent variable="local.newBody">
<!---Include body contents--->
<cfinclude template="./displayObjects/dsp_unlockUsers.cfm"/>
</cfsavecontent>

<!---Output display in admin templater--->
<cfoutput>#$.getBean('pluginManager').renderAdminTemplate(body=local.newBody,pageTitle=variables.pluginConfig.getName())#</cfoutput> 