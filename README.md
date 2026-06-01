# Shopping Cart CI/CD Pipeline Project

End-to-end CI/CD pipeline for a Spring Boot Shopping Cart Web Application using Jenkins, Docker, SonarQube, and OWASP Dependency Check.

---

## Project Overview

This project demonstrates a complete CI/CD implementation for a Spring Boot Shopping Cart application.

The application is built using Spring Boot and Thymeleaf and automated through Jenkins pipelines. The pipeline performs source code checkout, compilation, security scanning, code quality analysis, Docker image creation, and automated deployment.

The project was created to practice DevOps concepts including Continuous Integration, Continuous Delivery, Docker containerization, application security scanning, and deployment automation.

---

## Architecture

```text
Developer
    ↓
GitHub Repository
    ↓
Jenkins Pipeline
    ↓
Compile & Build
    ↓
OWASP Security Scan
    ↓
SonarQube Analysis
    ↓
Docker Image Build
    ↓
Application Deployment
```

---

## Technologies Used

| Category             | Technology             |
| -------------------- | ---------------------- |
| Programming Language | Java                   |
| Framework            | Spring Boot            |
| Template Engine      | Thymeleaf              |
| Security             | Spring Security        |
| Database             | H2 Database            |
| Build Tool           | Maven                  |
| Containerization     | Docker                 |
| CI/CD                | Jenkins                |
| Code Quality         | SonarQube              |
| Security Scanning    | OWASP Dependency Check |
| Version Control      | GitHub                 |

---

## Application Features

* User Registration
* User Login
* Session-Based Shopping Cart
* Product Management
* Checkout Process
* Spring Security Authentication
* H2 Database Integration
* Dockerized Deployment

---

## CI/CD Pipeline

The Jenkins pipeline automates the complete software delivery lifecycle.

### Pipeline Stages

### Tool Installation

Jenkins automatically loads the required tools:

* JDK 11
* Maven 3
* Docker

### Git Checkout

The latest source code is pulled from GitHub.

### Compile

The Spring Boot application is compiled using Maven.

### OWASP Dependency Check

Dependencies are scanned for known vulnerabilities and security issues.

### SonarQube Analysis

Source code quality is analyzed using SonarQube.

Checks include:

* Code Smells
* Bugs
* Vulnerabilities
* Maintainability Issues
* Technical Debt

### Build

The application package is generated using Maven.

### Docker Image Build

A Docker image is created from the Spring Boot application.

### Deployment

The application is deployed automatically using Docker.

---

## Successful Jenkins Pipeline

<img width="1280" height="620" alt="WhatsApp Image 2026-06-01 at 1 56 26 PM" src="https://github.com/user-attachments/assets/64492314-02c1-4091-b37b-814c0fe5a134" />

---

## Running Application

After deployment, the application is available at:

```text
http://localhost:8070/home
```

---

## Default Credentials

### Administrator

```text
Username: admin
Password: admin
```

### User

```text
Username: user
Password: password
```

---

## Running with Maven

### Start Application

```bash
mvn spring-boot:run
```

### Build JAR

```bash
mvn clean package
```

### Run JAR

```bash
java -jar target/shopping-cart-0.0.1-SNAPSHOT.jar
```

---

## Docker Deployment

### Build Docker Image

```bash
mvn clean package

docker build \
-t shopping-cart:latest \
-f docker/Dockerfile .
```

### Run Docker Container

```bash
docker run -d \
-p 8070:8070 \
--name shopping-cart \
shopping-cart:latest
```

---

## Project Structure

```text
shoppingapp-jenkins/
│
├── Jenkinsfile
├── pom.xml
├── deploymentservice.yml
│
├── docker/
│   └── Dockerfile
│
├── scripts/
│   └── run_docker.sh
│
└── src/
    ├── main/
    └── test/
```

---

## Security & Quality Controls

### OWASP Dependency Check

Used to identify vulnerable third-party libraries before deployment.

### SonarQube

Used to enforce code quality standards and detect maintainability issues.

These tools help shift security and quality validation earlier into the development lifecycle.

---

## Docker Containerization

The application is packaged as a Docker image to ensure consistent deployment across environments.

Benefits include:

* Environment Consistency
* Simplified Deployment
* Portability
* Faster Releases

---

## Future Improvements

* Kubernetes Deployment
* Helm Charts
* Trivy Container Scanning
* Amazon ECR Integration
* ArgoCD GitOps Deployment
* Prometheus Monitoring
* Grafana Dashboards

---

## Key DevOps Concepts Demonstrated

* Continuous Integration (CI)
* Continuous Delivery (CD)
* Docker Containerization
* Automated Deployment
* Security Scanning
* Code Quality Gates
* Jenkins Pipelines
* Infrastructure Automation Mindset

---

## Learning Outcome

This project provided hands-on experience with:

* Jenkins Pipelines
* Maven Build Automation
* Docker Containerization
* SonarQube Integration
* OWASP Dependency Check
* Automated Deployment Workflows
* CI/CD Best Practices

---

## Author

**Hisham Atwa**

DevOps Engineer focused on AWS, Linux, Jenkins, Docker, Kubernetes, Terraform, and Ansible.
