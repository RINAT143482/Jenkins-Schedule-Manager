# Jenkins Schedule Manager

## Description
This project automates the management of class schedules using Jenkins and PowerShell. It allows the user to specify the day, time, and subject of a class, and generates an HTML report with the schedule.

### Purpose
The main goal of this project is to automate the process of scheduling classes and generate an easy-to-read HTML report for teachers or students.

## How to Use
1. Clone this repository.
2. Set up Jenkins to run the **Jenkinsfile** and pass the parameters for day, time, and subject.
3. The generated schedule will be saved as an HTML file in the **output** directory of your workspace.

## Prerequisites
- Jenkins installed
- PowerShell installed
- GitHub account for accessing the repository

## How to Run
1. Clone or fork this repository.
2. In Jenkins, create a new job with parameters for Day, Time, and Subject, and configure it to run the **Jenkinsfile** from this repository.
3. Pass the necessary parameters (Day, Time, Subject) through Jenkins.
4. The schedule will be generated as an HTML file.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For support, please open an issue on GitHub.
