# Book Management System (JDBC CRUD Practice)

A simple web-based Book Management System built using **Jakarta EE (Servlets & JSP)** and **JDBC API**. This project demonstrates how to perform basic CRUD (Create, Read, Update, Delete) operations with a PostgreSQL database.

### Purpose
The goal of this project is to practice the JDBC API and understand the underlying architecture of web applications before diving into frameworks like Spring Boot.

### Features
- **Add New Books:** Save book details, including titles, authors, ISBNs, and links to PDF versions or bookstore addresses.
- **List All Books:** View a list of all stored books in a dynamic table.
- **Update Book Info:** Edit the title, author, or URL of any existing book.
- **Delete Books:** Remove outdated or incorrect book entries.

### Architecture & Design
The project follows a modular structure to ensure clean code and better maintainability:

* **Config (`DatabaseConfig.java`):** Centralizes database connection logic. It implements the **DRY (Don't Repeat Yourself)** principle by providing a single point for `DriverManager` calls.
* **DAO (`BookDAO.java`):** Implements the **Data Access Object** pattern. All SQL queries (SELECT, INSERT, UPDATE, DELETE) are encapsulated here.
* **Model (`Book.java`):** A POJO (Plain Old Java Object) representing the Book entity, utilizing **Lombok** for cleaner code.
* **Servlets:** Acts as a Controller that handles HTTP requests and communicates with the DAO layer.

### Project Structure
```text
├── pom.xml
├── src
│   ├── main
│   │   ├── java/.../bookmanagement
│   │   │   ├── config    <-- DB Connection logic
│   │   │   ├── dao       <-- Data Access Logic
│   │   │   ├── model     <-- Book Entity
│   │   │   └── servlet   <-- Web Controllers
│   │   ├── resources     <-- application.properties
│   │   └── webapp        <-- JSPs & Web Resources
```

### How to use
1. Clone the repository.
2. Configure your database credentials in `src/main/resources/application.properties`.
3. Run the application using a server like **Apache Tomcat**.
