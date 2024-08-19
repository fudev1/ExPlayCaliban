CREATE TABLE organization (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255)
);

CREATE TABLE site (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  organization_id INT,
  FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE building (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  site_id INT,
  FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE floor (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  building_id INT,
  type VARCHAR(255),
  FOREIGN KEY (building_id) REFERENCES building(id)
);

CREATE TABLE room (
  id SERIAL PRIMARY KEY,
  number INT,
  floor_id INT,
  type VARCHAR(255),
  current_calls INT,
  last_call_time TIMESTAMP,
  FOREIGN KEY (floor_id) REFERENCES floor(id)
);

CREATE TABLE bed (
  id SERIAL PRIMARY KEY,
  number INT,
  room_id INT,
  FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE device (
  id SERIAL PRIMARY KEY,
  screen_id INT,
  type VARCHAR(255),
  model VARCHAR(255),
  serial_number VARCHAR(255),
  installation_date TIMESTAMP,
  last_maintenance_date TIMESTAMP,
  status VARCHAR(255),
  FOREIGN KEY (screen_id) REFERENCES screen(id)
);

CREATE TABLE screen (
  id SERIAL PRIMARY KEY,
  room_id INT,
  location VARCHAR(255),
  last_service_date TIMESTAMP,
  FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE resident (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth DATE,
  doctor_id INT,
  bed_id INT,
  FOREIGN KEY (bed_id) REFERENCES bed(id)
);

CREATE TABLE staff (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  role VARCHAR(255),
  badge_id INT,
  code_id INT
);

CREATE TABLE medical_staff (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  role VARCHAR(255),
  badge_id INT,
  code_id INT
);

CREATE TABLE call (
  id SERIAL PRIMARY KEY,
  resident_id INT,
  room_id INT,
  screen_id INT,
  call_time TIMESTAMP,
  handled_by INT,
  reason_for_calling VARCHAR(255),
  FOREIGN KEY (resident_id) REFERENCES resident(id),
  FOREIGN KEY (room_id) REFERENCES room(id),
  FOREIGN KEY (screen_id) REFERENCES screen(id),
  FOREIGN KEY (handled_by) REFERENCES staff(id)
);

CREATE TABLE family (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  resident_id INT,
  FOREIGN KEY (resident_id) REFERENCES resident(id)
);

CREATE TABLE note (
  id SERIAL PRIMARY KEY,
  resident_id INT,
  staff_id INT,
  content TEXT,
  timestamp TIMESTAMP,
  FOREIGN KEY (resident_id) REFERENCES resident(id),
  FOREIGN KEY (staff_id) REFERENCES staff(id)
);

CREATE TABLE care_plan (
  id SERIAL PRIMARY KEY,
  resident_id INT,
  treatment VARCHAR(255),
  professional VARCHAR(255),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  FOREIGN KEY (resident_id) REFERENCES resident(id)
);
