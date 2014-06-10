<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
 
 <cffunction name="onApplicationLoad">
		<cfargument name="$">
		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
 
	<cffunction name="onSiteRequestStart">
		<cfargument name="$">
  <cfset var unlock_events=createObject("component","#variables.pluginConfig.getDirectory()#.com.unlock_events")>
		<cfset $.setCustomMuraScopeKey("unlock_events", unlock_events)>
 
	</cffunction>
 
 <cffunction name="onRenderStart">
 <cfargument name="$"> 
     
</cffunction>

	<cffunction name="onSiteRequestInit" output="false" returntype="void">
		<cfargument name="$">
		<cfreturn>
		<!---<cfset var beanFactory	= pluginConfig.getApplication().getValue('beanFactory') />--->
	</cffunction>
</cfcomponent>