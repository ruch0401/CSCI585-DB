# CSCI585-DB

### Submitted By: Ruchit Bhardwaj
### USC ID: 1111-4177-99

---
# Description of the ER Diagram

## Entity and Attribute Description

### Entity Name: EMPLOYEE

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| EMPLOYEE_ID | Unique ID (Primary Key) for EMPLOYEE entity | Primary Key, NOT NULL |
| EMPLOYEE_FIRST_NAME | First name of the employee | |
| EMPLOYEE_LAST_NAME | Last name of the employee | |
| EMPLOYEE_SMARTPHONE_NUMBER | Smartphone number of the employee | |
| EMPLOYEE_EMAIL_ADDRESS | Email address of the employee | |
| EMPLOYEE_DATE_OF_BIRTH | Date of birth of the employee | |
| EMPLOYEE_AGE | Age of the employee | |
| EMPLOYEE_HOME_ADDRESS | Home address of the employee | |
| EMPLOYEE_JOINING_DATE | Joining date of the employee | |
| EMPLOYEE_FLOOR | The floor number on which the employee has been staffed | |
| CREATED_DATE | The created_time timestamp when a tuple in the EMPLOYEE entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the EMPLOYEE entity was updated | |

---

### Entity Name: HEALTH_STATE
| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| HEALTH_STATUS_ID | Unique ID (Primary Key) for EMPLOYEE entity | PRIMARY KEY, NOT NULL|
| HEALTH_STATUS_NAME | One of 'SICK', 'HOSPITALIZED' or 'WELL'. In some cases, the employee can also be 'DECEASED' | |
| CREATED_DATE | The created_time timestamp when a tuple in the HEALTH_STATE entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the HEALTH_STATE entity was updated | |

---

### Entity Name: EMPLOYEE_HEALTH_STATUS

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| EMPLOYEE_HEALTH_STATE_ID | Unique ID (Primary Key) for EMPLOYEE_HEALTH_STATUS entity | PRIMARY KEY, NOT NULL |
| EMPLOYEE_ID | Foreign Key constraint | Foreign Key from the 'EMPLOYEE' entity |
| HEALTH_STATUS_ID | Foreign Key from 'HEALTH_STATE' entity | FOREIGN KEY CONSTRAINT |
| EMPLOYEE_HEALTH_STATE_DURATIOIN | The time duration (in weeks) that an employee was in a given health state i.e. SICK, HOSPITALIZED, WELL or DECEASED | |
| CREATED_DATE | The created_time timestamp when a tuple in the EMPLOYEE_HEALTH_STATUS entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the EMPLOYEE_HEALTH_STATUS entity was updated | |

---

### Entity Name: SYMPTOM

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| SYMPTOM_ID | Unique ID (Primary Key) for SYMPTOM entity | PRIMARY KEY, NOT NULL |
| SYMPTOM_NAME | The name of the symptom, can be any of 'FEVER', 'COUGH', 'SHORTNESS OF BREATH', 'FATIGUE', 'MUSCLE ACHES' | |
| EMPLOYEE_ID | Foreign Key constraint | Foreign Key from the 'EMPLOYEE' entity |
| CREATED_DATE | The created_time timestamp when a tuple in the SYMPTOM entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the SYMPTOM entity was updated | |

---

### Entity Name: MEETING

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| MEETING_ID | Unique ID (Primary Key) for MEETING entity | PRIMARY KEY, NOT NULL |
| MEETING_ROOM_NUMBER | The room number in which the meeting takes place | |
| MEETING_FLOOR_NUMBER | The floor number in which the meeting takes place | |
| MEETING_START_TIME | The timestamp when the meeting starts | |
| MEETING_END_TIME | The timestamp when the meeting ends | |
| EMPLOYEE_ID | Foreign Key constraint | Foreign Key from the 'EMPLOYEE' entity |
| CREATED_DATE | The created_time timestamp when a tuple in the MEETING entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the MEETING entity was updated | |

---  

### Entity Name: APPLICATION

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| APPLICATION_INSTANCE_ID | Unique ID (Primary Key) for APPLICATION entity | PRIMARY KEY, NOT NULL |
| TEST_ID | Foreign Key from the 'TEST' entity | FOREIGN KEY CONSTRAINT |
| REPORT_ID | Foreign Key from the 'REPORT' entity | FOREIGN KEY CONSTRAINT |
| EMPLOYEE_ID | Foreign Key from the 'EMPLOYEE' entity | FOREIGN KEY CONSTRAINT |
| NOTIFICATION_ID | Foreign Key from the 'NOTIFICATION' entity | FOREIGN KEY CONSTRAINT |
| CREATED_DATE | The created_time timestamp when a tuple in the APPLICATION entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the APPLICATION entity was updated | |

---  

### Entity Name: TEST

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| TEST_ID, EMPLOYEE_ID | Composite Primary Key (Primary Key) for TEST entity | COMPOSITE PRIMARY KEY, NOT NULL |
| TEST_MODE_ID | Foreign Key from the 'TEST_MODE' entity | FOREIGN KEY CONSTRAINT |
| CREATED_DATE | The created_time timestamp when a tuple in the TEST entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the TEST entity was updated | |

---  

### Entity Name: TEST_LOCATION

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| TEST_MODE_ID | Primary Key (Primary Key) for TEST_LOCATION entity | PRIMARY KEY, NOT NULL |
| TEST_LOCATION_NAME | If the test has been done on-campus or at a client-chosen location |
| CREATED_DATE | The created_time timestamp when a tuple in the TEST_LOCATION entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the TEST_LOCATION entity was updated | |

---

### Entity Name: NOTIFICATION

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| APPLICATION_INSTANCE_ID, NOTIFICATION_ID | Composite Primary Key (Primary Key) for NOTIFICATION entity | COMPOSITE PRIMARY KEY, NOT NULL |
| NOTIFICATION_TYPE_ID | Foreign Key from 'NOTIFICATION_TYPE' entity | FOREIGN KEY CONSTRAINT |
| CREATED_DATE | The created_time timestamp when a tuple in the NOTIFICATION entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the NOTIFICATION entity was updated | |

---

### Entity Name: NOTIFICATION_TYPE

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| NOTIFICATION_TYPE_ID | Primary Key (Primary Key) for NOTIFICATION_TYPE entity | PRIMARY KEY, NOT NULL |
| NOTIFICATION_TYPE_NAME | Type of notification sent to the employee - 'EMAIL', 'PHONE CALL' or 'PUSH_NOTIFICATION' |
| CREATED_DATE | The created_time timestamp when a tuple in the NOTIFICATION_TYPE entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the NOTIFICATION_TYPE entity was updated | |

---

### Entity Name: REPORT

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| EMPLOYEE_ID, REPORT_ID | Composite Primary Key (Primary Key) for REPORT entity | COMPOSITE PRIMARY KEY, NOT NULL |
| REPORT_OUTCOME_TYPE_ID | Foreign Key from the 'REPORT_OUTCOME' entity | FOREIGN KEY CONSTRAINT |
| CREATED_DATE | The created_time timestamp when a tuple in the REPORT entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the REPORT entity was updated | |

---

### Entity Name: REPORT_OUTCOME

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| REPORT_OUTCOME_TYPE_ID | Primary Key (Primary Key) for REPORT_OUTCOME entity | PRIMARY KEY, NOT NULL |
| REPORT_OUTCOME_TYPE_NAME | Report outcomes can either be 'POSITIVE' or 'NEGATIVE' | |
| CREATED_DATE | The created_time timestamp when a tuple in the REPORT_OUTCOME entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the REPORT_OUTCOME entity was updated | |

---

## Components of an Entity Relation Mapping (ERM)

| Entity | Relationship | Connectivity | Entity |
| ----------- | ----------- | ----------- | ----------- |
| EMPLOYEE | can have | 1:M | SYMPTOM |
| EMPLOYEE | has | 1:1 | EMPLOYEE_HEALTH_STATUS |
| EMPLOYEE | can attend | M:N | MEETING |
| EMPLOYEE_HEALTH_STATUS | can attend | 1:1 | HEALTH_STATE |
| EMPLOYEE | has an instance of | 1:1 | APPLICATION |
| EMPLOYEE | can undergo | 1:M | TEST |
| TEST | is in | M:N | TEST_LOCATION |
| TEST | generates | 1:1 | REPORT |
| REPORT | has | 1:1 | REPORT_OUTCOME |
| APPLICATION | generates | 1:M | NOTIFICATION |
| NOTIFICATION | has | 1:M | NOTIFICATION_TYPE |

---

## Design Decisions (Relationships)

- A single employee can optionally have many symptoms or no symptoms at all.
- At any given point in time, an employee can only be in one health status i.e. the employee can either be 'WELL', 'SICK', 'HOSPITALIZED' or 'DECEASED'. So, one employee can be in one health state at a given point in time. Hence, the 1:1 relationship.
- One employee can be in many meetings in different times. Similarly, one meeting can be attended by many employees. It is also possible that an employee does not attend any meeting. Hence the M:N (optional) relationship
- Employee can be in only one health state at a given time. The EMPLOYEE_HEALTH_STATUS entity has a foreign key 'HEALTH_STATUS_ID' which is an ENUM for the allowed health statuses of the employee, namely - 'WELL', 'SICK', 'HOSPITALIZED' or 'DECEASED'
- The company has developed a mobile application to achieve the contact tracing notification mechanism. An employee has to have this app installed on his/her smartphones. This means that a single instance of the application will be installed by a single employee. Hence, the 1:1 relationship.
- Now, for the TEST entity, a single employee can optionally undergo many tests. The 'optionally' is chosen because if an employee has no symptoms and s/he is not chosen randomly for pop-up testing, then it is possible that the employee might not be tested at all as the company does not have a fixed schedule for testing out all the employees. Hence, the 1:M (optional) relationship.
- The company has given the flexibility to the employees to undergo the test at a location they desire. The 'TEST_LOCATION' entity has 'ONSITE' and 'OTHER' options available.
- The 'TEST_LOCATION_ID' is a foreign key in the 'TEST' entity as 'TEST_LOCATION' provides an ID to the different test locations that are allowed by the company.
- One test can be done at one and only one location. Hence, the 1:1 relationship.
- Each test, mandatorily generates a single report. Hence, the 1:1 relationship.
- The 'REPORT_OUTCOME' entity provides 'REPORT_OUTCOME_TYPE_ID' as a foreign key in the 'REPORT entity, to specify possible report outcomes - 'POSITIVE' or 'NEGATIVE'.
- A report will definitely have an outcome. And many reports can have a single report outcome i.e. 5 reports can have report outcomes as positive and another 10 reports can have the report outcomes as negative. A report cannot have NO outcome. Hence, the M:1 relationship.
- A single application instance can generate many notifications. Similarly, a single notification can be a part of many application instances. Hence the M:N relationship. The modality is 0 as it is possible that an application does not produce any notification, or similarly, a notification is not a part of any of the application instances.
- The company's contact tracing system's MVP is focussed on 3 types of notifications (as we can understand from the requirements gathering phase) - 'CALL', 'EMAIL' or 'PUSH', depending on the severity of contact with an infected person.
- Many notifications have a single notification_type. Conversely, a notifications can have one and only one type. Hence, the M:1 relationship between NOTIFICATION and NOTIFICATION_TYPE


## Design Decisions (Attributes)

- It is a good practise to have the 'CREATED_TIME' and 'UPDATED_TIME' attribute in a table to know as to when a particular tuple was added or updated.
- The 'EMPLOYEE_FLOOR_NUMBER' can be used to identify all employees who are staffed on the same floor, in case one of the employees gets infected.
- The 'EMPLOYEE_HEALTH_STATE_DURATION' keeps  a check on the amount of time that an employee has been in a given health state. This is to assess if an employee is fit to join the office or not.
- Rather than directly having the 'REPORT_TYPE' or 'NOTIFICATION_TYPE' or 'TEST_LOCATION', the ERD is constructed in such a way that we have separate entities for that, as it will makes the DB modular and expandable.