
component {
    this.name = "UserManagementApp"
    this.datasource = "userdb"
    this.datasources["userdb"] = {
        class: "com.mysql.cj.jdbc.Driver", 
        bundleName: "com.mysql.cj", 
        bundleVersion: "9.0.0",
        connectionString: "jdbc:mysql://localhost:3306/userdb?characterEncoding=UTF-8&serverTimezone=Asia/Calcutta&maxReconnects=3",
        username: "root",
        password: "SQL@123",
        
        // optional settings
        connectionLimit:-1, // default:-1
        liveTimeout:15, // default: -1; unit: minutes
        alwaysSetTimeout:true, // default: false
        validate:false, // default: false
    };
    function onCorsRequest() {
        // Allow all origins
        getPageContext().getResponse().addHeader("Access-Control-Allow-Origin", "*");
        
        // Allowed methods
        getPageContext().getResponse().addHeader("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
        
        // Allowed headers
        getPageContext().getResponse().addHeader("Access-Control-Allow-Headers", "Content-Type,Authorization");
        
        // Handle preflight requests
        if (CGI.REQUEST_METHOD == "OPTIONS") {
            getPageContext().getResponse().setStatus(200);
            abort;
        }
    }
}    
