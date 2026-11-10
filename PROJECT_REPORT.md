# COLLEGE PROJECT REPORT
## ONLINE STUDENT MENTORING SYSTEM
**A Web-Based Academic Mentoring and Doubt Resolution Portal**

---

### Academic Project Details
- **Project Title:** Online Student Mentoring System
- **Domain:** Web Application / Academic Management Information Systems
- **Technology Stack:** Java (JDK 17+), JavaServer Pages (JSP), Java Servlets (Jakarta EE 6.0), JDBC PreparedStatement, MySQL 8.x, Apache Tomcat 10.1+, Bootstrap 5.3.2
- **Architecture:** Model-View-Controller (MVC) Pattern
- **Build Tool:** Apache Maven

---

## 📑 TABLE OF CONTENTS
1. [Abstract](#1-abstract)
2. [Introduction & Problem Statement](#2-introduction--problem-statement)
3. [Project Aim & Objectives](#3-project-aim--objectives)
4. [System Requirements Specification](#4-system-requirements-specification)
5. [System Design & Architecture](#5-system-design--architecture)
6. [Data Flow Diagrams (DFD)](#6-data-flow-diagrams-dfd)
7. [Entity-Relationship (ER) Diagram](#7-entity-relationship-er-diagram)
8. [Use Case Analysis](#8-use-case-analysis)
9. [Database Schema & Data Dictionary](#9-database-schema--data-dictionary)
10. [Module Descriptions & Workflows](#10-module-descriptions--workflows)
11. [Testing & Test Cases](#11-testing--test-cases)
12. [Future Enhancements & Conclusion](#12-future-enhancements--conclusion)
13. [Viva Voce Questions & Technical Answers](#13-viva-voce-questions--technical-answers)

---

## 1. Abstract

The **Online Student Mentoring System** is an enterprise-grade Java web application engineered to bridge the communication gap between undergraduate students and faculty mentors. In contemporary higher education environments, students often resort to informal communication channels (messaging apps, personal emails, verbal corridor inquiries) to clarify subject-specific doubts. These fragmented methods result in lost inquiries, lack of tracking, and absence of an institutional knowledge repository.

This project introduces a centralized, role-based academic portal connecting **Students**, **Faculty Staff**, and **System Administrators**. Using **Java Servlets**, **JavaServer Pages (JSP)**, and **MySQL** accessed via secure **JDBC PreparedStatements**, the system provides structured doubt submission categorized by engineering department, subject, and priority level. Faculty members can systematically review queries, update resolution statuses (`Pending` ➔ `In Review` ➔ `Resolved`), and provide documented explanations. An administrative console monitors live database health and oversees user accounts.

---

## 2. Introduction & Problem Statement

### 2.1 The Existing System Challenges (PPT Slide 03)
In conventional academic environments:
1. **Scattered Communication Channels:** Academic queries are disseminated across disparate mediums including emails, WhatsApp groups, and classroom intervals.
2. **Lack of Query Traceability:** Questions frequently remain unacknowledged, unresolved, or forgotten with zero audit history.
3. **No Consolidated View for Faculty:** Mentors do not possess a single organized dashboard to prioritize queries based on urgency and subject area.
4. **No Institutional Knowledge Base:** Solutions provided privately to individual students are not preserved for future reference.

### 2.2 The Proposed Solution
The Online Student Mentoring System resolves these deficiencies through:
- **Unified Portal:** A single web entry point with automated role-based access control.
- **Structured Categorization:** Mandatory department, subject, and priority tagging.
- **Transparent Query Lifecycle:** Real-time visibility into whether a query is Pending, Under Review, or Resolved.
- **Permanent Database Persistence:** All student questions, faculty responses, and timestamps are recorded in MySQL.

---

## 3. Project Aim & Objectives

### 3.1 Primary Aim
> *"To make student–staff academic communication more organized, accessible, and trackable through a centralized web application."* (Slide 02)

### 3.2 Specific Objectives
1. Implement a modern, responsive web interface styled with a professional Navy Blue, White, and Cyan palette.
2. Construct role-based dashboards tailored for Students, Faculty Staff, and System Administrators.
3. Enforce secure authentication and session management via `LoginServlet` and `HttpSession`.
4. Implement parameterized JDBC data operations to prevent SQL Injection attacks.
5. Provide faculty review capabilities including status updating and mentor feedback entry.
6. Provide administrative tools for live database status monitoring and user directory management.

---

## 4. System Requirements Specification

### 4.1 Hardware Requirements
- **Processor:** Intel Core i3 / AMD Ryzen 3 or higher
- **Memory (RAM):** Minimum 4 GB (8 GB recommended)
- **Hard Disk Space:** Minimum 500 MB free disk space
- **Display Resolution:** 1280 x 720 or higher (Fully responsive for mobile devices)

### 4.2 Software Requirements
- **Operating System:** Windows 10/11, Linux, or macOS
- **Java Development Kit:** JDK 17 or higher
- **Application Server:** Apache Tomcat 10.1+ (Jakarta Servlet 6.0 compatible)
- **Database Server:** MySQL 8.0+ or MariaDB 10.4+ (XAMPP / WampServer supported)
- **Database Driver:** `mysql-connector-j` 8.3.0
- **Web Browser:** Google Chrome, Microsoft Edge, Mozilla Firefox, or Safari
- **IDE:** Eclipse IDE for Enterprise Java / Visual Studio Code / IntelliJ IDEA

---

## 5. System Design & Architecture

### 5.1 Model-View-Controller (MVC) Architecture
The project strictly implements the enterprise **MVC design pattern**:

```
                          ┌──────────────────────────┐
                          │   Client Browser         │
                          │   (HTML5, CSS3, JS)      │
                          └─────────────┬────────────┘
                                        │ HTTP Request
                                        ▼
    ┌──────────────────────────────────────────────────────────────────┐
    │ CONTROLLER LAYER (Java Servlets)                                 │
    │ • LoginServlet       • DoubtServlet      • UpdateDoubtServlet    │
    │ • AdminServlet       • RegisterServlet   • LogoutServlet         │
    └──────────────┬───────────────────────────────────┬───────────────┘
                   │                                   │
                   │ Dispatches View                   │ Executes Queries
                   ▼                                   ▼
    ┌─────────────────────────────┐     ┌──────────────────────────────┐
    │ VIEW LAYER (JSP & UI)       │     │ MODEL & DATA ACCESS LAYER    │
    │ • index.jsp  • student.jsp  │     │ • DBConnection.java          │
    │ • staff.jsp  • admin.jsp    │     │ • JDBC PreparedStatements    │
    │ • Bootstrap 5 & FontAwesome │     └──────────────┬───────────────┘
    └─────────────────────────────┘                    │
                                                       ▼
                                        ┌──────────────────────────────┐
                                        │ DATABASE LAYER               │
                                        │ • MySQL (mentoring_system)   │
                                        │ • users table • doubts table │
                                        └──────────────────────────────┘
```

---

## 6. Data Flow Diagrams (DFD)

### 6.1 DFD Level 0 (Context Diagram)
```
       ┌───────────┐      Credentials & Doubt Data     ┌────────────────────────┐
       │  Student  ├──────────────────────────────────►│                        │
       │           │◄──────────────────────────────────┤                        │
       └───────────┘      Status & Mentor Responses    │                        │
                                                       │                        │
       ┌───────────┐      Review & Feedback Data       │     ONLINE STUDENT     │
       │   Staff   ├──────────────────────────────────►│    MENTORING SYSTEM    │
       │  (Faculty)│◄──────────────────────────────────┤                        │
       └───────────┘      Student Doubts Table         │                        │
                                                       │                        │
       ┌───────────┐      User CRUD & Reset Triggers   │                        │
       │   Admin   ├──────────────────────────────────►│                        │
       │           │◄──────────────────────────────────┤                        │
       └───────────┘      System Status & Logs         └────────────────────────┘
```

### 6.2 DFD Level 1 (Detailed Functional Process)
```
[User] ──(Credentials)──► [1.0 Authenticate] ──► [users Table]
                                │
                                ├─► If Student ──► [2.0 Submit Doubt] ──► [doubts Table]
                                │                         │
                                ├─► If Staff   ──► [3.0 Review Doubt] ◄───┤
                                │                         │
                                │                         ▼
                                │                  [Update Status]
                                │
                                └─► If Admin   ──► [4.0 System Monitor] ──► [User Management]
```

---

## 7. Entity-Relationship (ER) Diagram

```
┌─────────────────────────┐                   ┌─────────────────────────┐
│          USERS          │                   │         DOUBTS          │
├─────────────────────────┤                   ├─────────────────────────┤
│ PK  id (INT)            │ 1               * │ PK  doubt_id (INT)      │
│     username (VARCHAR)  ├───────────────────┤ FK  student_username    │
│     password (VARCHAR)  │  Submits Doubts   │     department (VARCHAR)│
│     role (VARCHAR)      │                   │     subject (VARCHAR)   │
│     full_name (VARCHAR) │                   │     query_text (TEXT)   │
│     email (VARCHAR)     │                   │     priority (VARCHAR)  │
│     department (VARCHAR)│                   │     status (VARCHAR)    │
│     created_at (TS)     │                   │     reply_text (TEXT)   │
└─────────────────────────┘                   │     replied_by (VARCHAR)│
                                              │     created_at (TS)     │
                                              │     updated_at (TS)     │
                                              └─────────────────────────┘
```

- **Cardinality:** One-to-Many (`1 : N`). One Student can submit multiple Doubts. One Faculty member can reply to multiple Doubts.

---

## 8. Use Case Analysis

### 8.1 Student Actors
- Sign in with credentials or register a new student account.
- View personalized metrics (Total, Pending, In Review, Resolved queries).
- Submit new academic doubts specifying Department, Subject, Priority, and Description.
- Track real-time status of submitted queries.
- Open detail modal to read faculty explanations and mentor solutions.
- Safely terminate session via Logout.

### 8.2 Staff / Faculty Actors
- Sign in to the faculty management console.
- View all student doubts in a structured, sortable table (Slide 06).
- Filter doubts by Department, Subject, or Status.
- Search queries using live keyword filtering.
- Review student doubts in a modal dialog.
- Update resolution status (`Pending` ➔ `In Review` ➔ `Resolved`).
- Author detailed technical explanations and reference guidance.
- Print / export academic review summaries.

### 8.3 System Administrator Actors
- Access the system overview and diagnostic panel.
- Verify live database connection health (MySQL ping, database name, JDBC driver).
- View college-wide metrics (Total Users, Students, Faculty, Total Queries).
- Manage user accounts (View user directory, Add new users, Delete accounts).
- Moderate campus-wide queries.
- Trigger default demo data re-seeding for demonstrations.

---

## 9. Database Schema & Data Dictionary

### Database Name: `mentoring_system`

#### Table 1: `users`
| Field | Type | Null | Key | Default | Description |
|---|---|---|---|---|---|
| `id` | INT | NO | PRI | AUTO_INCREMENT | Unique user identifier |
| `username` | VARCHAR(50) | NO | UNI | None | Unique login handle |
| `password` | VARCHAR(100) | NO | | None | Login authentication secret |
| `role` | VARCHAR(20) | NO | | None | User tier (`Admin`, `Staff`, `Student`) |
| `full_name` | VARCHAR(100) | YES | | NULL | Full legal / academic name |
| `email` | VARCHAR(100) | YES | | NULL | Institutional email address |
| `department`| VARCHAR(50) | YES | | 'General' | Academic department (CSE, ECE, etc.) |
| `created_at`| TIMESTAMP | YES | | CURRENT_TIMESTAMP | Registration timestamp |

#### Table 2: `doubts`
| Field | Type | Null | Key | Default | Description |
|---|---|---|---|---|---|
| `doubt_id` | INT | NO | PRI | AUTO_INCREMENT | Primary key for doubts |
| `student_username` | VARCHAR(50) | YES | MUL | NULL | Foreign reference to student user |
| `department` | VARCHAR(50) | NO | MUL | None | Department offering the subject |
| `subject` | VARCHAR(100) | NO | | None | Academic course title |
| `query_text` | TEXT | NO | | None | Full text of student's doubt |
| `priority` | VARCHAR(20) | YES | | 'Normal' | Urgency level (`Low`, `Normal`, `High`) |
| `status` | VARCHAR(30) | YES | MUL | 'Pending' | Lifecycle state (`Pending`, `In Review`, `Resolved`) |
| `reply_text` | TEXT | YES | | NULL | Faculty mentor's response / solution |
| `replied_by` | VARCHAR(50) | YES | | NULL | Username of faculty reviewer |
| `created_at` | TIMESTAMP | YES | | CURRENT_TIMESTAMP | Creation timestamp |
| `updated_at` | TIMESTAMP | YES | | CURRENT_TIMESTAMP | Last modification timestamp |

---

## 10. Module Descriptions & Workflows

### 10.1 Authentication & Redirection Controller (`LoginServlet.java`)
1. Receives HTTP POST request containing `username` and `password`.
2. Validates inputs against `users` table via `DBConnection`.
3. If valid:
   - Allocates an `HttpSession`.
   - Binds `userId`, `username`, `role`, `fullName`, and `department`.
   - Routes user via `response.sendRedirect()`:
     - Role `"Admin"` ➔ `admin.jsp`
     - Role `"Staff"` ➔ `staff.jsp`
     - Role `"Student"` ➔ `student.jsp`
4. If invalid:
   - Redirects to `index.jsp?error=invalid#login-section`.

### 10.2 Doubt Submission Controller (`DoubtServlet.java`)
1. Checks active session existence and verifies user authentication.
2. Extracts `department`, `subject`, `query_text`, and `priority`.
3. Validates that required text fields are non-empty.
4. Executes `INSERT INTO doubts (student_username, department, subject, query_text, priority, status) VALUES (?, ?, ?, ?, ?, 'Pending')`.
5. Redirects to `student.jsp?success=doubt_submitted`.

### 10.3 Mentor Review Controller (`UpdateDoubtServlet.java`)
1. Verifies user role is `"Staff"` or `"Admin"`.
2. Extracts `doubt_id`, `status`, and `reply_text`.
3. Executes `UPDATE doubts SET status=?, reply_text=?, replied_by=?, updated_at=CURRENT_TIMESTAMP WHERE doubt_id=?`.
4. Redirects to `staff.jsp?success=updated`.

### 10.4 Administration Controller (`AdminServlet.java`)
1. Enforces strict administrative privilege verification.
2. Supports actions:
   - `add_user`: Creates new Student, Staff, or Admin accounts.
   - `delete_user`: Removes user accounts while safeguarding active admin.
   - `delete_doubt`: Deletes inappropriate queries.
   - `reset_sample_data`: Re-seeds baseline demo data for presentation testing.

---

## 11. Testing & Test Cases

| Test Case ID | Test Scenario | Input Data | Expected Result | Actual Result | Status |
|---|---|---|---|---|---|
| **TC-01** | Student Valid Login | `student_rahul` / `student123` | Redirects to `student.jsp` with welcome banner | Directed to `student.jsp` | **PASS** |
| **TC-02** | Staff Valid Login | `staff_cse` / `staff123` | Redirects to `staff.jsp` showing queries table | Directed to `staff.jsp` | **PASS** |
| **TC-03** | Admin Valid Login | `admin` / `admin123` | Redirects to `admin.jsp` showing status panel | Directed to `admin.jsp` | **PASS** |
| **TC-04** | Invalid Credentials | `wrong_user` / `wrong_pass` | Redirects to `index.jsp?error=invalid` with alert | Error alert rendered | **PASS** |
| **TC-05** | Unauthorized URL Access | Direct GET `admin.jsp` without session | Intercepts request and redirects to login | Redirected to `index.jsp` | **PASS** |
| **TC-06** | Student Submit Doubt | Dept: `CSE`, Subj: `Java`, Query: `OOP Doubt` | Inserts into MySQL with status `Pending` | Row inserted, counter +1 | **PASS** |
| **TC-07** | Staff Update Status | Doubt #3: Status ➔ `Resolved` + Answer | Updates record, badge turns green | Status updated in DB | **PASS** |
| **TC-08** | Admin User Creation | User: `staff_maths`, Role: `Staff` | User created and displayed in directory | User visible in table | **PASS** |
| **TC-09** | Prevent Self Delete | Admin attempts to delete currently active ID | Blocked with warning message | Action prevented | **PASS** |
| **TC-10** | Session Logout | User clicks "Logout" button | Session invalidated; redirected to `index.jsp` | Session cleared | **PASS** |

---

## 12. Future Enhancements & Conclusion

### 12.1 Proposed Future Extensions (Slide 09)
1. **Password Hashing:** Integrating BCrypt or PBKDF2 hashing for database password encryption.
2. **File & Diagram Attachments:** Allowing students to upload screenshots of error traces and circuit diagrams.
3. **Live Chat & Notifications:** Real-time WebSocket or email notifications when a mentor responds.
4. **Appointment Scheduling:** Booking face-to-face or virtual 1-on-1 mentoring slots.

### 12.2 Conclusion
The **Online Student Mentoring System** successfully replaces informal, unstructured doubt communication with a cohesive, institutional web application. By leveraging modern Java EE technologies (JSP, Servlets, JDBC, MySQL) combined with a responsive Navy-White-Cyan interface, the system ensures complete transparency, accountability, and academic accessibility for students and faculty alike.

---

## 13. Viva Voce Questions & Technical Answers

### Q1: What is the Model-View-Controller (MVC) architecture in this project?
> **Answer:** MVC separates presentation, business logic, and database access:
> - **Model:** The MySQL database (`users`, `doubts` tables) and `DBConnection.java`.
> - **View:** The JSP pages (`index.jsp`, `student.jsp`, `staff.jsp`, `admin.jsp`) rendered with Bootstrap 5.
> - **Controller:** Java Servlets (`LoginServlet`, `DoubtServlet`, `UpdateDoubtServlet`, `AdminServlet`) that handle client HTTP requests and orchestrate model/view interactions.

### Q2: What is the difference between `PreparedStatement` and `Statement`?
> **Answer:** `PreparedStatement` pre-compiles the SQL query in the database and accepts parameterized input values (`?`). This provides two crucial advantages:
> 1. It completely eliminates **SQL Injection** vulnerabilities because input parameters are treated strictly as literals, not executable code.
> 2. It improves execution speed when running repeated queries through pre-compiled execution plans.

### Q3: Why is `jakarta.servlet` used instead of `javax.servlet`?
> **Answer:** In 2019, Oracle transferred Java EE to the Eclipse Foundation under the Jakarta EE project. Starting with **Jakarta EE 9 and Tomcat 10**, all servlet APIs were migrated from the legacy `javax.*` namespace to `jakarta.*`. Using `jakarta.servlet-api:6.0.0` ensures full compatibility with the latest Apache Tomcat 10.1+ servers.

### Q4: How is user session tracking maintained across different pages?
> **Answer:** Using Java's `HttpSession` mechanism (`request.getSession()`). When a user logs in, the servlet container assigns a unique session identifier transmitted via a secure HTTP cookie (`JSESSIONID`). Protected dashboards check `session.getAttribute("role")` before rendering; if the attribute is absent or unauthorized, the user is redirected to the login page.

### Q5: How does the role-based redirection work?
> **Answer:** In `LoginServlet`, after credentials are authenticated against the `users` table, the user's `role` string (`"Admin"`, `"Staff"`, or `"Student"`) is retrieved. A condition statement determines the destination:
> - `if ("Admin".equalsIgnoreCase(role)) response.sendRedirect("admin.jsp");`
> - `else if ("Staff".equalsIgnoreCase(role)) response.sendRedirect("staff.jsp");`
> - `else response.sendRedirect("student.jsp");`

---
*End of College Project Report • Online Student Mentoring System*

