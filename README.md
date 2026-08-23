# Lost & Found Management System

## CSBC 252 – Introduction to Cloud Computing

A cloud-based Lost & Found Management System developed to help students and staff report, search for, and manage lost and found belongings within an institution.

---

## Project Overview

The Lost & Found Management System provides a centralized platform where users can:

- Create an account and log in.
- Report lost items.
- Report found items.
- Upload item images.
- Search for reported items.
- View their reports.
- Submit and manage claims.
- Receive notifications.
- Manage their profile.
- Log out securely.

The system combines a Flutter frontend with a Python Flask backend and AWS cloud services.

---

## System Architecture

The application follows this architecture:

User
↓
Flutter Frontend
↓
Flask REST API
↓
Amazon EC2
├── Amazon RDS MySQL
├── Amazon S3
└── Amazon CloudWatch

AWS IAM and Security Groups are used to provide controlled access and network security.

---

## Technologies Used

### Frontend
- Flutter
- Dart
- Material Design
- HTTP

### Backend
- Python
- Flask
- Gunicorn
- Flask-SQLAlchemy
- PyMySQL
- Boto3
- Werkzeug

### Database
- MySQL
- Amazon RDS

### Cloud Services
- Amazon EC2
- Amazon RDS
- Amazon S3
- AWS IAM
- Amazon CloudWatch
- EC2 Security Groups

### Version Control
- Git
- GitHub

---

## AWS Deployment

The backend application is deployed on Amazon EC2 running Amazon Linux 2023.

Gunicorn is used as the production application server.

The backend communicates with:

- Amazon RDS MySQL for persistent application data.
- Amazon S3 for item image storage.
- Amazon CloudWatch for monitoring.
- AWS IAM for controlled AWS resource access.

---

## Database

Amazon RDS MySQL is used to store application information such as:

- User accounts
- Lost items
- Found items
- Claims
- Notifications
- Other application data

The EC2 backend was successfully tested for connectivity to the RDS database.

---

## Amazon S3

Amazon S3 is used to store images associated with reported lost and found items.

The EC2 instance accesses S3 using an IAM role instead of hard-coded AWS credentials.

Example stored object:

`items/<unique-image-id>.jpg`

---

## Authentication

The system provides user registration and login functionality.

Passwords are securely hashed before being stored in the database.

Users can also log out from their profiles.

---

## API Functionality

The Flask backend provides REST API endpoints for application functionality.

CRUD operations for items have been successfully tested:

- Create
- Read
- Update
- Delete

Example API responses were validated directly from the deployed EC2 server.

---

## Deployment Validation

The following components have been tested successfully:

| Component | Status |
|---|---|
| GitHub Repository | ✅ Passed |
| AWS IAM Role | ✅ Passed |
| Amazon EC2 | ✅ Passed |
| Flask Backend | ✅ Passed |
| Gunicorn | ✅ Passed |
| Amazon RDS MySQL | ✅ Passed |
| Amazon S3 | ✅ Passed |
| Create Operation | ✅ Passed |
| Read Operation | ✅ Passed |
| Update Operation | ✅ Passed |
| Delete Operation | ✅ Passed |
| CloudWatch Monitoring | ✅ Passed |
| Security Groups | ✅ Passed |
| Flutter Frontend | ✅ Passed |
| User Authentication | ✅ Passed |
| Login / Logout | ✅ Passed |

---

## Project Structure

### Flutter Frontend

```text
lost_and_found_flutterapp/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   ├── routes/
│   │   ├── services/
│   │   └── theme/
│   ├── models/
│   ├── providers/
│   ├── screens/
│   └── widgets/
├── pubspec.yaml
└── README.md

 #### lost_and_found backend
lost_and_found_backend/
├── controllers/
├── models/
├── routes/
├── utils/
├── app.py
├── config.py
├── requirements.txt
└── .env

Security

The project uses several security mechanisms:

AWS IAM roles
EC2 Security Groups
Environment variables for sensitive configuration
Password hashing
Controlled database access
S3 access through IAM permissions

Sensitive credentials and configuration values are not intended to be committed to GitHub.


| No. | Member                         | Responsibility                    |
| --- | -------------------------------|-----------------------------------|
| 1   | PascalMonnou Sourou Dieu-donne | Project leader/ Cloud Architecture |
| 2   |Owusu Otimah Adelaide           | Frontend Development              |
| 3   | Rockson Kwesi Asamoah          | Backend Development               |
| 4   | Miwonorvi Kale Jiagge          | Database & Cloud Storage          |
| 5   |Zeinab                          | Testing & Documentation           |
