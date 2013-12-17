<?php

include('db.php');




function affich_news(){

global $dbh;

$sql="SELECT *
	  FROM news 
	  ORDER BY date_news
	  LIMIT 0,5";
$stmt = $dbh->prepare($sql);
$stmt->execute();
$news = $stmt->fetchAll();

return $news;

}


//////// verifie si le login existe
function veriflog($login,$mdp){
	global $dbh;
	$salt=salt($login);
	$salt.=$mdp;
	$mdp=mdpcrypt($salt);

	$stmt = $dbh->prepare("SELECT id,type
	  FROM login
	  WHERE pseudo= :login
	  AND passe= :mdp");
	$stmt->bindValue(":login",$login);
	$stmt->bindValue(":mdp",$mdp);
	$stmt->execute();
	$type_de_log = $stmt->fetchAll();

	return $type_de_log;
}

//////// recupere l'id de l'utilisateur
function recupid($id,$type){
	global $dbh;
	$id=intval($id);
	$stmt = $dbh->prepare("SELECT *
	  FROM $type
	  WHERE id_login = :id");
	//$stmt->bindValue(":type",$type);
	$stmt->bindValue(":id",$id);
	$stmt->execute();
	$info_user = $stmt->fetchAll();
	return $info_user;
}


function mdpcrypt($mdp){


	$mdpcrypt=hash("sha512",$mdp);

	for($i=0;$i<5000;$i++){

		$mdpcrypt=hash("sha512",$mdpcrypt);
	}

	return $mdpcrypt;


}
function salt($login){
	global $dbh;
	$stmt = $dbh->prepare("SELECT salt
	  FROM login
	  WHERE pseudo = :log");
	//$stmt->bindValue(":type",$type);
	$stmt->bindValue(":log",$login);
	$stmt->execute();
	$salts = $stmt->fetch();
	
	$salt= $salts['salt'];
	return $salt;
	

}


function extract_info_user($recup_info){

	foreach ($recup_info as $recup) {
			$_SESSION['id']=$recup['id'];
			$_SESSION['nom']=$recup['nom'];
			$_SESSION['prenom']=$recup['prenom'];
			$_SESSION['id_login']=$recup['id'];
		;
		}

}
