-- -----------------------------------------------------
-- Schema desafio_dart_avancado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `desafio_dart_avancado` DEFAULT CHARACTER SET utf8 ;
USE `desafio_dart_avancado` ;

-- -----------------------------------------------------
-- Table `Regiao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Regiao` (
  `id_regiao` INT NOT NULL,
  `sigla` VARCHAR(2) NOT NULL,
  `nome` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_regiao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Estado` (
  `id_estado` INT NOT NULL,
  `sigla` VARCHAR(2) NOT NULL,
  `nome` VARCHAR(30) NOT NULL,
  `id_regiao` INT NOT NULL,
  PRIMARY KEY (`id_estado`),
  INDEX `fk_Estado_Regiao_idx` (`id_regiao` ASC) VISIBLE,
  CONSTRAINT `fk_Estado_Regiao`
    FOREIGN KEY (`id_regiao`)
    REFERENCES `Regiao` (`id_regiao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cidade` (
  `id_cidade` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_cidade`),
  INDEX `fk_Cidade_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
