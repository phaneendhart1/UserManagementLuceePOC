<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 500px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        h3 {
            font-size: 20px;
            margin-bottom: 20px;
        }

        .text-danger {
            color: #d9534f;
        }

        .text-success {
            color: #5cb85c;
        }

        p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 5px;
            font-size: 14px;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .btn-danger {
            background-color: #d9534f;
        }

        .btn-danger:hover {
            background-color: #c9302c;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .btn-primary {
            background-color: #0275d8;
        }

        .btn-primary:hover {
            background-color: #025aa5;
        }
    </style>
</head>
<body>
    <cfparam name="url.id" type="numeric" default="0">

    <!-- Check if the user ID is valid -->
    <cfif url.id EQ 0>
        <div class="container">
            <h3 class="text-danger">Error: Invalid User ID</h3>
            <p>Cannot delete the user without a valid ID.</p>
            <a href="users.cfm" class="btn btn-primary">Back to User List</a>
        </div>
        <cfabort>
    </cfif>

    <!-- Ask for confirmation -->
    <cfif not structKeyExists(form, "confirm")>
        <div class="container">
            <h3>Are you sure you want to delete this user?</h3>
            <cfoutput><p>User ID: <strong>#url.id#</strong></p></cfoutput>
            <form method="post">
                <input type="hidden" name="confirm" value="yes">
                <input type="hidden" name="id" value="#url.id#">
                <button type="submit" class="btn btn-danger">Yes, Delete</button>
                <a href="users.cfm" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
        <cfabort>
    </cfif>

    <!-- Handle confirmation -->
    <cfif form.confirm EQ "yes">
        <cfset userController = createObject("component", "../UserController")>
        <cfset result = userController.deleteUser(url.id)>

        <cfif result.status EQ "success">
            <div class="container">
                <h3 class="text-success">User Deleted Successfully</h3>
                <cfoutput><p>The user with ID <strong>#url.id#</strong> has been deleted.</p></cfoutput>
                <a href="users.cfm" class="btn btn-primary">Back to User List</a>
            </div>
        <cfelse>
            <div class="container">
                <h3 class="text-danger">Error Deleting User</h3>
                <cfoutput><p>Error: <strong>#result.message#</strong></p></cfoutput>
                <a href="users.cfm" class="btn btn-primary">Back to User List</a>
            </div>
        </cfif>
    </cfif>
</body>
</html>
