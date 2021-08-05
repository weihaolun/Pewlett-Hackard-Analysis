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

1. From _retirement_titles_ we can see that many employees have had multiple titles, which means they have worked on different positions through their career at Pewlett Hachard, either by transfer or promotion. This piece of information gives us an insight that internal promotion could also be part of the preparation for the “silver tsunami”. For example, promote current employees to fill higher or management level roles, then hire entry level employees.

    ![1_retirement_titles](https://user-images.githubusercontent.com/84211948/128157793-7778a2ef-1361-4eee-b1a6-be097936941c.png)

2. _unique_titles_ table gives us the number of how many employees are about to retire with each employee’s name and title. From this table we can see that there are 72,458 current employees retiring soon. Therefore, HR team needs to start recruitment process to fill 72,458 soon-to-be available positions.

    ![2_unique_titles](https://user-images.githubusercontent.com/84211948/128157825-061ff3f3-697f-423c-97ae-1307b3761fcd.png)

3. _retiring_titles_ table gives us an idea of how many employees of each title will retire. 25,916 Senior Engineers and 24,926 Senior Staff will retire, HR should spend much attention on these two titles. Only 2 Managers are retiring, which could be a good sign for management team.

    ![3_title_counts](https://user-images.githubusercontent.com/84211948/128158115-ef881c4a-c319-4f99-8fcb-b9cdaa5612db.png)

4. _mentorship_eligibility_ table shows that there are 1,549 employees qualified for the mentorship program. These employees are very experienced while not yet ready to retire. More importantly, these employees can train and onboard new employees to help the company to overcome the "silver tsunami".

    ![4_mentorship](https://user-images.githubusercontent.com/84211948/128157857-4f1a7d32-3c1b-42a1-933a-4cbab7dbf666.png)

## III. Summary

### 1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
- According to _unique_titles_ table, there will be 72,458 roles need to be filled. These 72,458 roles have been divided by titles in _retiring_titles_ table: 25,916 Senior Engineers, 24,926 Senior Staff, 9,285 Engineers, 7,636 Staff, 3,603 Technique Leaders, 1,090 Assistant Engineers and 2 Managers.
    
### 2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
- According to mentorship_eligibility table, there are 1,549 employees eligible to mentor the next generation of employees. For a total number of 72,458 roles, each mentor will have 47 mentees in average. This number should not be considered as "enough".
- I also used ```SELECT COUNT``` to get the number of qualified mentors of each title because every role requires specific skill, then I calculated average mentees for each mentor by title as shown below. Each Senior Engineer will need to mentor 90 mentees, which is not enough for mentees. Each Assistant Engineer will have the least number of mentees of 19, which is still barely possible. Unfortunately, there’s no mentors for manager role. Overall, we can conclude that there are not enough number of mentors for each title. 

     ![title_mentor](https://user-images.githubusercontent.com/84211948/128326752-33dd3218-6d1a-4ecd-aca9-0ae980b2eb5e.png)

### Additional Queries and Tables
To better address above questions, we should not only rely on title but also take a look at department information. I created two additional queries and tables to further analyze the results in detail.

Large-scale companies like Pewlett Hackard are often operated by departments. Each department has its own engineer, staff, technique, or management teams, and different departments require different domain knowledge. For example, engineer in Finance Department would require finance related knowledge and experience, while Development Department may prefer engineers who have development related experience. Therefore, it is not accurate enough for HR team to execute hiring plans when roles are solely divided by titles, we also need further information on departments. Similar for mentorship program, we need to see how many mentors available for each department to get an idea of  whether there are enough mentors for the “silver tsunami”. For this purpose, the queries and tables below are created.

#### 1. Number of retiring employees of each department.

This table suggests the number of retiring employees of each department. Based on this table, HR can accurately target the roles of each department with specific domain knowledge requirements.

   ![retiring_each_department](https://user-images.githubusercontent.com/84211948/128327304-e9620505-5b95-4b52-b557-7c3dac3a337e.png)

Queries:
- Step 1: Add _dept_name_ and _dept_no_ to _unique_titles_ to have each employee row also includes dept information. New table _unique_titles_dept_ is created.
- Step 2: Redundant dept information leads to duplicated employee rows, I used ```DISTINCT ON``` to remove duplicated employee rows in _unique_titles_dept_. New table _unique_dept_ is created.
- Step 3: `SELECTE COUNT` is applied to get a final summary of retiring employee number of each department. New table _retiring _dept_ is created.

   ![additional1](https://user-images.githubusercontent.com/84211948/128327691-697cb681-e403-4749-80a1-f73d3e2c7852.png)

#### 2.	Number of qualified mentors in each department.

   ![mentor_dept](https://user-images.githubusercontent.com/84211948/128328023-97c6d63f-5455-413f-b775-16c8bead4838.png)

Queries:
- Step 1: created a new qualified mentors table to include _dept_name_ of each employee by `DINSTINCT ON` and `INNER JOIN`. New table _mentor_eligi_dept_ is created.
- Step 2: `SELECT COUNT` is applied to get a final summary of qualified mentors number of each department. New table _eligible_dept_counts_ is created.

   ![additional2](https://user-images.githubusercontent.com/84211948/128328048-50b3b552-0321-47aa-b218-5d544a84e6a8.png)

From above two additional tables we can get an analysis of how many mentees each mentor would have:

   ![dept_mentor](https://user-images.githubusercontent.com/84211948/128328104-0e3227fd-74a9-4f2f-8e1c-4b7de2a4b5d3.png)

In average, each mentor would have around 40-60 mentees in all the departments, which is still not efficient unless the company has capacity to hold large-scale training programs. In conclusion, the company should take actions immediately to get ready for the “silver tsunami”.










