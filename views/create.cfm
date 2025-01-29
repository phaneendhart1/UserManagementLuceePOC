<cfset userController = createObject("component", "../UserController")>

<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

        .btn-secondary {
            background-color: #dc3545;
            color: white;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .btn-secondary:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Create User</h2>
        <form method="post" action="../save.cfm">
            <div class="mb-3">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            <div class="mb-3">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
            <a href="./users.cfm" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>