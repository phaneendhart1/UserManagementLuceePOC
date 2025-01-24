<cfcomponent>
    <cfset variables.datasource = "userdb">

    <cffunction name="getAllUsers" access="public" returntype="array" output="false">
        <cfquery name="qUsers" datasource="#variables.datasource#">
            SELECT id, first_name, last_name, email 
            FROM users 
            ORDER BY id
        </cfquery>
        
        <cfset users = []>
        <cfloop query="qUsers">
            <cfset arrayAppend(users, {
                id = qUsers.id,
                first_name = qUsers.first_name,
                last_name = qUsers.last_name,
                email = qUsers.email
            })>
        </cfloop>
        
        <cfreturn users>
    </cffunction>

    <cffunction name="getUserById" access="public" returntype="struct" output="false">
        <cfargument name="userId" type="numeric" required="true">
        
        <cfquery name="qUser" datasource="#variables.datasource#">
            SELECT id, first_name, last_name, email 
            FROM users 
            WHERE id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfif qUser.recordCount EQ 0>
            <cfthrow message="User not found" type="UserNotFoundException">
        </cfif>
        
        <cfreturn {
            id = qUser.id,
            first_name = qUser.first_name,
            last_name = qUser.last_name,
            email = qUser.email
        }>
    </cffunction>

    <cffunction name="createUser" access="public" returntype="struct" output="false">
        <cfargument name="first_name" type="string" required="true">
        <cfargument name="last_name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        
        <cfquery name="checkEmail" datasource="#variables.datasource#">
            SELECT COUNT(*) as emailCount 
            FROM users 
            WHERE email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
        </cfquery>
        
        <cfif checkEmail.emailCount GT 0>
            <cfthrow message="Email already exists" type="DuplicateEmailException">
        </cfif>
        <!--- <cftry>
            <cfif checkEmail.emailCount GT 0>
                <cfthrow message="Email already exists" type="DuplicateEmailException">
            </cfif>
            
            <cfcatch type="DuplicateEmailException">
                <script>
                    alert('<cfoutput>#cfcatch.message#</cfoutput>');
                    window.location.href = 'users.cfm';
                </script>
            </cfcatch>
        </cftry> --->
        
        <cfquery datasource="#variables.datasource#">
            INSERT INTO users (first_name, last_name, email)
            VALUES (
                <cfqueryparam value="#arguments.first_name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.last_name#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        
        <cfquery name="getLastId" datasource="#variables.datasource#">
            SELECT LAST_INSERT_ID() as newId
        </cfquery>
        
        <cfreturn {
            status = "success",
            message = "User created successfully",
            userId = getLastId.newId
        }>
    </cffunction>

    <cffunction name="updateUser" access="public" returntype="struct" output="false">
        <cfargument name="userId" type="numeric" required="true">
        <cfargument name="first_name" type="string" required="true">
        <cfargument name="last_name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        
        <cfquery datasource="#variables.datasource#">
            UPDATE users 
            SET first_name = <cfqueryparam value="#arguments.first_name#" cfsqltype="cf_sql_varchar">,
                last_name = <cfqueryparam value="#arguments.last_name#" cfsqltype="cf_sql_varchar">,
                email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfreturn {
            status = "success",
            message = "User updated successfully"
        }>
    </cffunction>

    <cffunction name="deleteUser" access="public" returntype="struct" output="false">
        <cfargument name="userId" type="numeric" required="true">
        
        <cfquery datasource="#variables.datasource#">
            DELETE FROM users 
            WHERE id = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfreturn {
            status = "success",
            message = "User deleted successfully"
        }>
    </cffunction>
</cfcomponent>