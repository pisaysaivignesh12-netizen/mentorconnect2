-- =============================================================================
-- ONLINE STUDENT MENTORING SYSTEM
-- Database Creation & Schema Definition Script
-- Database: mentoring_system
-- =============================================================================

-- 1. Create database if not exists
CREATE DATABASE IF NOT EXISTS `mentoring_system` 
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `mentoring_system`;

-- -----------------------------------------------------------------------------
-- 2. Table structure for table `users`
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS `doubts`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `password` VARCHAR(100) NOT NULL,
  `role` VARCHAR(20) NOT NULL COMMENT 'Admin, Staff, or Student',
  `full_name` VARCHAR(100) DEFAULT NULL,
  `email` VARCHAR(100) DEFAULT NULL,
  `department` VARCHAR(50) DEFAULT 'General',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------------------------------
-- 3. Table structure for table `doubts`
-- -----------------------------------------------------------------------------
CREATE TABLE `doubts` (
  `doubt_id` INT NOT NULL AUTO_INCREMENT,
  `student_username` VARCHAR(50) DEFAULT NULL,
  `department` VARCHAR(50) NOT NULL,
  `subject` VARCHAR(100) NOT NULL,
  `query_text` TEXT NOT NULL,
  `priority` VARCHAR(20) DEFAULT 'Normal' COMMENT 'Low, Normal, or High',
  `status` VARCHAR(30) DEFAULT 'Pending' COMMENT 'Pending, In Review, or Resolved',
  `reply_text` TEXT DEFAULT NULL,
  `replied_by` VARCHAR(50) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`doubt_id`),
  KEY `idx_student` (`student_username`),
  KEY `idx_department` (`department`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------------------------------
-- 4. Sample Seed Data for `users` (Matches PPT User Roles)
-- -----------------------------------------------------------------------------
INSERT INTO `users` (`id`, `username`, `password`, `role`, `full_name`, `email`, `department`) VALUES
(1, 'admin', 'admin123', 'Admin', 'System Administrator', 'admin@college.edu', 'Administration'),
(2, 'staff_cse', 'staff123', 'Staff', 'Dr. Rajesh Sharma (Faculty)', 'rajesh.cse@college.edu', 'CSE'),
(3, 'staff_ece', 'staff123', 'Staff', 'Prof. Ananya Sen (Faculty)', 'ananya.ece@college.edu', 'ECE'),
(4, 'student_rahul', 'student123', 'Student', 'Rahul Verma', 'rahul.v@student.college.edu', 'CSE'),
(5, 'student_priya', 'student123', 'Student', 'Priya Nair', 'priya.n@student.college.edu', 'ECE');

-- -----------------------------------------------------------------------------
-- 5. Sample Seed Data for `doubts` (Matches Slide 06 Presentation Table)
-- -----------------------------------------------------------------------------
INSERT INTO `doubts` (`doubt_id`, `student_username`, `department`, `subject`, `query_text`, `priority`, `status`, `reply_text`, `replied_by`) VALUES
(1, 'student_rahul', 'CSE', 'Java Programming', 'How does garbage collection work in the JVM, and when is finalize() invoked?', 'High', 'Resolved', 'Garbage Collection in Java runs as a background daemon thread in the JVM, automatically freeing memory by collecting unreachable heap objects. finalize() is deprecated in modern Java.', 'staff_cse'),
(2, 'student_priya', 'ECE', 'Engineering Mathematics', 'Could you clarify the difference between continuous-time Fourier Transform and discrete-time Fourier Transform?', 'Normal', 'In Review', 'Under review. Continuous FT operates on continuous analog signals, whereas DTFT / DFT analyzes sampled signals with discrete frequency bins.', 'staff_ece'),
(3, 'student_rahul', 'CSE', 'Database Management Systems (DBMS)', 'What is the primary difference between 2NF and 3NF normalization in relational databases?', 'Normal', 'Pending', NULL, NULL),
(4, 'student_rahul', 'CSE', 'Operating Systems', 'How does the Banker algorithm achieve deadlock avoidance using resource allocation state matrices?', 'Low', 'Pending', NULL, NULL);

-- =============================================================================
-- Verification Query
-- =============================================================================
SELECT 'Users Count:' AS Info, COUNT(*) AS Total FROM users
UNION ALL
SELECT 'Doubts Count:', COUNT(*) FROM doubts;
