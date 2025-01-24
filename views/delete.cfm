<cfparam name="url.id" type="numeric" default="0">

<!-- Check if the user ID is valid -->
<cfif url.id EQ 0>
    <cfoutput>
        <h3>Error: Invalid User ID</h3>
        <p>Cannot delete the user without a valid ID.</p>
    </cfoutput>
    <cfabort>
</cfif>

<cfif not structKeyExists(form, "confirm")>
    <cfoutput>
        <div class="container mt-5">
            <h3>Are you sure you want to delete this user?</h3>
            <p>User ID: #url.id#</p>
            <form method="post">
                <input type="hidden" name="confirm" value="yes">
                <input type="hidden" name="id" value="#url.id#">
                <button type="submit" class="btn btn-danger">Yes, Delete</button>
                <a href="users.cfm" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </cfoutput>
    <cfabort>
</cfif>

<!-- If confirmation is received, delete the user -->
<cfif form.confirm EQ "yes">
    <cfset userController = createObject("component", "../UserController")>
    <cfset result = userController.deleteUser(form.id)>
    
    <cfif result.status EQ "success">
        <cfoutput>
            <div class="container mt-5">
                <h3>User Deleted Successfully</h3>
                <p>The user with ID #form.id# has been deleted.</p>
                <a href="users.cfm" class="btn btn-primary">Back to User List</a>
            </div>
        </cfoutput>
    <cfelse>
        <cfoutput>
            <div class="container mt-5">
                <h3>Error Deleting User</h3>
                <p>Error: #result.message#</p>
                <a href="users.cfm" class="btn btn-primary">Back to User List</a>
            </div>
        </cfoutput>
    </cfif>
</cfif>
