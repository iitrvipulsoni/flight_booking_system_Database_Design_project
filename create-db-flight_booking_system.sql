-- MySQL Workbench Synchronization
-- Generated: 2022-12-27 23:33
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Vipul Soni

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `db-flight_booking_system`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `db-flight_booking_system`.`tickets` 
DROP FOREIGN KEY `fk_tickets_flight_classes1`;

ALTER TABLE `db-flight_booking_system`.`flights` 
DROP FOREIGN KEY `fk_flights_airline1`,
DROP FOREIGN KEY `fk_flights_airports1`;

ALTER TABLE `db-flight_booking_system`.`passengers_has_flights` 
DROP FOREIGN KEY `fk_passengers_has_flights_flights1`;

ALTER TABLE `db-flight_booking_system`.`passengers` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `db-flight_booking_system`.`tickets` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `flight_id`,
DROP COLUMN `passenger_id`,
ADD COLUMN `passenger_id` INT(11) NOT NULL AFTER `confirmation_number`,
ADD COLUMN `flight_id` INT(11) NOT NULL AFTER `passenger_id`,
ADD INDEX `fk_tickets_passengers_idx` (`passenger_id` ASC) VISIBLE,
ADD INDEX `fk_tickets_flights1_idx` (`flight_id` ASC) VISIBLE,
ADD INDEX `fk_tickets_flight_classes1_idx` (`flight_classes_class_id` ASC) VISIBLE,
DROP INDEX `fk_tickets_flight_classes1_idx` ,
DROP INDEX `fk_tickets_flights1_idx` ,
DROP INDEX `fk_tickets_passengers_idx` ;
;

ALTER TABLE `db-flight_booking_system`.`flight_classes` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `db-flight_booking_system`.`flights` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `airport_id`,
DROP COLUMN `airline_id`,
DROP COLUMN `arrival_airport_id`,
DROP COLUMN `departure_airport_id`,
ADD COLUMN `airline_id` INT(11) NOT NULL AFTER `journey_distance`,
ADD COLUMN `departure_airport_id` INT(11) NOT NULL AFTER `airline_id`,
ADD INDEX `fk_flights_airline1_idx` (`airline_id` ASC) VISIBLE,
ADD INDEX `fk_flights_airports1_idx` (`departure_airport_id` ASC) VISIBLE,
ADD INDEX `fk_flights_airports2_idx` (`arrival_airport_id` ASC) VISIBLE,
DROP INDEX `fk_flights_airports1_idx` ,
DROP INDEX `fk_flights_airline1_idx` ;
;

ALTER TABLE `db-flight_booking_system`.`airports` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `db-flight_booking_system`.`airline` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `db-flight_booking_system`.`passengers_has_flights` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `flight_id`,
DROP COLUMN `passenger_id`,
ADD COLUMN `passenger_id` INT(11) NOT NULL FIRST,
ADD COLUMN `flight_id` INT(11) NOT NULL AFTER `passenger_id`,
ADD INDEX `fk_passengers_has_flights_flights1_idx` (`flight_id` ASC) VISIBLE,
ADD INDEX `fk_passengers_has_flights_passengers1_idx` (`passenger_id` ASC) VISIBLE,
DROP INDEX `fk_passengers_has_flights_passengers1_idx` ,
DROP INDEX `fk_passengers_has_flights_flights1_idx` ;
ALTER TABLE `db-flight_booking_system`.`passengers_has_flights` ALTER INDEX `PRIMARY` VISIBLE;

ALTER TABLE `db-flight_booking_system`.`tickets` 
DROP FOREIGN KEY `fk_tickets_passengers`,
DROP FOREIGN KEY `fk_tickets_flights1`;

ALTER TABLE `db-flight_booking_system`.`tickets` ADD CONSTRAINT `fk_tickets_passengers`
  FOREIGN KEY (`passenger_id`)
  REFERENCES `db-flight_booking_system`.`passengers` (`passenger_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tickets_flights1`
  FOREIGN KEY (`flight_id`)
  REFERENCES `db-flight_booking_system`.`flights` (`flight_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tickets_flight_classes1`
  FOREIGN KEY (`flight_classes_class_id`)
  REFERENCES `db-flight_booking_system`.`flight_classes` (`class_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `db-flight_booking_system`.`flights` 
ADD CONSTRAINT `fk_flights_airline1`
  FOREIGN KEY (`airline_id`)
  REFERENCES `db-flight_booking_system`.`airline` (`airline_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_flights_airports1`
  FOREIGN KEY (`departure_airport_id`)
  REFERENCES `db-flight_booking_system`.`airports` (`airport_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_flights_airports2`
  FOREIGN KEY (`arrival_airport_id`)
  REFERENCES `db-flight_booking_system`.`airports` (`airport_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `db-flight_booking_system`.`passengers_has_flights` 
DROP FOREIGN KEY `fk_passengers_has_flights_passengers1`;

ALTER TABLE `db-flight_booking_system`.`passengers_has_flights` ADD CONSTRAINT `fk_passengers_has_flights_passengers1`
  FOREIGN KEY (`passenger_id`)
  REFERENCES `db-flight_booking_system`.`passengers` (`passenger_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_passengers_has_flights_flights1`
  FOREIGN KEY (`flight_id`)
  REFERENCES `db-flight_booking_system`.`flights` (`flight_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
