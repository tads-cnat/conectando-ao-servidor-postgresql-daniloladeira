CREATE TABLE Pessoa {
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR (100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
}

CREATE TABLE Paciente {
    codigo SERIAL PRIMARY KEY,
    cpf_paciente CHAR(11) FOREIGN KEY REFERENCES Pessoa(cpf) ON DELETE CASCADE,
    senha VARCHAR(100) NOT NULL CHECK (LENGTH(senha) BETWENN 5 AND 10),
    plano_saude BOOLEAN NOT NULL,
}

CREATE TABLE Medico {
    crm CHAR(7) PRIMARY KEY,
    primeiro_nome VARCHAR(100) NOT NULL,
    segundo_nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf_medico CHAR(11) FOREIGN KEY REFERENCES Pessoa(cpf) ON DELETE CASCADE,
}

CREATE TABLE Especialidade {
    identificador SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
}

CREATE TABLE Agendamento {
    id SERIAL PRIMARY KEY,
    codigo_paciente INT NOT NULL FOREIGN KEY REFERENCES Paciente(codigo) ON DELETE CASCADE,
    crm_medico CHAR(7) NOT NULL FOREIGN KEY REFERENCES Medico(crm) ON DELETE CASCADE,
    data_hora_consulta TIMESTAMP NOT NULL,
    data_hora_agendamento TIMESTAMP NOT NULL, 
    valor_consulta DECIMAL(10,2) NOT NULL,
}