DROP SCHEMA IF EXISTS healthbase;
CREATE SCHEMA healthbase;
USE healthbase;

--
-- Table structure for table `user`
--

CREATE TABLE user (
  user_id INT NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  weight_lbs INT,
  height_inches INT,
  age INT,
  trained_by,
  FOREIGN KEY (trained_by) REFERENCES user(user_id),
  PRIMARY KEY (user_id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
