#!/bin/bash
LOG_FILE="logs/Usnadin_Raiymbek_system_report.log"

{
  echo "Student: Usnadin Raiymbek"
  echo "Date: $(date)"
  echo "User: $(whoami)"
  echo "OS & Kernel: $(uname -snrvm)"
  echo "CPU Info: $(lscpu | grep 'Model name' | sed -e 's/^[[:space:]]*//')"
  echo "Memory Info: $(free -h | grep Mem)"
  echo "Disk Usage and Available Space:"
  df -h /
  echo "-----------------------------------"
} >> "$LOG_FILE"
