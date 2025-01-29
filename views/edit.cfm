<cfset userService = createObject("component", "../UserService")>
<cfset user = userService.getUserById(url.id)>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 900px;
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .btn-primary {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .btn-delete:hover {
            background-color: #a71d2a;
        }
    </style>
</style>
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
            <a href="users.cfm" class="btn btn-delete">Cancel</a>
        </form>
    </div>
</cfoutput>
</body>
</html>