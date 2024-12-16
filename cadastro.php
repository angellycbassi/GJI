<?php
session_start();

$conn = new mysqli("localhost:3306", "root", "123456", "trabalho1");

if($conn->connect_error){
    die("conexão falhou: " . $conn->connect_error );
}

if($_SERVER["REQUEST_METHOD"] == "POST"){

    $nome = $_POST["nome"];
    $sexo = $_POST["sexo"];
    $email = $_POST["email"];
    $telefone = $_POST["telefone"];
    $cpf = $_POST["cpf"];
    $data = $_POST["data"];
    $categoria = $_POST["categoria"];
    $esporte = $_POST["esporte"];
    $termos = $_POST["termos"];


    $sql = "INSERT INTO participante(nome, sexo, email, telefone, cpf, data_nascimento, IDcategoria, esporte, termo) values('$nome', '$sexo', '$email', '$telefone', '$cpf', STR_TO_DATE( '$data', '%m/%d/%Y' ), '$categoria', '$esporte', TRUE)";
    echo $sql;
    $conn->query($sql);
}
?>

