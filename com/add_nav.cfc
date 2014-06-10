<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	  <cfscript>
		// Add this to an eventHandler.cfc
		public any function onAdminHTMLFootRender($) {
		var str = '';
		// this will add a link to the bottom of the 'Modules' button in the back end admin area
		savecontent variable='str' {
		WriteOutput('<script>
		jQuery(document).ready(function($){
		$("##navSecondary").append(''<li><a href="http://'+ CGI.HTTP_HOST + '/plugins/'+variables.pluginConfig.getDirectory()+'/"><i class="icon-cog fa-cog"></i> '+ variables.pluginConfig.getName() + '</a></li>'');
		});
		</script>');
		}
		return str;
		}
	</cfscript>
</cfcomponent>