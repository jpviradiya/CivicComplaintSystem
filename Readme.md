
# Civic Complaint System

A web-based Java application designed to streamline the process of reporting and managing civic issues within a community. This system allows citizens to submit complaints and provides administrators with tools to track and resolve them.

## 🚀 Features

### For Citizens

* **User Registration & Login**: Secure authentication for community members.
* **Submit Complaints**: Users can report various civic issues including title, description, and location (e.g., Street Light, Potholes).
* **My Complaints**: A personal dashboard for users to view the history and status of their submitted complaints.

### For Administrators

* **Admin Dashboard**: Overview of all civic issues reported across the system.
* **Complaint Management**: View details for every complaint submitted by all users.
* **Status Updates**: Admins can update the progress of a complaint (e.g., "Pending" to "Resolved").
* **Reporting**: Generate summaries or specific reports on existing complaints.

## 🛠️ Tech Stack

* **Backend**: Java (Servlets).
* **Frontend**: JSP (JavaServer Pages), CSS (Custom Styles).
* **Database**: MySQL (managed via JDBC and a `DBUtil` utility class).
* **Build Tool**: Maven.
* **Security**: Authentication Filter to protect sensitive routes.

## 📂 Project Structure

* `com.project.civic.controller`: Contains servlets for handling requests (Login, Register, Complaints, etc.).
* `com.project.civic.model`: Data models representing `User` and `Complaint` entities.
* `com.project.civic.repository`: Data Access Objects (DAOs) for database operations.
* `com.project.civic.util`: Utility classes for database connectivity.
* `webapp/jsp`: Front-end views for the user and admin interfaces.

## 🔧 Setup & Installation

1. **Database Configuration**:
* Set up a MySQL database.
* Configure connection details (URL, Username, Password) in `src/main/java/com/project/civic/util/DBUtil.java`.


2. **Build**:
* Ensure Maven is installed.
* Run `mvn clean install` to build the `.war` file.


3. **Deployment**:
* Deploy the generated WAR file to a servlet container like Apache Tomcat.
* Access the application via `http://localhost:8080/CivicComplaintSystem/jsp/login.jsp`.