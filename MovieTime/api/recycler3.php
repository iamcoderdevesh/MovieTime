<?php

// $conn = mysqli_connect("localhost", "root", "", "movietime")  or die("Connection failed"); ...where MovieLanguages='hindi'
include('db.php');
$query1 = "select  MovieName,MovieGenre,VerticalimagePath from movies where status='NOW SHOWING MOVIE' and MovieLanguages LIKE '%english%' order by MovieId desc limit 10";
$res = mysqli_query($conn, $query1) or die("sql query failed");

$result = array();

if (mysqli_num_rows($res) > 0) {
    while ($row = mysqli_fetch_assoc($res)) {
		array_push($result, array(
            'movie_name' => $row["MovieName"],
		 'movie_genre' => $row["MovieGenre"],
            'image' => $row["VerticalimagePath"]
        )
    );

	}
echo json_encode($result);
}
else{
    echo "No Record Found";
}
mysqli_close($conn);
?>