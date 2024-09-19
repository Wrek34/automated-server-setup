# Testing Procedure

This document outlines the testing procedure for the Automated Server Setup script.

## Test Environment

- Virtual Machine running Ubuntu 20.04 LTS
- 2 GB RAM, 2 CPU cores, 20 GB storage

## Test Cases

1. **Fresh Installation**
   - Run script on a fresh Ubuntu installation
   - Expected: All components should install without errors

2. **Idempotency Test**
   - Run script twice on the same system
   - Expected: Second run should not break the setup

3. **Nginx Configuration**
   - Check if Nginx is running: `systemctl status nginx`
   - Access default page: `curl http://localhost`
   - Expected: Nginx should be active and default page accessible

4. **PHP Functionality**
   - Access PHP info page: `curl http://localhost/index.php`
   - Expected: PHP info should be displayed

5. **MySQL Security**
   - Attempt to log in to MySQL as root without password
   - Expected: Access should be denied

6. **Firewall Configuration**
   - Check UFW status: `ufw status`
   - Expected: UFW should be active with rules for Nginx and SSH

## Test Results

(Document your test results here after running through the test cases)

## Troubleshooting

(Document any issues encountered during testing and their resolutions)