<cfcomponent displayname="Diff-Match-Patch Plugin" output="false">
	
	<cffunction name="init" output="false">
		<cfscript>
			this.version = "20121119";

			//Clear out the application scope cache
			lock timeout="20" scope="application" {
				application.diffmatchpatch = {};
				application.diffmatchpatch.jars = 'lib/diff_match_patch-current.jar';
			}

			return this;
		</cfscript>
	</cffunction>

	<!--- TODO: Can this could making trouble when a function with the same name already exists --->
	<cffunction name="$createNewJavaObject" returntype="any" output="false">
		<cfargument name="class" type="any" required="true"/>
		<cfargument name="classpath" type="any" default="#application.diffmatchpatch.jars#"/>
		<cfscript>
			//First see if the class is already on the classpath
			if($classExists(arguments.class)){
				return createObject('java',arguments.class);
			}

			//Now check if it is railo
			if(structKeyExists(server,'railo') && len(arguments.classpath)){
				//We can pass the classpath directly here
				return createObject('java',arguments.class,arguments.classpath);
			}

			

			$throw(type="Wheels.Unable to create java object", message="Unable to create the java object with class name: #arguments.class#. You may running on an unsupported engine.");   
		</cfscript>
	</cffunction>


	<cffunction name="diff_prettyHtml" returntype="any" output="false">
		<cfargument name="linkedList" type="any" required="true"/>
		<cfscript>
			var loc = {};
			loc.obj = false;
			if(!structKeyExists(application.diffmatchpatch,"diffmatchpatch")){
				lock timeout="20" name="diffmatchpatch"{
					//Let´s create the java object and initialize it
					loc.obj = $createNewJavaObject('name.fraser.neil.plaintext.diff_match_patch');
					loc.obj.init();
					
					applications.diffmatchpatch.diffmatchpatch = loc.obj;
				}
			}
			return applications.diffmatchpatch.diffmatchpatch.diff_prettyHtml(arguments.linkedList);
		</cfscript>
	</cffunction>

	<cffunction name="diff_main" returntype="any" output="false">
		<cfargument name="stringBefore" type="string" required="true"/>
		<cfargument name="stringAfter" type="string" required="true"/>
		<cfargument name="param1" type="any" required="false"/>
		<cfscript>
			var loc = {};
			loc.obj = false;
			if(!structKeyExists(application.diffmatchpatch,"diffmatchpatch")){
				lock timeout="20" name="diffmatchpatch"{
					//Let´s create the java object and initialize it
					loc.obj = $createNewJavaObject('name.fraser.neil.plaintext.diff_match_patch');
					loc.obj.init();
					
					applications.diffmatchpatch.diffmatchpatch = loc.obj;
				}
			}
			if(!structKeyExists(arguments, "param1")){
				loc.diffs = applications.diffmatchpatch.diffmatchpatch.diff_main(arguments.stringBefore, arguments.stringAfter);
			}else{
				loc.diffs = applications.diffmatchpatch.diffmatchpatch.diff_main(arguments.stringBefore, arguments.stringAfter, arguments.param1);
			}
			
			return loc.diffs;            
		</cfscript>
	</cffunction>

	<!-- not implemented -->

	<cffunction name="diff_commonPrefix" returntype="int">
		<cfargument name="param1" type="string"/>
		<cfargument name="param2" type="string"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="diff_commonSuffix" returntype="int">
		<cfargument name="param1" type="string"/>
		<cfargument name="param2" type="string"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="diff_cleanupSemantic" returntype="any">
		<cfargument name="diffs" type="any"/>
		 <cfscript>
			var loc = {};
			loc.obj = false;
			if(!structKeyExists(application.diffmatchpatch,"diffmatchpatch")){
				lock timeout="20" name="diffmatchpatch"{
					//Let´s create the java object and initialize it
					loc.obj = $createNewJavaObject('name.fraser.neil.plaintext.diff_match_patch');
					loc.obj.init();
					
					applications.diffmatchpatch.diffmatchpatch = loc.obj;
				}
			}
			
			applications.diffmatchpatch.diffmatchpatch.diff_cleanupSemantic(arguments.diffs);
			
		</cfscript>
	</cffunction>

	<cffunction name="diff_cleanupSemanticLossless" returntype="any">
		<cfargument name="diffs" type="any"/>
		 <cfscript>
			var loc = {};
			loc.obj = false;
			if(!structKeyExists(application.diffmatchpatch,"diffmatchpatch")){
				lock timeout="20" name="diffmatchpatch"{
					//Let´s create the java object and initialize it
					loc.obj = $createNewJavaObject('name.fraser.neil.plaintext.diff_match_patch');
					loc.obj.init();
					
					applications.diffmatchpatch.diffmatchpatch = loc.obj;
				}
			}
			
			applications.diffmatchpatch.diffmatchpatch.diff_cleanupSemanticLossless(arguments.diffs);            
		</cfscript>
	</cffunction>

	<cffunction name="diff_cleanupEfficiency" returntype="any">
		<cfargument name="diffs" type="any"/>
		 <cfscript>
			var loc = {};
			loc.obj = false;
			if(!structKeyExists(application.diffmatchpatch,"diffmatchpatch")){
				lock timeout="20" name="diffmatchpatch"{
					//Let´s create the java object and initialize it
					loc.obj = $createNewJavaObject('name.fraser.neil.plaintext.diff_match_patch');
					loc.obj.init();
					
					applications.diffmatchpatch.diffmatchpatch = loc.obj;
				}
			}
			
			applications.diffmatchpatch.diffmatchpatch.diff_cleanupEfficiency(arguments.diffs);            
		</cfscript>
	</cffunction>

	<cffunction name="diff_cleanupMerge" returntype="any">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="diff_xIndex" returntype="int">
		<cfargument name="param1" type="any"/>
		<cfargument name="param2" type="int"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="diff_text1" returntype="String">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="diff_text2" returntype="String">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="diff_levenshtein" returntype="int">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="diff_toDelta" returntype="String">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="diff_fromDelta" returntype="LinkedList">
		<cfargument name="param1" type="string"/>
		<cfargument name="param2" type="string"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="match_main" returntype="int">
		<cfargument name="param1" type="string"/>
		<cfargument name="param2" type="string"/>
		<cfargument name="param3" type="int"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_make" returntype="LinkedList">
		<cfargument name="param1" type="string"/>
		<cfargument name="param2" type="string"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_make" returntype="LinkedList">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_make" returntype="LinkedList">
		<cfargument name="param1" type="string"/>
		<cfargument name="param2" type="string"/>
		<cfargument name="param3" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_make" returntype="LinkedList">
		<cfargument name="param1" type="string"/>
		<cfargument name="param2" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_deepCopy" returntype="LinkedList">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_apply" returntype="any">
		<cfargument name="param1" type="any"/>
		<cfargument name="param2" type="string"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_addPadding" returntype="string">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_splitMax" returntype="any">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_toText" returntype="string">
		<cfargument name="param1" type="any"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

	<cffunction name="patch_fromText" returntype="any">
		<cfargument name="param1" type="string"/>
		<cfthrow message="This function is not implemented yet. It can be easily adpoted by using the working examples."/>
	</cffunction>

</cfcomponent>