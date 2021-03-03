# **DESAFIO DART AVANÇADO**

## ***Objetivo:***
- Cadastrar as regiões, todos os estados e suas respectivas cidades em um banco de dados

## ***Origem dos dados:***
- ### Utilizar a API de localidades do IBGE:
    * #### Para obter todas as regiões:
        * https://servicodados.ibge.gov.br/api/v1/localidades/regioes
    * #### Para obter todos os estados:
        * https://servicodados.ibge.gov.br/api/v1/localidades/estados
    * #### Para obter as cidades por estado:
        * https://servicodados.ibge.gov.br/api/v1/localidades/estados/{idEstado}/distritos

        * **Onde:** 'idEstado' é o identificador(Id) do estado

        * **Exemplo:** Cidades de São Paulo - idEstado = 35
            * https://servicodados.ibge.gov.br/api/v1/localidades/estados/35/distritos

## ***Abordagens e Recursos Utilizados:***
- `POO`
- `Assincronismo`
- `Models`
- `Interfaces`
- `Pattern Repository`
- `Services`
- `Pacote dio`
- `Pacote mysql1`
- `Banco de Dados MySql`
- `Docker`

## ***Observações:***

> 1. O banco de dados MySql será executado em um container docker cuja sua imagem docker e configurações de acesso vão estar em um arquivo de configuração chamado *`docker-compose.yaml`*;

> 2. Para criação das tabelas no banco de dados, existem um arquivo *`script_criacao_tabelas.sql`* que fica na pasta **sql**.