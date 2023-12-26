<?php 
    // $db_connection = mysqli_connect("localhost","root","","movietime");
    // // CHECK DATABASE CONNECTION
    // if(mysqli_connect_errno()){
    //     echo "Connection Failed".mysqli_connect_error();
    //     exit;
    // }
    session_start();
    $conn = mysqli_connect("localhost","root", "","movietime");
    // CHECK DATABASE CONNECTION
    if(mysqli_connect_errno()){
        echo "Connection Failed".mysqli_connect_error();
        exit;
    }
?>