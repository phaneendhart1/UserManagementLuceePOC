<cfset userController = createObject("component", "./UserController")>

<cfif structKeyExists(form, "id")>
    <cfset userController.updateUser(form.id, form.firstName, form.lastName, form.email)>
    <cflocation url="./views/users.cfm" addtoken="false">
<cfelse>
    <cfset result = userController.createUser(form.firstName, form.lastName, form.email)>
    <cflocation url="./views/users.cfm" addtoken="false">
</cfif>