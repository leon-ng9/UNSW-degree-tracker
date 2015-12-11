# UNSW Degree Tracker

UNSW Degree Tracker is a web application that processes UNSW academic statements to:
* Determine number of completed and remaining core/elective/gen-ed courses for your degree
* Analyse prerequisites to suggest courses for each category and stage

## Method of Processing Statements

1. Extract date of enrolment of current program e.g. Semester 1 2015
2. Extract program plan/stream code e.g. SENGAH3707
3. Process program requirements from handbook
  - ```http://www.handbook.unsw.edu.au/undergraduate/plans/#{year}/#{plan/stream code}.html```
4. Process academic statement PDF
  - Determine courses passed (mark >= 50 or 'T')
  - Categorise passed courses into the following hierarchy:
    1. Core
    2. Elective (with stage)
    3. Gen-ed
    4. Free elective
