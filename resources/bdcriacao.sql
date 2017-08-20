
CREATE SCHEMA IF NOT EXISTS gnautica DEFAULT CHARACTER SET utf8 ;
USE gnautica ;

-- -----------------------------------------------------
-- Table gnautica.Aula
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gnautica.Aula (
  idAula INT NOT NULL,
  data DATE NULL,
  localAula VARCHAR(50) NULL,
  horario TIME(2) NULL,
  tipo VARCHAR(30) NULL,
  lembrete VARCHAR(140) NULL,
  PRIMARY KEY (idAula))
;


-- -----------------------------------------------------
-- Table gnautica.Aluno
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gnautica.Aluno (
  idAluno INT NOT NULL,
  nomeAluno VARCHAR(50) NOT NULL,
  CPF VARCHAR(30) NOT NULL,
  endereco VARCHAR(50) NULL,
  telefone VARCHAR(30) NULL,
  email VARCHAR(30) NULL,
  categoria VARCHAR(30) NOT NULL,
  pendencia VARCHAR(30) NULL,
  avaliacao VARCHAR(30) NULL,
  Aula_idAula INT NOT NULL,
  PRIMARY KEY (idAluno, Aula_idAula),
  INDEX fk_Aluno_Aula1_idx (Aula_idAula ASC),
  CONSTRAINT fk_Aluno_Aula1
    FOREIGN KEY (Aula_idAula)
    REFERENCES gnautica.Aula (idAula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table gnautica.Pagamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gnautica.Pagamento (
  idPagamento INT NOT NULL,
  taxa DOUBLE NULL,
  carteira DOUBLE NULL,
  tipo VARCHAR(30) NULL,
  situacao VARCHAR(30) NULL,
  Aluno_idAluno INT NOT NULL,
  PRIMARY KEY (idPagamento, Aluno_idAluno),
  INDEX fk_Pagamento_Aluno1_idx (Aluno_idAluno ASC),
  CONSTRAINT fk_Pagamento_Aluno1
    FOREIGN KEY (Aluno_idAluno)
    REFERENCES gnautica.Aluno (idAluno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table gnautica.Gastos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gnautica.Gastos (
  idGastos INT NOT NULL,
  tipo VARCHAR(30) NULL,
  valor DOUBLE NULL,
  Aula_idAula INT NOT NULL,
  PRIMARY KEY (idGastos, Aula_idAula),
  INDEX fk_Gastos_Aula1_idx (Aula_idAula ASC),
  CONSTRAINT fk_Gastos_Aula1
    FOREIGN KEY (Aula_idAula)
    REFERENCES gnautica.Aula (idAula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table gnautica.Documento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gnautica.Documento (
  idDocumento INT NOT NULL,
  tipo VARCHAR(30) NULL,
  condicao VARCHAR(30) NULL,
  Aluno_idAluno INT NOT NULL,
  PRIMARY KEY (idDocumento, Aluno_idAluno),
  INDEX fk_Documento_Aluno1_idx (Aluno_idAluno ASC),
  CONSTRAINT fk_Documento_Aluno1
    FOREIGN KEY (Aluno_idAluno)
    REFERENCES gnautica.Aluno (idAluno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
