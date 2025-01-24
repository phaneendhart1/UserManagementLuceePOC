<cfset userController = createObject("component", "../UserController")>
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
        <table class="table table-striped" id="userTable">
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
</cfoutput>