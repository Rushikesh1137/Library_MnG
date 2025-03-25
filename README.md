# Library Management System using SQL

## Project Overview

**Project Title**: Library Management System  
**Level**: Intermediate  
**Database**: `library_db`
**Platform**: PostgreSql

This project demonstrates the implementation of a **Library Management System** using SQL. The system allows managing and tracking library resources such as branches, employees, members, books, issued books, and return statuses. The project involves setting up a database, performing CRUD operations, creating advanced SQL queries, and ensuring the proper functioning of the library management system.
![Uploading image.png…]()


### Features:
- Creation and management of tables.
- Perform CRUD operations (Create, Read, Update, Delete).
- Complex SQL queries for data retrieval and manipulation.

## Objectives
1. **Set up the Library Management System Database**:  
   - Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
  
2. **CRUD Operations**:  
   - Perform basic operations on the data including adding, updating, retrieving, and deleting records.
  
3. **CTAS (Create Table As Select)**:  
   - Use CTAS to create new tables based on query results.

4. **Advanced SQL Queries and Window Functions**:  
   - Develop complex queries to analyze and retrieve specific data, such as finding books that are overdue or retrieving all employees from a specific branch.

## Project Structure

### 1. **Database Setup**
![image](https://github.com/user-attachments/assets/f764c360-2e80-4478-ac05-a3af9f1c6c4b)


- **ERD**:  
  The database design includes an **Entity-Relationship Diagram (ERD)** that represents the relationships between different entities in the library system.

- **Database Creation**:  
  - A database named `library_db` is created to store all the relevant data for the library.
  
- **Table Creation**:  
  - The following tables are created in the database:
    - `branches` - Contains information about different library branches.
    - `employees` - Stores data related to library staff.
    - `members` - Details of library members.
    - `books` - Information about the books available in the library.
    - `issued_status` - Tracks whether a book is issued or not.
    - `return_status` - Tracks the return status of issued books.
  
    Each table includes relevant columns and relationships between them to ensure data integrity.

### 2. **SQL Queries**

- **Basic Queries**:  
  - Queries to add, update, and delete records in the tables also creating views for the database.
  
- **Complex Queries**:  
  - Queries to analyze data, such as retrieving books by category, overdue books, and books that are frequently issued.

- **CTAS Queries**:  
  - Used to create new tables by selecting data from existing ones based on specific conditions.



