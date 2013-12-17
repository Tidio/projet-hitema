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


//////// verifie si le login existe
function veriflog($login,$mdp){

	$stmt = $dbh->prepare("SELECT id,type
	  FROM login
	  WHERE login= :login
	  AND passe= :mdp");
	$stmt->bindValue(":login",$login);
	$stmt->bindValue(":mdp",$mdp);
	$stmt->execute();
	$type_de_log = $stmt->fetchAll();
	return $type_de_log;
}






//////// recupere l'id de l'utilisateur
function recupid($id,$type){

	$stmt = $dbh->prepare("SELECT *
	  FROM :type
	  WHERE id_login= :id");
	$stmt->bindValue(":type",$type);
	$stmt->bindValue("id",$id);
	$stmt->execute();
	$info_user = $stmt->fetchAll();
	return $info_user;
}
