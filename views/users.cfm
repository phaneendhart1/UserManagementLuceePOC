<!--- <cfset userController = createObject("component", "../UserController")>
<cfset users = userController.listUsers()>
<cfoutput>
<html>
<head>
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h2>User List</h2>
        <table class="table table-bordered text-center" id="userTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfloop array="#users#" index="user">
                    <tr>
                        <td>#user.id#</td>
                        <td>#user.first_name#</td>
                        <td>#user.last_name#</td>
                        <td>#user.email#</td>
                        <td>
                            <a href="edit.cfm?id=#user.id#" class="btn btn-sm btn-primary" onclick="editUser(#user.id#)">Edit</a>
                            <a  href="delete.cfm?id=#user.id#" class="btn btn-sm btn-danger" onclick="deleteUser(#user.id#)">Delete</a>
                            <!--- <button class="btn btn-sm btn-danger" onclick="confirmDelete(#user.id#)">Delete</button> --->
                            <!--- <button class="btn btn-sm btn-danger" onclick="openDeleteModal(#user.id#)">Delete</button> --->
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
        <button class="btn btn-success" onclick="createUser()">Add User</button>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this user?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function createUser() {
            window.location.href = "create.cfm";
        }
        function editUser(userId) {
            alert("Editing user with ID: " + userId);
            window.location.href = "edit.cfm?id=" + userId;
        }
        function deleteUser(userId) {
            alert("Deleting user with ID: " + userId);
            window.location.href = "delete.cfm?id=" + userId;
        }

        let userIdToDelete = null;

        function openDeleteModal(userId) {
            userIdToDelete = userId; // Store the user ID to delete
            const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            deleteModal.show(); // Show the modal
        }

        document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
            if (userIdToDelete) {
                axios.delete('http://localhost:8888/rest/api/users/' + userIdToDelete)
                    .then(function (response) {
                        alert(response.data.message);
                        window.location.reload(); // Reload the page to reflect changes
                    })
                    .catch(function (error) {
                        alert('Error deleting user: ' + error.message);
                    })
                    .finally(function () {
                        // Hide the modal after processing
                        const deleteModal = bootstrap.Modal.getInstance(document.getElementById('deleteModal'));
                        deleteModal.hide();
                        userIdToDelete = null; // Reset the stored user ID
                    });
            }
        });
        <!--- function deleteUser(userId) {
            alert("Deleting user with ID: " + userId);
            if (confirm("Are you sure you want to delete this user?")) {
                axios.delete('/api/users/' + userId)
                    .then(function (response) {
                        alert(response.data.message);
                        window.location.reload();
                    })
                    .catch(function (error) {
                        alert("Error deleting user: " + error.message);
                    });
            }
        } --->
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
</cfoutput> --->
<cfset userController = createObject("component", "../UserController")>
<cfset users = userController.listUsers()>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
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

        table {
            border-radius: 10px;
            overflow: hidden;
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        thead {
            background-color: #007bff;
            color: white;
        }

        tbody tr:nth-child(odd) {
            background-color: #343a40;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #495057;
            color: white;
        }

        tbody tr:hover {
            background-color: #212529;
            transition: background-color 0.3s ease;
        }

        

        .btn-edit {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .btn-edit:hover {
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

        .btn-add {
            margin: 25px;
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: bold;
        }

        .btn-add:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">User List</h1>
        <table class = "tableheader" class="table table-bordered text-center ">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput>
                    <!--- <tr>
                        <td>1</td>
                        <td>Jane</td>
                        <td>Doe</td>
                        <td>jane.doe@example.com</td>
                        <td>
                            <a href="editUser.cfm?id=1" class="btn btn-edit">Edit</a>
                            <a href="deleteUser.cfm?id=1" class="btn btn-delete">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Mark</td>
                        <td>Smith</td>
                        <td>mark.smith@example.com</td>
                        <td>
                            <a href="editUser.cfm?id=2" class="btn btn-edit">Edit</a>
                            <a href="deleteUser.cfm?id=2" class="btn btn-delete">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Alice</td>
                        <td>Johnson</td>
                        <td>alice.johnson@example.com</td>
                        <td>
                            <a href="editUser.cfm?id=3" class="btn btn-edit">Edit</a>
                            <a href="deleteUser.cfm?id=3" class="btn btn-delete">Delete</a>
                        </td>
                    </tr>
                    <tr>
                        <td>14</td>
                        <td>Phaneendhar</td>
                        <td>Thota</td>
                        <td>phani@gmail.com</td>
                        <td>
                            <a href="editUser.cfm?id=14" class="btn btn-edit">Edit</a>
                            <a href="deleteUser.cfm?id=14" class="btn btn-delete">Delete</a>
                        </td>
                    </tr> --->
                    <cfloop array="#users#" index="user">
                        <tr>
                            <td>#user.id#</td>
                            <td>#user.first_name#</td>
                            <td>#user.last_name#</td>
                            <td>#user.email#</td>
                            <td>
                                <a href="edit.cfm?id=#user.id#" class="btn btn-sm btn-primary" onclick="editUser(#user.id#)">Edit</a>
                                <a  href="delete.cfm?id=#user.id#" class="btn btn-sm btn-danger" onclick="deleteUser(#user.id#)">Delete</a>
                                <!--- <button class="btn btn-sm btn-danger" onclick="confirmDelete(#user.id#)">Delete</button> --->
                                <!--- <button class="btn btn-sm btn-danger" onclick="openDeleteModal(#user.id#)">Delete</button> --->
                            </td>
                        </tr>
                    </cfloop>
                </cfoutput>
            </tbody>
        </table>

        <div class="text-center">
            <a class="btn btn-add" onclick="createUser()">Add User</a>
            <!--- <button class="btn btn-success" onclick="createUser()">Add User</button> --->

        </div>
    </div>

    <script>
        function createUser() {
            window.location.href = "create.cfm";
        }
        function editUser(userId) {
            alert("Editing user with ID: " + userId);
            window.location.href = "edit.cfm?id=" + userId;
        }
        function deleteUser(userId) {
            alert("Deleting user with ID: " + userId);
            window.location.href = "delete.cfm?id=" + userId;
        }

        let userIdToDelete = null;

        function openDeleteModal(userId) {
            userIdToDelete = userId; // Store the user ID to delete
            const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            deleteModal.show(); // Show the modal
        }

        document.getElementById('confirmDeleteBtn').addEventListener('click', function () {
            if (userIdToDelete) {
                axios.delete('http://localhost:8888/rest/api/users/' + userIdToDelete)
                    .then(function (response) {
                        alert(response.data.message);
                        window.location.reload(); // Reload the page to reflect changes
                    })
                    .catch(function (error) {
                        alert('Error deleting user: ' + error.message);
                    })
                    .finally(function () {
                        // Hide the modal after processing
                        const deleteModal = bootstrap.Modal.getInstance(document.getElementById('deleteModal'));
                        deleteModal.hide();
                        userIdToDelete = null; // Reset the stored user ID
                    });
            }
        });
        <!--- function deleteUser(userId) {
            alert("Deleting user with ID: " + userId);
            if (confirm("Are you sure you want to delete this user?")) {
                axios.delete('/api/users/' + userId)
                    .then(function (response) {
                        alert(response.data.message);
                        window.location.reload();
                    })
                    .catch(function (error) {
                        alert("Error deleting user: " + error.message);
                    });
            }
        } --->
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
