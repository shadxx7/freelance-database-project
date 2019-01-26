set search_path to freelance;
-- tables
-- Table: certification
CREATE TABLE certification
(
    id int NOT NULL,
    freelancer_id int NOT NULL,
    certification_name varchar(255) NOT NULL,
    provider varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    date_earned date NOT NULL,
    certification_link text NULL,
    CONSTRAINT certification_pk PRIMARY KEY (id)
);

-- Table: company
CREATE TABLE company
(
    id int NOT NULL,
    company_name varchar(255) NOT NULL,
    company_location varchar(255) NOT NULL,
    CONSTRAINT company_pk PRIMARY KEY (id)
);

-- Table: contract
CREATE TABLE contract
(
    id int NOT NULL,
    proposal_id int NOT NULL,
    start_time timestamp NOT NULL,
    end_time timestamp NULL,
    CONSTRAINT contract_pk PRIMARY KEY (id)
);

-- Table: freelancer
CREATE TABLE freelancer
(
    id int NOT NULL,
    user_account_id int NOT NULL,
    registration_date date NOT NULL,
    overview text NOT NULL,
    CONSTRAINT freelancer_pk PRIMARY KEY (id)
);

-- Table: has_skill
CREATE TABLE has_skill
(
    id int NOT NULL,
    freelancer_id int NOT NULL,
    skill_id int NOT NULL,
    skill_level int NOT NULL,
    CONSTRAINT has_skill_pk PRIMARY KEY (id)
);

-- Table: hire_manager
CREATE TABLE hire_manager
(
    id int NOT NULL,
    user_account_id int NOT NULL,
    registration_date date NOT NULL,
    company_id int NULL,
    CONSTRAINT hire_manager_pk PRIMARY KEY (id)
);

-- Table: job
CREATE TABLE job
(
    id int NOT NULL,
    hire_manager_id int NOT NULL,
    expected_duration varchar(255) NOT NULL,
    complexity varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    main_skill_id int NOT NULL,
    payment_type_id int NOT NULL,
    payment_amount decimal(8,2) NOT NULL,
    CONSTRAINT job_pk PRIMARY KEY (id)
);

-- Table: other_skills
CREATE TABLE other_skills
(
    id int NOT NULL,
    job_id int NOT NULL,
    skill_id int NOT NULL,
    CONSTRAINT other_skills_pk PRIMARY KEY (id)
);

-- Table: payment_type
CREATE TABLE payment_type
(
    id int NOT NULL,
    type_name varchar(255) NOT NULL,
    CONSTRAINT payment_type_pk PRIMARY KEY (id)
);

-- Table: proposal
CREATE TABLE proposal
(
    id int NOT NULL,
    job_id int NOT NULL,
    freelancer_id int NOT NULL,
    proposal_time timestamp NOT NULL,
    payment_type_id int NOT NULL,
    payment_amount decimal(8,2) NOT NULL,
    client_grade int NULL,
    client_comment varchar(255) NULL,
    freelancer_grade int NULL,
    freelancer_comment varchar(255) NULL,
    CONSTRAINT proposal_pk PRIMARY KEY (id)
);

-- Table: skill
CREATE TABLE skill
(
    id int NOT NULL,
    skill_name varchar(255) NOT NULL,
    CONSTRAINT skill_pk PRIMARY KEY (id)
);

-- Table: test
CREATE TABLE test
(
    id int NOT NULL,
    test_name varchar(255) NOT NULL,
    test_link varchar(255) NOT NULL,
    CONSTRAINT test_pk PRIMARY KEY (id)
);

-- Table: test_result
CREATE TABLE test_result
(
    id int NOT NULL,
    freelancer_id int NOT NULL,
    test_id int NOT NULL,
    start_time timestamp NOT NULL,
    end_time timestamp NULL,
    test_result_link varchar(255) NULL,
    score decimal(5,2) NULL,
    display_on_profile bool NULL,
    CONSTRAINT test_result_pk PRIMARY KEY (id)
);

-- Table: user_account
CREATE TABLE user_account
(
    id int NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    CONSTRAINT user_account_ak_2 UNIQUE (email)
    NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT user_account_pk PRIMARY KEY
    (id)
);

    -- foreign keys

    -- Reference: certification_freelancer (table: certification)
    ALTER TABLE certification ADD CONSTRAINT certification_freelancer
    FOREIGN KEY (freelancer_id)
    REFERENCES freelancer (id)  
;

    -- Reference: contract_proposal (table: contract)
    ALTER TABLE contract ADD CONSTRAINT contract_proposal
    FOREIGN KEY (proposal_id)
    REFERENCES proposal (id)  
;

    -- Reference: freelancer_user_account (table: freelancer)
    ALTER TABLE freelancer ADD CONSTRAINT freelancer_user_account
    FOREIGN KEY (user_account_id)
    REFERENCES user_account (id)  
;

    -- Reference: has_skill_freelancer (table: has_skill)
    ALTER TABLE has_skill ADD CONSTRAINT has_skill_freelancer
    FOREIGN KEY (freelancer_id)
    REFERENCES freelancer (id)  
;

    -- Reference: has_skill_skill (table: has_skill)
    ALTER TABLE has_skill ADD CONSTRAINT has_skill_skill
    FOREIGN KEY (skill_id)
    REFERENCES skill (id)  
;

    -- Reference: hire_manager_company (table: hire_manager)
    ALTER TABLE hire_manager ADD CONSTRAINT hire_manager_company
    FOREIGN KEY (company_id)
    REFERENCES company (id)  
;

    -- Reference: hire_manager_user_account (table: hire_manager)
    ALTER TABLE hire_manager ADD CONSTRAINT hire_manager_user_account
    FOREIGN KEY (user_account_id)
    REFERENCES user_account (id)  
;

    -- Reference: job_hire_manager (table: job)
    ALTER TABLE job ADD CONSTRAINT job_hire_manager
    FOREIGN KEY (hire_manager_id)
    REFERENCES hire_manager (id)  
;

    -- Reference: job_payment_type (table: job)
    ALTER TABLE job ADD CONSTRAINT job_payment_type
    FOREIGN KEY (payment_type_id)
    REFERENCES payment_type (id)  
;

    -- Reference: job_skill (table: job)
    ALTER TABLE job ADD CONSTRAINT job_skill
    FOREIGN KEY (main_skill_id)
    REFERENCES skill (id)  
;

    -- Reference: other_skills_job (table: other_skills)
    ALTER TABLE other_skills ADD CONSTRAINT other_skills_job
    FOREIGN KEY (job_id)
    REFERENCES job (id)  
;

    -- Reference: other_skills_skill (table: other_skills)
    ALTER TABLE other_skills ADD CONSTRAINT other_skills_skill
    FOREIGN KEY (skill_id)
    REFERENCES skill (id)  
;

    -- Reference: proposal_freelancer (table: proposal)
    ALTER TABLE proposal ADD CONSTRAINT proposal_freelancer
    FOREIGN KEY (freelancer_id)
    REFERENCES freelancer (id)  
;

    -- Reference: proposal_job (table: proposal)
    ALTER TABLE proposal ADD CONSTRAINT proposal_job
    FOREIGN KEY (job_id)
    REFERENCES job (id)  
;

    -- Reference: proposal_payment_type (table: proposal)
    ALTER TABLE proposal ADD CONSTRAINT proposal_payment_type
    FOREIGN KEY (payment_type_id)
    REFERENCES payment_type (id)  
;

    -- Reference: test_result_freelancer (table: test_result)
    ALTER TABLE test_result ADD CONSTRAINT test_result_freelancer
    FOREIGN KEY (freelancer_id)
    REFERENCES freelancer (id)  
;

    -- Reference: test_result_test (table: test_result)
    ALTER TABLE test_result ADD CONSTRAINT test_result_test
    FOREIGN KEY (test_id)
    REFERENCES test (id)
;

-- End of file.

