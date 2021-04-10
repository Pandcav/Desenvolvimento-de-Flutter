<?php
    require_once("config_upload_api.php");

    $query ="SELECT * FROM tb_cardapio";
    $prod = mysqli_query($con, $query);
    $list = array();
    
    while ($rowdata = $prod->fetch_assoc()){
        $list[]= $rowdata;
    };
    echo json_encode($list);
?>