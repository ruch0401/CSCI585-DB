# CSCI585-DB

### Submitted By: Ruchit Bhardwaj

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
| HEALTH_STATUS_NAME | One of 'SICK', 'HOSPITALIZED' or 'WELL' | |
| CREATED_DATE | The created_time timestamp when a tuple in the HEALTH_STATE entity was created | |
| UPDATED_DATE | The updated_time timestamp when a tuple in the HEALTH_STATE entity was updated | |

---

### Entity Name: EMPLOYEE_HEALTH_STATUS

| Attributes | Description | Comments |
| ----------- | ----------- | ----------- |
| EMPLOYEE_HEALTH_STATE_ID | Unique ID (Primary Key) for EMPLOYEE_HEALTH_STATUS entity | PRIMARY KEY, NOT NULL |
| EMPLOYEE_ID | Foreign Key constraint | Foreign Key from the 'EMPLOYEE' entity |
| HEALTH_STATUS_ID | Foreign Key from 'HEALTH_STATE' entity | FOREIGN KEY CONSTRAINT |
| EMPLOYEE_HEALTH_STATE_DURATIOIN | The time duration (in weeks) that an employee was in a given health state i.e. SICK, HOSPITALIZED or WELL | |
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