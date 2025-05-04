# Data Orchestration Pipeline with Kestra

This project implements a data orchestration pipeline using Kestra to automate the processing and analysis of sales data from various sources (ERP, Web). 
The pipeline performs transformations, calculates metrics, and generates analysis reports.

## Requirements

- Docker and Docker Compose
- AWS account for file storage (S3)

## Project Architecture

The project consists of the following files:

- **`docker-compose.yml`**: Configuration to deploy Kestra with PostgreSQL and pgAdmin
- **`pipeline_orchestration.yml`**: Definition of the data processing pipeline
- **`Fichier_erp.xlsx`, `Fichier_web.xlsx`, `fichier_liaison.xlsx`**: Source files containing ERP, Web, and linkage data

## Installation

### 1. Clone the repository

Clone this project from the GitHub repository:

git clone git@github.com:Phoenix9408/Kestra_Implementation.git



2. Start the services with Docker Compose
Make sure Docker and Docker Compose are installed. Then start the services:

docker-compose up -d

3. Access Kestra Interface

http://localhost:8080


4. Connect to PostgreSQL with pgAdmin

http://localhost:5050

Login credentials for pgAdmin:

Email: admin@kestra.dev

Password: admin123

In pgAdmin, create a new connection to PostgreSQL with the following parameters:

Name: Kestra PG

Host: postgres

Port: 5432

Database: kestra

Username: kestra

Password: k3str4

Once connected , you have to run the sql of PostGre_Config.sql, in order to create quality table

5. AWS Configuration
Set up your AWS credentials for storing reports in an S3 bucket:

Access Key: Your AWS Acces KEY

Secret Key: Your AWS Secret KEY

the credential must be stored in .env then encoded the result to .env_encoded 

Pipeline Structure

The pipeline performs the following operations:

Download Source Data: Downloads ZIP files containing data from a given URL.

Extract Files: Unzips the downloaded ZIP files to access the Excel files.

Clean and Transform Data with Python: Performs data cleaning on the ERP, Web, and linkage files, then generates CSV and Excel files for analysis.

Data Quality Checks with DuckDB: Runs quality checks on the data (duplicates, missing values, join consistency) and reporting the result on a Postgre table

Each steps is triggered to restart if failur three times.

Scheduling
The pipeline is scheduled to run automatically on the 15th of every month at 9:00 AM via the following cron schedule:

yaml
Copier
triggers:
  - id: monthly_schedule
    type: io.kestra.plugin.core.trigger.Schedule
    cron: "0 9 15 * *"

Error Handling
The pipeline includes error handling with notifications:

yaml
Copier
errors:
   - id: error
     type: io.kestra.plugin.core.log.Log
     message: Task {{task.id}} failed
     level: ERROR




