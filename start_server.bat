@echo off
title Online Student Mentoring System - Local Server
echo ========================================================
echo   ONLINE STUDENT MENTORING SYSTEM
echo   Starting Local Web Server on Port 5000...
echo ========================================================
echo.
start "" "http://localhost:5000"
python "%~dp0server.py"
pause

