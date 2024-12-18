<?php
session_start();

$conn = new mysqli("localhost:3306", "root", "123456", "trabalho1");

if($conn->connect_error){
    die("Conexão falhou: " . $conn->connect_error );
}

if($_SERVER["REQUEST_METHOD"] == "POST"){

    $nome_time = $_POST["nome_time"];
    $cidade = $_POST["cidade"];
    $estado = $_POST["estado"];
    $fundacao = $_POST["fundacao"];
    $categoria = $_POST["categoria"];

    // Insere os dados na tabela de times
    $sql = "INSERT INTO times (nome_time, cidade, estado, data_fundacao, categoria) 
            VALUES ('$nome_time', '$cidade', '$estado', STR_TO_DATE('$fundacao', '%Y-%m-%d'), '$categoria')";
    
    if ($conn->query($sql) === TRUE) {
        echo "Time cadastrado com sucesso!";
    } else {
        echo "Erro ao cadastrar o time: " . $conn->error;
    }
}
?>
