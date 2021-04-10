<?php
    require_once("config_upload_api.php");

    $query ="SELECT * FROM upload_flutter";
    $phot = mysqli_query($con, $query);
    $list = array();
    
    while ($rowdata = $phot->fetch_assoc()){
        $list[]= $rowdata;
    };
    echo json_encode($list);
?>