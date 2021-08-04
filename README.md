# Pewlett Hackard Analysis with PostgreSQL

## I. Overview of Project

### Background
Pewlett Hackard is a large company with a huge number of employees. The company has been around for a long time and baby boomers begin to retire at a rapid rate. I have been working on this project to help Pewlett Hackard to get ready for the future by analyzing employee data using SQL. 
The company has been relying on Excel in the past, so the first step is to build an employee data base with SQL by creating 6 tables to hold the csv files: departments, employees, dept_manager, dept_emp, titles and salaries. ([Pewlett_Hackard Data](https://github.com/weihaolun/Pewlett-Hackard-Analysis/tree/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/Pewlett_Hackard%20Data))

Then, I used SQL queries to further analyze the data and created tables and csv data files to hold all retiring employees’ information: retirement_info, dept_count, emp_info, manager_info, dept_info and current_emp. ([Pewlett_Hackard Data](https://github.com/weihaolun/Pewlett-Hackard-Analysis/tree/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/Pewlett_Hackard%20Data)) These data are very helpful for the company to conclude results such as who are retiring, which departments have the most retiring employees, how many management team members are retiring etc.

After above analysis, I am conducting another challenge to further help Pewlett Hackard to prepare for the upcoming “silver tsunami” as many current employees reaching retirement age.


### Purpose
The purpose of this challenge is to:

1.	Determine the retiring employees and the number of retiring employees per title.
2.	Identify employees who are eligible to participate in a mentorship program.
3.	Summarize and analyze how to prepare for the “silver tsunami”.

## II. Results

1. From _retirement_titles_ we can see that many employees have had multiple titles, which means they have worked on different positions through their career at Pewlett Hachard, either by transfer or promotion. This piece of information gives us an insight that internal promotion could also be part of the preparation for the “silver tsunami”. For example, promote current employees to fill higher or management level then hire entry level employees.

    ![1_retirement_titles](https://user-images.githubusercontent.com/84211948/128157793-7778a2ef-1361-4eee-b1a6-be097936941c.png)

2. _unique_titles_ table gives us the number of how many employees are about to retire with each employee’s name and title. From this table we can see that there are 72,458 employees who are currently working will retire soon. Therefore, HR team needs to start recruitment to fill 72,458 soon-to-be available positions.

    ![2_unique_titles](https://user-images.githubusercontent.com/84211948/128157825-061ff3f3-697f-423c-97ae-1307b3761fcd.png)

3. _retiring_titles_ table gives us an idea of how many employees of each title will retire. 25,916 Senior Engineers and 24,926 Senior Staff will retire, HR should spend much attention of these two titles. Only 2 Managers are retiring, which is a good sign for management team.

    ![3_title_counts](https://user-images.githubusercontent.com/84211948/128158115-ef881c4a-c319-4f99-8fcb-b9cdaa5612db.png)

4. _mentorship_eligibility_ table shows that there are 1,549 employees qualified for the mentorship program. These employees are very experienced while not yet ready to retire.

    ![4_mentorship](https://user-images.githubusercontent.com/84211948/128157857-4f1a7d32-3c1b-42a1-933a-4cbab7dbf666.png)

## III. Summary

### 1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
### 2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

### Additional
