# Server Performance Statistics Script

## Overview

This bash script, `server-stats.sh`, is designed to analyze and display basic server performance statistics on Linux systems. It provides a quick overview of CPU usage, memory utilization, disk space, and top resource-consuming processes.

This project is inspired by the "Server Stats" project on roadmap.sh: https://roadmap.sh/projects/server-stats

## Features

The script outputs the following information:

- Total CPU usage
- Total memory usage (Free vs Used, including percentage)
- Total disk usage (Free vs Used, including percentage)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

Additional statistics include:
- OS version
- System uptime
- Load average
- Number of logged-in users
- Number of failed login attempts

## Requirements

- Linux operating system
- Bash shell
- Standard Linux utilities (top, free, df, ps, grep, awk, sed)

## Installation

1. Download the `server-stats.sh` script to your desired location.
2. Make the script executable:
