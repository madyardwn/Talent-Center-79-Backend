/*==============================================================*/
/* DBMS name:      PostgreSQL 14                                */
/* Created on:     07/01/2024 08:50:13                          */
/*==============================================================*/

DO $$ 
DECLARE
   -- v_uuid uuid;
BEGIN   
   IF NOT EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'uuid-ossp') THEN
      CREATE EXTENSION "uuid-ossp";
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent_position') THEN
      DROP TABLE talent_position;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'position') THEN
      DROP TABLE "position";
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent_metadata') THEN
      DROP TABLE talent_metadata;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent_request') THEN
      DROP TABLE talent_request;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent_request_status') THEN
      DROP TABLE talent_request_status;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent_wishlist') THEN
      DROP TABLE talent_wishlist;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'client') THEN
      EXECUTE 'DROP TABLE client';
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'user') THEN
      DROP TABLE "user";
   END IF;
   
   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'role') THEN
      DROP TABLE role;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'client_position') THEN
      DROP TABLE client_position;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent_skillset') THEN
      DROP TABLE talent_skillset;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'most_frequent_skillset') THEN
      DROP TABLE most_frequent_skillset;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'skillset') THEN
      DROP TABLE skillset;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'skillset_type') THEN
      DROP TABLE skillset_type;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent') THEN
      DROP TABLE talent;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'employee_status') THEN
      DROP TABLE employee_status;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent_status') THEN
      DROP TABLE talent_status;
   END IF;

   IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'talent_level') THEN
      DROP TABLE talent_level;
   END IF;

   /*==============================================================*/
   /* Table: client                                                */
   /*==============================================================*/
   CREATE TABLE client (
      client_id            UUID                 NOT NULL,
      client_position_id   UUID                 NULL,
      user_id              UUID                 NULL,
      client_name          VARCHAR(255)         NULL,
      gender               CHAR(1)              NULL,
      birth_date           DATE                 NULL,
      email                VARCHAR(100)         NULL,
      agency_name          VARCHAR(100)         NULL,
      agency_address       VARCHAR(255)         NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_client PRIMARY KEY (client_id)
   );

   /*==============================================================*/
   /* Table: client_position                                       */
   /*==============================================================*/
   CREATE TABLE client_position (
      client_position_id   UUID                 NOT NULL,
      client_position_name VARCHAR(100)         NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_client_position PRIMARY KEY (client_position_id)
   );

   /*==============================================================*/
   /* Table: employee_status                                       */
   /*==============================================================*/
   CREATE TABLE employee_status (
      employee_status_id   UUID                 NOT NULL,
      employee_status_name VARCHAR(50)          NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_employee_status PRIMARY KEY (employee_status_id)
   );

   /*==============================================================*/
   /* Table: most_frequent_skillset                                */
   /*==============================================================*/
   CREATE TABLE most_frequent_skillset (
      most_frequent_skillset_id UUID                 NOT NULL,
      skillset_id          UUID                 NULL,
      counter              INT4                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_most_frequent_skillset PRIMARY KEY (most_frequent_skillset_id)
   );

   /*==============================================================*/
   /* Table: "position"                                            */
   /*==============================================================*/
   CREATE TABLE "position" (
      position_id          UUID                 NOT NULL,
      position_name        VARCHAR(50)          NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_position PRIMARY KEY (position_id)
   );

   /*==============================================================*/
   /* Table: role                                                  */
   /*==============================================================*/
   CREATE TABLE role (
      role_id              UUID                 NOT NULL,
      role_name            VARCHAR(50)          NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_role PRIMARY KEY (role_id)
   );

   /*==============================================================*/
   /* Table: skillset                                              */
   /*==============================================================*/
   CREATE TABLE skillset (
      skillset_id          UUID                 NOT NULL,
      skillset_type_id     UUID                 NULL,
      skillset_name        VARCHAR(50)          NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_skillset PRIMARY KEY (skillset_id)
   );

   /*==============================================================*/
   /* Table: skillset_type                                         */
   /*==============================================================*/
   CREATE TABLE skillset_type (
      skillset_type_id     UUID                 NOT NULL,
      skillset_type_name   VARCHAR(50)          NULL,
      is_programming_skill BOOL                 NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_skillset_type PRIMARY KEY (skillset_type_id)
   );

   /*==============================================================*/
   /* Table: talent                                                */
   /*==============================================================*/
   CREATE TABLE talent (
      talent_id            UUID                 NOT NULL,
      talent_level_id      UUID                 NULL,
      talent_status_id     UUID                 NULL,
      employee_status_id   UUID                 NULL,
      talent_name          VARCHAR(255)         NULL,
      talent_photo_filename VARCHAR(255)         NULL,
      employee_number      VARCHAR(50)          NULL,
      gender               CHAR(1)              NULL,
      birth_date           DATE                 NULL,
      talent_description   TEXT                 NULL,
      talent_cv_filename   VARCHAR(255)         NULL,
      experience           INT2                 NULL,
      email                VARCHAR(100)         NULL,
      cellphone            VARCHAR(20)          NULL,
      biography_video_url  TEXT                 NULL,
      is_add_to_list_enable BOOL                 NULL,
      talent_availability  BOOL                 NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent PRIMARY KEY (talent_id)
   );

   /*==============================================================*/
   /* Table: talent_level                                          */
   /*==============================================================*/
   CREATE TABLE talent_level (
      talent_level_id      UUID                 NOT NULL,
      talent_level_name    VARCHAR(50)          NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent_level PRIMARY KEY (talent_level_id)
   );

   /*==============================================================*/
   /* Table: talent_metadata                                       */
   /*==============================================================*/
   CREATE TABLE talent_metadata (
      talent_id            UUID                 NOT NULL,
      cv_counter           INT4                 NULL,
      profile_counter      INT4                 NULL,
      total_project_completed INT2                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent_metadata PRIMARY KEY (talent_id)
   );

   /*==============================================================*/
   /* Table: talent_position                                       */
   /*==============================================================*/
   CREATE TABLE talent_position (
      talent_id            UUID                 NOT NULL,
      position_id          UUID                 NOT NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent_position PRIMARY KEY (talent_id, position_id)
   );

   /*==============================================================*/
   /* Table: talent_request                                        */
   /*==============================================================*/
   CREATE TABLE talent_request (
      talent_request_id    UUID                 NOT NULL,
      talent_request_status_id UUID                 NULL,
      talent_wishlist_id   UUID                 NULL,
      request_date         DATE                 NULL,
      request_reject_reason VARCHAR(255)         NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent_request PRIMARY KEY (talent_request_id)
   );

   /*==============================================================*/
   /* Table: talent_request_status                                 */
   /*==============================================================*/
   CREATE TABLE talent_request_status (
      talent_request_status_id UUID                 NOT NULL,
      talent_request_status_name VARCHAR(50)          NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent_request_status PRIMARY KEY (talent_request_status_id)
   );

   /*==============================================================*/
   /* Table: talent_skillset                                       */
   /*==============================================================*/
   CREATE TABLE talent_skillset (
      talent_id            UUID                 NOT NULL,
      skillset_id          UUID                 NOT NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent_skillset PRIMARY KEY (talent_id, skillset_id)
   );

   /*==============================================================*/
   /* Table: talent_status                                         */
   /*==============================================================*/
   CREATE TABLE talent_status (
      talent_status_id     UUID                 NOT NULL,
      talent_status_name   VARCHAR(50)          NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent_status PRIMARY KEY (talent_status_id)
   );

   /*==============================================================*/
   /* Table: talent_wishlist                                       */
   /*==============================================================*/
   CREATE TABLE talent_wishlist (
      talent_wishlist_id   UUID                 NOT NULL,
      talent_id            UUID                 NOT NULL,
      client_id            UUID                 NOT NULL,
      wishlist_date        DATE                 NOT NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_talent_wishlist PRIMARY KEY (talent_wishlist_id),
      CONSTRAINT ak_key_2_talent_w UNIQUE (talent_id, client_id, wishlist_date)
   );

   /*==============================================================*/
   /* Table: "user"                                                */
   /*==============================================================*/
   CREATE TABLE "user" (
      user_id              UUID                 NOT NULL,
      role_id              UUID                 NULL,
      username             VARCHAR(50)          NULL,
      email                VARCHAR(100)         NULL,
      first_name           VARCHAR(255)         NULL,
      last_name            VARCHAR(255)         NULL,
      password             VARCHAR(255)         NULL,
      is_active            BOOL                 NULL,
      created_by           VARCHAR(50)          NULL,
      created_time         TIMESTAMP            NULL,
      last_modified_by     VARCHAR(50)          NULL,
      last_modified_time   TIMESTAMP            NULL,
      CONSTRAINT pk_user PRIMARY KEY (user_id)
   );

   ALTER TABLE client
      ADD CONSTRAINT fk_client_reference_user FOREIGN KEY (user_id)
         REFERENCES "user" (user_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE client
      ADD CONSTRAINT fk_client_reference_client_p FOREIGN KEY (client_position_id)
         REFERENCES client_position (client_position_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE most_frequent_skillset
      ADD CONSTRAINT fk_most_fre_reference_skillset FOREIGN KEY (skillset_id)
         REFERENCES skillset (skillset_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE skillset
      ADD CONSTRAINT fk_skillset_reference_skillset FOREIGN KEY (skillset_type_id)
         REFERENCES skillset_type (skillset_type_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent
      ADD CONSTRAINT fk_talent_reference_talent_l FOREIGN KEY (talent_level_id)
         REFERENCES talent_level (talent_level_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent
      ADD CONSTRAINT fk_talent_reference_employee FOREIGN KEY (employee_status_id)
         REFERENCES employee_status (employee_status_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent
      ADD CONSTRAINT fk_talent_reference_talent_s FOREIGN KEY (talent_status_id)
         REFERENCES talent_status (talent_status_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_metadata
      ADD CONSTRAINT fk_talent_m_reference_talent FOREIGN KEY (talent_id)
         REFERENCES talent (talent_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_position
      ADD CONSTRAINT fk_talent_p_reference_talent FOREIGN KEY (talent_id)
         REFERENCES talent (talent_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_position
      ADD CONSTRAINT fk_talent_p_reference_position FOREIGN KEY (position_id)
         REFERENCES "position" (position_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_request
      ADD CONSTRAINT fk_talent_r_reference_talent_w FOREIGN KEY (talent_wishlist_id)
         REFERENCES talent_wishlist (talent_wishlist_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_request
      ADD CONSTRAINT fk_talent_r_reference_talent_r FOREIGN KEY (talent_request_status_id)
         REFERENCES talent_request_status (talent_request_status_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_skillset
      ADD CONSTRAINT fk_talent_s_reference_talent FOREIGN KEY (talent_id)
         REFERENCES talent (talent_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_skillset
      ADD CONSTRAINT fk_talent_s_reference_skillset FOREIGN KEY (skillset_id)
         REFERENCES skillset (skillset_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_wishlist
      ADD CONSTRAINT fk_talent_w_reference_talent FOREIGN KEY (talent_id)
         REFERENCES talent (talent_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE talent_wishlist
      ADD CONSTRAINT fk_talent_w_reference_client FOREIGN KEY (client_id)
         REFERENCES client (client_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   ALTER TABLE "user"
      ADD CONSTRAINT fk_user_reference_role FOREIGN KEY (role_id)
         REFERENCES role (role_id)
         ON DELETE RESTRICT ON UPDATE RESTRICT;

   /*==============================================================*/
   /* Table: "role"                                                */
   /*==============================================================*/
   INSERT INTO role (role_id, role_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Client', true, 'system', now(), 'admin', now());

   INSERT INTO role (role_id, role_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Admin', true, 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "talent_status"                                       */
   /*==============================================================*/

   INSERT INTO talent_status (talent_status_id, talent_status_name, is_active, created_by, created_time, last_modified_by, last_modified_time)  
      VALUES (uuid_generate_v4(), 'Onsite', true, 'system', now(), 'system', now());

   INSERT INTO talent_status (talent_status_id, talent_status_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Not Onsite', true, 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "talent_level"                                        */
   /*==============================================================*/

   INSERT INTO talent_level (talent_level_id, talent_level_name, is_active, created_by, created_time, last_modified_by, last_modified_time)  
      VALUES (uuid_generate_v4(), 'Senior', true, 'system', now(), 'system', now());

   INSERT INTO talent_level (talent_level_id, talent_level_name, is_active, created_by, created_time, last_modified_by, last_modified_time)  
      VALUES (uuid_generate_v4(), 'Middle', true, 'system', now(), 'system', now());

   INSERT INTO talent_level (talent_level_id, talent_level_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Junior', true, 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "position"                                            */
   /*==============================================================*/

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Web Developer', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Scrum Master', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Analyst', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Web Front-End Developer', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Web Back-End Developer', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Quality Assurance', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'UI/UX Designer', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Project Manager', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Android Developer', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Desktop Developer', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Video Game Developer', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Graphics Programmer', true, 'system', now(), 'system', now());

   INSERT INTO position (position_id, position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'IOS Developer', false, 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "skillset_type"                                       */
   /*==============================================================*/

   INSERT INTO skillset_type (skillset_type_id, skillset_type_name, is_programming_skill, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Framework', true, true, 'system', now(), 'system', now());

   INSERT INTO skillset_type (skillset_type_id, skillset_type_name, is_programming_skill, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Programming Language', true, true, 'system', now(), 'system', now());

   INSERT INTO skillset_type (skillset_type_id, skillset_type_name, is_programming_skill, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Development Tools', true, true, 'system', now(), 'system', now());

   INSERT INTO skillset_type (skillset_type_id, skillset_type_name, is_programming_skill, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'UI/UX', false, true, 'system', now(), 'system', now());

   INSERT INTO skillset_type (skillset_type_id, skillset_type_name, is_programming_skill, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Dev-Ops', false, true, 'system', now(), 'system', now());

   INSERT INTO skillset_type (skillset_type_id, skillset_type_name, is_programming_skill, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Documentation', false, true, 'system', now(), 'system', now());

   INSERT INTO skillset_type (skillset_type_id, skillset_type_name, is_programming_skill, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Hardware Skills', false, true, 'system', now(), 'system', now());

   INSERT INTO skillset_type (skillset_type_id, skillset_type_name, is_programming_skill, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Tech Support', false, true, 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "skillset"                                     */
   /*==============================================================*/

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Programming Language'), 'Java', true, 'system', now(), 'system', now());
   
   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Programming Language'), 'C#', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Programming Language'), 'C++', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Programming Language'), 'PHP', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Programming Language'), 'Ruby', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)  
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Framework'), 'Spring Boot', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Framework'), 'ReactJS', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Framework'), 'Angular', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Framework'), 'Laravel', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Framework'), 'CodeIgniter', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Framework'), '.NET', true, 'system', now(), 'system', now());

   INSERT INTO skillset (skillset_id, skillset_type_id, skillset_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT skillset_type_id FROM skillset_type WHERE skillset_type_name = 'Framework'), 'React JS', true, 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "client_position"                                     */
   /*==============================================================*/

   INSERT INTO client_position (client_position_id, client_position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Human Resource', true, 'system', now(), 'system', now());

   INSERT INTO client_position (client_position_id, client_position_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Project Manager', true, 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "employee_status"                                     */
   /*==============================================================*/
   INSERT INTO employee_status (employee_status_id, employee_status_name, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Active', 'system', now(), 'system', now());

   INSERT INTO employee_status (employee_status_id, employee_status_name, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Not Active', 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "talent_request_status"                               */
   /*==============================================================*/

   INSERT INTO talent_request_status (talent_request_status_id, talent_request_status_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Approved', true, 'system', now(), 'system', now());

   INSERT INTO talent_request_status (talent_request_status_id, talent_request_status_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'Rejected', true, 'system', now(), 'system', now());

   INSERT INTO talent_request_status (talent_request_status_id, talent_request_status_name, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), 'On Progress', true, 'system', now(), 'system', now());

   /*==============================================================*/
   /* Table: "user"                                                */
   /*==============================================================*/

   INSERT INTO "user" (user_id, role_id, username, email, first_name, last_name, password, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT role_id FROM role WHERE role_name = 'Admin'), 'admin', 'admin@admin.com', 'Admin', '', 'password', true, 'system', now(), 'system', now());

   INSERT INTO "user" (user_id, role_id, username, email, first_name, last_name, password, is_active, created_by, created_time, last_modified_by, last_modified_time)
      VALUES (uuid_generate_v4(), (SELECT role_id FROM role WHERE role_name = 'Client'), 'madyardwn', 'madyardwn@gmail.com', 'Achmadya', 'Ridwan', 'password', true, 'system', now(), 'system', now());

END $$;