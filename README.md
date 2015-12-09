# UNSW-degree-tracker
---------------------

### Introduction
---------------------
### Requirements
---------------------
### Steps of Checking
---------------------
 - **1.** Read the year of first enrollment of current program #{year}
 - **2.** Fetch the program name (major code eg."ANATA13945") and the handbook info of that degree
    - Resource URL:
    ``` ruby
    http://www.handbook.unsw.edu.au/undergraduate/plans/#{year}/#{major code}.html
    ```
 - **3.** Analyze the degree structure on the page: including the main program page for extra Requirements
 - **4.** Fetch all the courses that has `mark >= 50 or 'T'` as a list of passed courses.
 - **5.** Fit the course in the degree requirement, Priority ranking is discussed below:
   - 1 Basic compulsory course
   - 2 first year elective
   - 3 elective
   - 4 gened
   - 5 free elective
 - **6.** Fetch the semester number. `"(Semester X 201X)"`
 - **Hard bits**
### Troubleshooting
---------------------
### FAQ
---------------------
### Maintainers
---------------------
