<?php

session_start();

include('db.php');

function affich_news(){

if (empty($_COOKIE['id'])){

	header('Location:login.php');
}

$sql="SELECT *
	  FROM news 
	  ORDER BY created_date
	  LIMIT 0,5";
$stmt = $dbh->prepare($sql);
$stmt->execute();
$news = $stmt->fetchAll();

}