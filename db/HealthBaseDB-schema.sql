DROP SCHEMA IF EXISTS healthbase;
CREATE SCHEMA healthbase;
USE healthbase;

--
-- Table structure for table `user`
--

CREATE TABLE user
(
    user_id       INT         NOT NULL AUTO_INCREMENT,
    first_name    VARCHAR(45) NOT NULL,
    last_name     VARCHAR(45) NOT NULL,
    weight_lbs    INT,
    height_inches INT,
    age           INT,
    trained_by    INT,
    PRIMARY KEY (user_id),
    FOREIGN KEY (trained_by) REFERENCES user (user_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

--
-- Table structure for table `user_history`
--

CREATE TABLE user_history
(
    user_id INT NOT NULL,
    entry_id INT NOT NULL AUTO_INCREMENT,
    
    PRIMARY KEY (entry_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
)