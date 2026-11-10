# ONLINE STUDENT MENTORING SYSTEM
> **A web-based academic mentoring platform connecting Students, Faculty Staff, and Administrators.**  
> Developed with **Java, JSP, Java Servlets, JDBC, MySQL, Bootstrap 5, and Apache Tomcat**.

---

## 📋 Table of Contents
1. [Project Overview & Aim](#-project-overview--aim)
2. [Key Features by Role](#-key-features-by-role)
3. [Technology Stack](#-technology-stack)
4. [Website Workflow (PPT Slide Mapping)](#-website-workflow-ppt-slide-mapping)
5. [Project Folder Structure](#-project-folder-structure)
6. [Database Setup (MySQL)](#-database-setup-mysql)
7. [Default Demo Login Credentials](#-default-demo-login-credentials)
8. [How to Run in Visual Studio Code (VS Code)](#-how-to-run-in-visual-studio-code-vs-code)
9. [How to Run in Eclipse IDE](#-how-to-run-in-eclipse-ide)
10. [How to Build and Deploy via Maven & Tomcat Standalone](#-how-to-build-and-deploy-via-maven--tomcat-standalone)
11. [College Viva & Project Demonstration Q&A](#-college-viva--project-demonstration-qa)

---

## 🎯 Project Overview & Aim

In traditional college environments, students often communicate subject doubts across scattered informal channels (emails, WhatsApp, corridor chats). Consequently:
- Doubts are difficult to track.
- Questions get lost without formal resolution.
- Faculty lack a consolidated, structured view of student inquiries.

**Our Proposed Solution:**  
The **Online Student Mentoring System** moves routine academic doubt communication into a single, organized web portal:
- **Centralized Doubt Submission:** Students submit questions categorized by department and subject with urgency levels.
- **Faculty Review & Solutions:** Mentors view queries in a structured table, update resolution statuses, and provide step-by-step solutions.
- **Administrative Transparency:** Administrators monitor system status, track resolution metrics, and manage user accounts.

---

## 🌟 Key Features by Role

### 👨‍🎓 Student Portal (`student.jsp`)
- **Personalized Dashboard:** Displays welcome greeting with student's name and department.
- **Real-Time Stat Counters:** Total Doubts Asked, Awaiting Review, In Review, and Resolved Doubts.
- **"Ask a Doubt" Form:**
  - Department dropdown selection (CSE, ECE, EEE, MECH, CIVIL, IT, AI&DS).
  - Subject input with auto-suggestions (Java, DBMS, OS, Data Structures, etc.).
  - Priority selector (Normal, High, Low).
  - Detailed query text area.
- **"My Submitted Doubts" Table:**
  - Status tracking with color-coded badges (`Pending`, `In Review`, `Resolved`).
  - Search and filter by status tabs.
  - Interactive **"View Details" Modal** to read faculty feedback and solutions.

### 👨‍🏫 Staff / Faculty Dashboard (`staff.jsp`)
- **Centralized Query Console:** Displays all academic doubts submitted by students.
- **Department & Search Filtering:** Instant search bar and status filter tabs.
- **Doubts Table (Slide 06 layout):** ID, Student Name, Department, Subject, Query preview, Status badge, and Action.
- **"Review & Respond" Interactive Modal:**
  - View full student question.
  - Change status (`Pending` ➔ `In Review` ➔ `Resolved`).
  - Write detailed mentor guidance, explanations, and reference materials.

### 🛡️ Admin Dashboard (`admin.jsp`)
- **System Status Panel:** Real-time MySQL database ping, connection verification, server runtime, and JDBC driver status.
- **High-Level Metrics:** Total Registered Users, Student Count, Faculty Staff Count, Campus Doubts Logged.
- **User Management Tab:**
  - Directory of all accounts (ID, Username, Name, Role, Email, Department).
  - **"Add New User" Modal:** Create new Student, Faculty, or Admin accounts on the fly.
  - Secure user deletion (with self-deletion protection).
- **System Doubts Monitor:** College-wide query monitoring and moderation.
- **Re-Seed Demo Data Tool:** One-click reset to restore sample presentation data during live viva testing.

---

## 💻 Technology Stack

| Layer | Technology | Description |
|---|---|---|
| **Frontend** | HTML5, CSS3, JavaScript | Modern responsive design with custom Navy & Cyan theme |
| **UI Framework** | Bootstrap 5.3.2 & FontAwesome 6 | Responsive grid, cards, modals, and iconography |
| **Server Pages** | JavaServer Pages (JSP) | Dynamic view rendering with session state checks |
| **Backend** | Java Servlets (Jakarta EE 6.0) | `LoginServlet`, `DoubtServlet`, `UpdateDoubtServlet`, `AdminServlet`, `LogoutServlet` |
| **Database Connectivity** | JDBC (`PreparedStatement`) | Secure parameter binding preventing SQL injection |
| **Database** | MySQL (8.x / MariaDB) | Relational database (`mentoring_system`) |
| **Application Server** | Apache Tomcat 10.1+ | Servlet & JSP container supporting Jakarta EE |
| **Build & Dependency Tool**| Apache Maven 3.x | Build lifecycle & packaging into `OnlineMentoring.war` |

---

## 🔄 Website Workflow (PPT Slide Mapping)

The application follows the 5-step workflow defined in **Slide 05**:

```
[01 LOGIN] ───────────► [02 ROLE CHECK] ───────────► [03 DASHBOARDS]
User enters username    LoginServlet validates       Routes automatically to:
and password            credentials in MySQL         • Admin: admin.jsp
                                                     • Staff: staff.jsp
                                                     • Student: student.jsp
                                                              │
                                                              ▼
[05 STAFF REVIEW] ◄─────────────────────────────────── [04 SUBMIT DOUBT]
Faculty updates status &                             Student logs subject query;
writes resolution in MySQL                           DoubtServlet saves to database
```

---

## 📂 Project Folder Structure

```text
OnlineMentoring/
├── pom.xml                               # Maven project configuration & dependencies
├── database.sql                          # MySQL database creation & seed data script
├── README.md                             # Complete project documentation & guide
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── mentoring/
        │           ├── DBConnection.java          # JDBC connection manager & auto-init
        │           ├── LoginServlet.java          # Role-based authentication controller
        │           ├── LogoutServlet.java         # Session invalidation controller
        │           ├── DoubtServlet.java          # Student doubt submission controller
        │           ├── UpdateDoubtServlet.java    # Faculty status & reply controller
        │           └── AdminServlet.java          # Admin user & data management controller
        └── webapp/
            ├── WEB-INF/
            │   └── web.xml               # Web deployment descriptor
            ├── assets/
            │   ├── css/
            │   │   └── style.css         # Navy, White & Cyan custom styling
            │   └── js/
            │       └── main.js           # Client search, modals & demo quick-fill
            ├── index.jsp                 # Home Landing Page & Login Portal
            ├── student.jsp               # Student Dashboard
            ├── staff.jsp                 # Staff / Faculty Dashboard
            └── admin.jsp                 # System Admin Dashboard
```

---

## 🗄️ Database Setup (MySQL)

### Option 1: Automatic Self-Healing Setup (Recommended)
`DBConnection.java` includes an automatic schema initializer. If MySQL is running on `localhost:3306` with user `root` and password `""` (default in XAMPP / WampServer), the application **automatically creates the database `mentoring_system`, creates tables, and seeds sample records on first launch**!

### Option 2: Manual SQL Import via phpMyAdmin or MySQL CLI
1. Start MySQL via **XAMPP Control Panel** or MySQL Service.
2. Open **phpMyAdmin** (`http://localhost/phpmyadmin`) or MySQL Workbench.
3. Click on the **Import** tab.
4. Select the `database.sql` file located in the project root.
5. Click **Go** / **Execute**.

Or run via MySQL Terminal:
```bash
mysql -u root -p < database.sql
```

### Database Schema Summary:
- **`users` Table:** `id`, `username`, `password`, `role`, `full_name`, `email`, `department`, `created_at`.
- **`doubts` Table:** `doubt_id`, `student_username`, `department`, `subject`, `query_text`, `priority`, `status`, `reply_text`, `replied_by`, `created_at`, `updated_at`.

---

## 🔑 Default Demo Login Credentials

The project comes pre-seeded with accounts ready for project presentation:

| Role | Username | Password | Full Name | Department | Features Accessible |
|---|---|---|---|---|---|
| **Admin** | `admin` | `admin123` | System Administrator | Administration | Status panel, user CRUD, system doubts monitor, data reset |
| **Staff** | `staff_cse` | `staff123` | Dr. Rajesh Sharma | CSE | Review student doubts, change status, write answers |
| **Staff** | `staff_ece` | `staff123` | Prof. Ananya Sen | ECE | Faculty review for Electronics department |
| **Student** | `student_rahul` | `student123` | Rahul Verma | CSE | Ask doubts, track status, view faculty solutions |
| **Student** | `student_priya` | `student123` | Priya Nair | ECE | Ask doubts in Maths / Signals & view solutions |

> **Viva Demo Tip:** On the home page login card, click any of the **Demo Quick Fill** buttons (`[Admin]`, `[Staff]`, `[Student]`) to populate credentials instantly with one click!

---

## 🚀 How to Run in Visual Studio Code (VS Code)

### Prerequisites:
1. **JDK 17 or higher** installed.
2. **VS Code Extensions**:
   - *Extension Pack for Java* (by Microsoft)
   - *Community Server Connectors* or *Tomcat for Java*
   - *Maven for Java*

### Steps:
1. **Open Project Folder:**
   - Launch VS Code.
   - Click **File > Open Folder...** and select `OnlineMentoring`.
2. **Configure Tomcat 10:**
   - In the VS Code Activity Bar on the left, click on the **Tomcat** / **Servers** icon.
   - Click **+** (Add Server), choose **Apache Tomcat**, and browse to your Apache Tomcat 10 folder.
3. **Build the WAR:**
   - Open the integrated terminal in VS Code (`Ctrl + ~`).
   - Run:
     ```bash
     mvn clean package
     ```
   - This creates `target/OnlineMentoring.war`.
4. **Deploy & Run:**
   - Right-click the configured Tomcat server in the Servers panel and choose **Add Deployment > File / Folder**, then select `target/OnlineMentoring.war` (or right-click `OnlineMentoring.war` and click **Run on Tomcat Server**).
   - Start the server.
5. **Open in Browser:**
   - Visit: `http://localhost:8080/OnlineMentoring`

---

## ☕ How to Run in Eclipse IDE

### Prerequisites:
- **Eclipse IDE for Enterprise Java and Web Developers** (2022-09 or newer).
- **Apache Tomcat 10.1+** installed on your PC.

### Step-by-Step Instructions:
1. **Import the Project:**
   - Open Eclipse.
   - Click **File > Import...**
   - Expand **Maven** and select **Existing Maven Projects**, then click **Next**.
   - In **Root Directory**, browse to `OnlineMentoring`.
   - Ensure `pom.xml` is checked and click **Finish**.
2. **Configure Apache Tomcat 10 Server:**
   - Open the **Servers** tab at the bottom (if hidden, go to **Window > Show View > Servers**).
   - Click the link *"No servers are available. Click this link to create a new server..."*.
   - Expand **Apache**, select **Tomcat v10.1 Server**, and click **Next**.
   - Browse to your Tomcat installation directory (e.g., `C:\apache-tomcat-10.1.x`) and select your Java 17+ JRE.
   - Click **Finish**.
3. **Deploy & Run on Server:**
   - Right-click the imported project `OnlineMentoring` in Project Explorer.
   - Select **Run As > Run on Server**.
   - Choose the configured Tomcat 10 server and click **Finish**.
4. **Access the Website:**
   - Eclipse will open its internal browser, or open Chrome/Edge and navigate to:
     ```text
     http://localhost:8080/OnlineMentoring/
     ```

---

## 📦 How to Build and Deploy via Maven & Tomcat Standalone

If you prefer deploying directly to a standalone Apache Tomcat installation:

1. **Build the WAR File:**
   ```bash
   mvn clean package
   ```
2. **Copy the WAR File:**
   - Copy `target/OnlineMentoring.war` to your Apache Tomcat's `webapps/` directory:
     ```text
     C:\apache-tomcat-10.1.x\webapps\OnlineMentoring.war
     ```
3. **Start Apache Tomcat:**
   - Windows: Open `C:\apache-tomcat-10.1.x\bin\startup.bat`
   - Linux/Mac: `./bin/startup.sh`
4. **Access the Website:**
   - Navigate to: `http://localhost:8080/OnlineMentoring/`

---

## 🎓 College Viva & Project Demonstration Q&A

Here are common viva questions examiners ask and the concise technical answers:

### Q1: What architecture does this project follow?
> **Answer:** The project follows the **MVC (Model-View-Controller)** design pattern:
> - **Model:** MySQL database tables (`users`, `doubts`) and `DBConnection.java`.
> - **View:** JavaServer Pages (`index.jsp`, `student.jsp`, `staff.jsp`, `admin.jsp`) with Bootstrap 5.
> - **Controller:** Java Servlets (`LoginServlet`, `DoubtServlet`, `UpdateDoubtServlet`, `AdminServlet`).

### Q2: How does role-based login work?
> **Answer:** When a user logs in, `LoginServlet` executes a parameterized SQL query against the `users` table. If credentials match, it retrieves the user's `role` and binds attributes (`username`, `role`, `fullName`, `department`) to the `HttpSession`. It then redirects using `response.sendRedirect()`:
> - `Admin` ➔ `admin.jsp`
> - `Staff` ➔ `staff.jsp`
> - `Student` ➔ `student.jsp`

### Q3: Why did you use `PreparedStatement` instead of `Statement`?
> **Answer:** `PreparedStatement` pre-compiles SQL queries and uses parameterized inputs (`?`), which completely prevents **SQL Injection** attacks and optimizes execution performance.

### Q4: Why is `jakarta.servlet` used instead of `javax.servlet`?
> **Answer:** Starting with Tomcat 10 and Jakarta EE 9+, Java EE transitioned from the legacy `javax.*` namespace to the modern `jakarta.*` namespace. Using `jakarta.servlet` ensures full compatibility with the latest Apache Tomcat 10 and 11 servers.

### Q5: How is user session maintained across pages?
> **Answer:** Using `request.getSession()`. The server generates a unique session ID stored in a client cookie (`JSESSIONID`). Each JSP dashboard checks `session.getAttribute("role")` before rendering content. If a user tries to access a protected dashboard without logging in, the application automatically redirects them to the login page.

---

## 👥 Project Information
- **Project Title:** Online Student Mentoring System
- **Domain:** Web Development / Academic Information Systems
- **Language / Platform:** Java (JDK 17+)
- **Server:** Apache Tomcat 10.1+
- **Database:** MySQL 8.x

&copy; 2026 Online Student Mentoring System. All Rights Reserved.

#   m e n t o r c o n n e c t 2  
 #   m e n t o r c o n n e c t 2  
 