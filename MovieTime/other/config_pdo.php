<?Php
$host_name = "localhost";
$database = "movietime"; // Change your database nae
$username = "root";          // Your database user id 
$password =  "";          // Your password

//////// Don't Edit below /////////
try {
$dbo = new PDO('mysql:host='.$host_name.';dbname='.$database, $username, $password);
} catch (PDOException $e) {
print "Error!: " . $e->getMessage() . "<br/>";
echo "<br><br><font color=red>Check MySQL login details inside <b>config.php</b> file</font>";
die();
}
?>