<?php
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    
    require '../PHPMailer/src/Exception.php';
    require '../PHPMailer/src/PHPMailer.php';
    require '../PHPMailer/src/SMTP.php';
    include('db.php');

if(isset($_POST["getdata"])){
    $email = $_POST["email"];
    
    $query1 = "select uId, uName from ecomUser where uEmail='". $email. "' and  otpStatus='Verified'";
    $res = mysqli_query($conn, $query1) or die("sql query failed");
    
        if (mysqli_num_rows($res) > 0) {
             while ($row = mysqli_fetch_assoc($res)) {
        		 $response['uId'] = $row["uId"];
        		 $response['uName'] = $row["uName"];
        		 
             }
        }
        else{ 
          $response['data'] = "false";
        }
        echo json_encode($response, JSON_PRETTY_PRINT);
}



if(isset($_POST["checklogin"])){
    $email = $_POST["email"];
    $password =$_POST["password"];
    
    $query1 = "select * from ecomUser where uEmail='". $email. "' and uPassword='". $password."' and otpStatus='Verified'";
    $res = mysqli_query($conn, $query1) or die("sql query failed");
    
    
        if (mysqli_num_rows($res) > 0) {
        		 $response['status'] = "true";
                 echo json_encode($response, JSON_PRETTY_PRINT);
        }
        else{ 
          $response['status'] = "false";
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
}
    
if(isset($_POST["signup"])){
    $name = $_POST["name"];
    $phone =$_POST["phone"];
    $email = $_POST["email"];
    $password =$_POST["password"];
    $code = rand(999999, 111111);
    
    $q = "select uEmail from `ecomUser`where `uEmail` = '".$email."' and otpStatus='Verified'";
    $r = mysqli_query($conn, $q) or die("sql query failed");
    if (mysqli_num_rows($r) > 0) {
       $response['status'] = "exists";
       echo json_encode($response, JSON_PRETTY_PRINT);
    }    		 
    else{ 
    
      $mail = new PHPMailer;
                $mail->isSMTP();
                $mail->SMTPDebug = 0;
                $mail->Host = 'smtp.gmail.com';
                $mail->Port = 587;
                $mail->SMTPAuth = true;
                $mail->SMTPSecure = 'tls';

                $mail->Username = 'movietime0355@gmail.com';
                $mail->Password = 'firhxiezbdelibtt';

                $mail->setFrom('movietime0355@gmail.com', 'EComm');
                $mail->addReplyTo('movietime0355@gmail.com', 'EComm');
                $mail->addAddress($email, $name);
                $mail->isHTML(true);

                $mail->Subject = "Verification Code";
                $mail->Body = "<p>Dear $name, </p> <h3>Your verification code for signup is $code <br></h3>
                        <br><br>
                        <p>With regards,</p>
                        <b>EComm</b>";


                if (!$mail->send()) {
                    $response['status'] = "error";
                    $response['error'] = "Failed while sending code!";
                    echo json_encode($response, JSON_PRETTY_PRINT);
                    
                }else{
                     $query1 = "INSERT INTO `ecomUser`(`uName`, `uPhoneNo`, `uEmail`, `uPassword`, `otpCode`) VALUES ('".$name."','".$phone."','".$email."','".$password."','".$code."')";
                     
                    $res = mysqli_query($conn, $query1) or die("sql query failed");
                
                    $response['status'] = "success";
                    $response['verify_code'] = $code;
                    echo json_encode($response, JSON_PRETTY_PRINT);
                    
                }
    }
}
 
 
 if(isset($_POST["checkotp"])){
    $email = $_POST["email"];
    $code =$_POST["code"];
    $temp;
    
    $query1 = "select otpCode from ecomUser where uEmail='". $email. "'";
    $res = mysqli_query($conn, $query1) or die("sql query failed");
    
        if (mysqli_num_rows($res) > 0) {
             while ($row = mysqli_fetch_assoc($res)) {
                    $temp = $row["otpCode"];
             }
                if($temp == $code){
                    $query2 = "UPDATE `ecomUser` SET `otpStatus`='Verified' WHERE uEmail='". $email ."' ";
                    $res2 = mysqli_query($conn, $query2) or die("sql query failed");
        		    $response['code'] = "right";
                }else{
        		    $response['code'] = "wrong";
                }             
        }
        else{ 
          $response['status'] = "false";
        }
        echo json_encode($response, JSON_PRETTY_PRINT);
}   
    
 
 if(isset($_POST["addtocart"])){
    // $uid=$pid=$title=$price=$quantity=$category="N/A";
    $uid =$_POST["uid"];
    $pid =$_POST["pid"];
    $pimg =$_POST["pimg"];
    $title =$_POST["title"];
    $price =$_POST["price"];
    $quantity =$_POST["quantity"];
    $category =$_POST["category"];
     
    $q = "INSERT INTO `ecomCart`(`uId`, `pId`,`pImg`, `pTitle`, `pPrice`, `pQuantity`, `pCategory`) VALUES  ('".$uid."','".$pid."', '".$pimg."','".$title."','".$price."','".$quantity."','".$category."')";
                     
    $res = mysqli_query($conn, $q); //or die("sql query failed" ." - ". $uid ." - ". $pid." - ".$title." - ".$price." - ".$quantity." - ".$category);
        
        if($res){
            $response['status'] = "success";
            echo json_encode($response, JSON_PRETTY_PRINT);
        }   
        else{
            $response['status'] = "fail";
           echo json_encode($response, JSON_PRETTY_PRINT);
        }     
 }
 
 if(isset($_POST["getCart"])){
    $uid =$_POST["uId"];

    $query = "select * from ecomCart where uId = '".$uid."' ";
    // $query1 = "select  ecomCart.pId, ecomCart.pTitle, ecomCart.pPrice, ecomCart.pQuantity, ecomCart.pCategory  FROM ecomCart INNER join ecomUser on ecomUser.uId = ecomCart.uId where ecomUser.uId='" .$uid. "' ";
    $res = mysqli_query($conn, $query) or die("sql query failed");
    $response = array();
    if($res){
        if (mysqli_num_rows($res) > 0) {
             while ($row = mysqli_fetch_assoc($res)) {
                 	array_push($response, array(
                    'data' => "true",
                    'pId' => $row["pId"],
                    'pImg' => $row["pImg"],
        		    'pTitle' => $row["pTitle"],
                    'pPrice' => $row["pPrice"],
                    'pCategory' => $row["pCategory"],
                    'pQuantity' => $row["pQuantity"]
                    )
                );
            }
            echo json_encode($response, JSON_PRETTY_PRINT);
        }else{ 
            array_push($response, array('data' => "false"));
            // $response['data'] = "false";
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
    }else{
        array_push($response, array('data'=> "false"));
        // $response['data'] = "fail";
        echo json_encode($response, JSON_PRETTY_PRINT);
    }
}
  
 if(isset($_POST["deleteItem"])){
    $uId = $_POST["uId"];
    $pId =$_POST["pId"];
    
    $query1 = "DELETE FROM `ecomCart` WHERE uId='". $uId. "' and pId='".$pId."'";
    $res = mysqli_query($conn, $query1) or die("sql query failed");

    if($res){
        $response['status'] = "success";
    }else{
        $response['status'] = "fail";
    }             
        
    echo json_encode($response, JSON_PRETTY_PRINT);
}
 
 
    
mysqli_close($conn);
?>