<cfoutput>

<script language="javascript" type="text/javascript">
$(document).ready(function(){/*Start doc.ready*/

//Send Form function to unlock user
function sendForm(name) { 

	$.ajax({
									url: '#$.globalConfig("context")#/plugins/#variables.pluginConfig.getDirectory()#/com/unlock_events.cfc?method=unlock&returnFormat=json',
									type:"POST",
									dataType:"json",
									async: false,
									data:{theUser : name},
									success: function(response){
									data = $.trim(response) 
									if (data) {
									alert('user could not be unlocked');
									}else{
									alert('user unlocked');
									//remove displayed user
									$('##' + name).hide('fast');
									}
							}
				});
		//prevent default
 return false;  
}

/*-------Button Creation End------------------------------------------
-----------------------------------------------------------------*/
//Unlock Button
$( ".unlockMe" ).button({
		label: 'Unlock',
		icons: {
		primary: 'ui-icon-unlocked'
  }
});


/*-------Button Function Start------------------------------------------
-----------------------------------------------------------------*/

//Unlock the user Start
$('.unlockMe').on('click', function() {
//set var to pass to sendForm function
var theUser = $(this).parent().attr('name');
//Calls function to unlock user
sendForm(theUser);
});	


});
/*End doc.ready*/
</script>
 <div id="plugin-body">
 <!-- CONTENT HERE -->
 <h2>#variables.pluginConfig.getName()#</h2>
  <div id="classSteps">
			<!---Call to get the locked out users--->
   <cfobject component="plugins.#variables.pluginConfig.getDirectory()#.com.unlock_events" name="checkForLocked" >
  	<cfset lockedOut = checkForLocked.getLockedOut() />
  </div>
 </div>
</cfoutput>