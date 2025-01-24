<cfcomponent rest="true" restPath="users">
    <cfset variables.model = createObject("component", "./UserService")>

    <cffunction name="listUsers" access="remote" httpmethod="GET" returntype="array">
        <cfreturn variables.model.getAllUsers()>
    </cffunction>

    <cffunction name="getUser" access="remote" httpmethod="GET" restPath="{userId}" returntype="struct">
        <cfargument name="userId" type="numeric" required="true">
        <cfreturn variables.model.getUserById(arguments.userId)>
    </cffunction>

    <cffunction name="createUser" access="remote" httpmethod="POST" returntype="struct">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfreturn variables.model.createUser(arguments.firstName, arguments.lastName, arguments.email)>
    </cffunction>

    <cffunction name="updateUser" access="remote" httpmethod="PUT" restPath="{userId}" returntype="struct">
        <cfargument name="userId" type="numeric" required="true">
        <cfargument name="firstName" type="string" required="true">
        <cfargument name="lastName" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfreturn variables.model.updateUser(arguments.userId, arguments.firstName, arguments.lastName, arguments.email)>
    </cffunction>

    <cffunction name="deleteUser" access="remote" httpmethod="DELETE" restPath="{userId}" returntype="struct">
        <cfargument name="userId" type="numeric" required="true">
        <cfreturn variables.model.deleteUser(arguments.userId)>
    </cffunction>
</cfcomponent>