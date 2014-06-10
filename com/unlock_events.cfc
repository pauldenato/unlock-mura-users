<cfcomponent extends="mura.plugin.pluginGenericEventHandler" output="false">

<cffunction name="getLockedOut" access="remote" returntype="any">
 <cfset var getAllLockedUsers = '' />
  
  <cfquery name="getAllLockedUsers" datasource="#application.configBean.getDatasource()#">
   select username, strikes, lastAttempt
   from tuserstrikes
   where strikes >= '5'
  </cfquery>
		<cfoutput>
 <h3>These Users are locked out of Mura</h3>
 <cfif getAllLockedUsers.recordcount NEQ 0>
 
 <cfloop query="getAllLockedUsers">
  <cfoutput><div name="#username#" id="#username#"><span for="#username#" style="float:left; line-height:25px; margin-right:15px"><strong>#username#</strong> :: #strikes# -- #dateFormat(lastAttempt,'mm-dd-yyyy')# #timeFormat(lastAttempt,'hh:mm')# = </span><button type="submit" name="submit" id="submit" value="Submit" class="unlockMe">Unlock</button></div><br></cfoutput>
 </cfloop>
 <cfelse>
  There are no users to unlock #getAllLockedUsers.recordcount#
  <br><br>
 </cfif>
 </cfoutput>
</cffunction>


<cffunction name="unlock" access="remote" returntype="any" output="false">
 <cfargument name="theUser" type="any" required="yes">
 <cfset var unlockTheUser = '' />
 <cfset var getLastUser = '' />
  
  <cfquery name="unlockTheUser" datasource="#application.configBean.getDatasource()#">
    UPDATE tuserstrikes
    SET strikes = '0'
   where username = '#arguments.theUser#'
  </cfquery>

  <cfquery name="getLastUser" datasource="#application.configBean.getDatasource()#">
   select username, strikes, lastAttempt
   from tuserstrikes
   where username = '#arguments.theUser#'
  </cfquery>

 <cfif getLastUser.strikes EQ 0>
   <cfset passFailed = "">
  <cfreturn trim(passFailed) />
 <cfelse>
    <cfset passFailed = "not unlocked">
   <cfreturn trim(passFailed) />
 </cfif>
</cffunction>

</cfcomponent>