<cfset userService = createObject("component", "../UserService")>
<cfset user = userService.getUserById(url.id)>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <cfoutput><div class="container mt-5">
        <h2>Edit User</h2>
        <form method="post" action="../save.cfm">
            <input type="hidden" name="id" value="#user.id#">
            <div class="mb-3">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="#user.first_name#" required>
            </div>
            <div class="mb-3">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" value="#user.last_name#" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="#user.email#" required>
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="users.cfm" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</cfoutput>
</body>
</html>