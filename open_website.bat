@echo off
title Online Student Mentoring System - Launcher
echo ========================================================
echo   ONLINE STUDENT MENTORING SYSTEM
echo   College Java Web Project
echo ========================================================
echo.
echo Opening the website preview in your default browser...
start "" "%~dp0preview\index.html"
echo.
echo Website opened successfully!
echo.
echo - Home & Login Page:  preview\index.html
echo - Student Dashboard:  preview\student.html
echo - Staff Dashboard:    preview\staff.html
echo - Admin Dashboard:    preview\admin.html
echo.
echo For Apache Tomcat dynamic server deployment, visit:
echo http://localhost:8080/OnlineMentoring/
echo.
pause

