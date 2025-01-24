```markdown
# User Management Application

This is a ColdFusion-based User Management Application that allows users to create, edit, view, and delete user records. The application uses a MySQL database to store user information and provides both web-based and RESTful API interfaces for managing users.

## Project Structure

```
Application.cfc
save.cfm
UserController.cfc
UserService.cfc
views/
    create.cfm
    edit.cfm
    users.cfm
    
```

### Files and Directories

- **Application.cfc**: This is the application configuration file. It sets up the datasource for the application and configures the database connection.
- **save.cfm**: This file handles the form submissions for creating and updating users. It calls the appropriate methods in `UserService.cfc` and redirects to the user list view.
- **UserController.cfc**: This is the RESTful API controller for managing users. It provides endpoints for listing, retrieving, creating, updating, and deleting users.
- **UserService.cfc**: This is the service layer that interacts with the database. It contains methods for CRUD operations on the user records.
- **views/**: This directory contains the ColdFusion Markup Language (CFML) files for the web-based user interface.
  - **create.cfm**: The form for creating a new user.
  - **edit.cfm**: The form for editing an existing user.
  - **users.cfm**: The user list view that displays all users and provides options to edit or delete them.

## Application Workflow

1. **User List View**: The application starts by displaying the user list view (`views/users.cfm`). This view fetches all users from the database using the `getAllUsers` method in `UserService.cfc` and displays them in a table. Users can click on "Add User" to create a new user or "Edit" to edit an existing user.

2. **Create User**: When the user clicks on "Add User", they are taken to the create user form (`views/create.cfm`). The form submits to `save.cfm`, which calls the `createUser` method in `UserService.cfc` to insert the new user into the database. After the user is created, the application redirects back to the user list view.

3. **Edit User**: When the user clicks on "Edit", they are taken to the edit user form (`views/edit.cfm`). The form is pre-filled with the user's current information, fetched using the `getUserById` method in `UserService.cfc`. The form submits to `save.cfm`, which calls the `updateUser` method in `UserService.cfc` to update the user's information in the database. After the user is updated, the application redirects back to the user list view.

4. **Delete User**: Users can delete a user by clicking on the "Delete" button in the user list view. This action calls the `deleteUser` method in `UserService.cfc` via an AJAX request to the RESTful API endpoint provided by `UserController.cfc`.

## RESTful API

The application also provides a RESTful API for managing users. The API endpoints are defined in `UserController.cfc`:

- **GET /api/users**: List all users.
- **GET /api/users/{userId}**: Retrieve a specific user by ID.
- **POST /api/users**: Create a new user.
- **PUT /api/users/{userId}**: Update an existing user.
- **DELETE /api/users/{userId}**: Delete a user.

## Database Configuration

The application uses a MySQL database named `userdb`. The database connection is configured in `Application.cfc`:

```cfc
component {
    this.name = "UserManagementApp"
    this.datasource = "userdb"
    this.datasources["userdb"] = {
        class: "com.mysql.cj.jdbc.Driver", 
        bundleName: "com.mysql.cj", 
        bundleVersion: "9.0.0",
        connectionString: "jdbc:mysql://localhost:3306/userdb?characterEncoding=UTF-8&serverTimezone=Asia/Calcutta&maxReconnects=3",
        username: "root",
        
        // optional settings
        connectionLimit:-1, // default:-1
        liveTimeout:15, // default: -1; unit: minutes
        alwaysSetTimeout:true, // default: false
        validate:false, // default: false
    };
}
```

## Required Software and Their Usage

1. **Visual Studio Code (VSCode)**
   - **Usage**: A source code editor used for writing and editing the ColdFusion code and other project files. It provides syntax highlighting, debugging, and extensions for various programming languages.

2. **MySQL Workbench 8.0.40**
   - **Usage**: A graphical tool for database design and management. It is used to create, manage, and query the MySQL database (`userdb`) used by the application.

3. **MySQL Server 9.0.10**
   - **Usage**: The database server where the `userdb` database is hosted. It stores all user data and handles database queries from the application.

4. **CommandBox**
   - **Usage**: A command-line tool for managing ColdFusion (CFML) servers. It is used to start and stop the Lucee server, manage dependencies, and run the application.

5. **Lucee**
   - **Usage**: An open-source CFML application server used to run the ColdFusion code. It processes the CFML files and serves the web application.

6. **Git Bash**
   - **Usage**: A command-line interface for Git, used for version control. It allows you to manage the project's source code, track changes, and collaborate with other developers.

7. **Postman**
   - **Usage**: An API testing tool used to test the RESTful API endpoints provided by the application. It allows you to send HTTP requests and view responses to ensure the API is working correctly.

## Installation and Setup

1. **Visual Studio Code**
   - Download and install from [VSCode website](https://code.visualstudio.com/).

2. **MySQL Workbench 8.0.40**
   - Download and install from [MySQL Workbench website](https://dev.mysql.com/downloads/workbench/).

3. **MySQL Server 9.0.10**
   - Download and install from [MySQL website](https://dev.mysql.com/downloads/mysql/).

4. **CommandBox**
   - Download and install from [CommandBox website](https://www.ortussolutions.com/products/commandbox).

5. **Lucee**
   - Install via CommandBox using the command: `box install lucee`.

6. **Git Bash**
   - Download and install from [Git for Windows website](https://gitforwindows.org/).

7. **Postman**
   - Download and install from [Postman website](https://www.postman.com/downloads/).

## Usage Instructions

1. **Visual Studio Code**
   - Open the project folder in VSCode to edit and manage the code files.

2. **MySQL Workbench**
   - Use MySQL Workbench to create and manage the `userdb` database.

3. **MySQL Server**
   - Ensure the MySQL server is running to allow the application to connect to the database.

4. **CommandBox**
   - Use CommandBox to start the Lucee server with the command: `box server start`.

5. **Lucee**
   - The Lucee server will run the ColdFusion application and serve it on a specified port.

6. **Git Bash**
   - Use Git Bash to manage the project's source code with Git commands.

7. **Postman**
   - Use Postman to test the RESTful API endpoints by sending HTTP requests and verifying the responses.

## Running the Application

1. Ensure that ColdFusion server is installed and running.
2. Create a MySQL database named `userdb` and configure the datasource in 

Application.cfc

.
3. Deploy the application files to the ColdFusion server.
4. Access the application through the web browser to manage users.

## Conclusion

This User Management Application provides a simple interface for managing user records with both web-based and RESTful API interfaces. The project structure is organized to separate concerns between the user interface, service layer, and application configuration.
```