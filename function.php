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


function extract_info_user($recup_info,$type){

	foreach ($recup_info as $recup) {
			if($type=="eleve"){
			$_SESSION['id'] = $recup['id_eleve'];
			$_SESSION['nom'] = $recup['nomel'];
			$_SESSION['prenom'] = $recup['prenomel'];
			}
			elseif($type=="prof"){
			$_SESSION['id'] = $recup['id_prof'];
			$_SESSION['nom'] = $recup['nom'];
			$_SESSION['prenom'] = $recup['prenom'];
			}
			elseif($type=="maitre_stage"){
			$_SESSION['id'] = $recup['id_maitre_stage'];
			$_SESSION['nom'] = $recup['nom_maitre_stage'];
			}
			elseif($type=="administrateur"){
			$_SESSION['id'] = $recup['id_ad'];
			$_SESSION['nom'] = $recup['nom_ad'];
			$_SESSION['prenom'] = $recup['prenom_ad'];
			}
		
		}

}

function modif_news($id){

	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM news
	  WHERE id_news = :id");
	//$stmt->bindValue(":type",$type);
	$stmt->bindValue(":id",$id);
	$stmt->execute();
	$news = $stmt->fetchAll();
	return $news;
}

	function generateNewPassword(){

		$chars = "23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
		$length = mt_rand(8,12);

		$shuffled = str_shuffle($chars);
		$pw = substr($shuffled, 0, $length);

		echo $pw;
		return $pw;

	}

		function generateNewSalt(){

		$chars = "23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
		$length = mt_rand(4,5);

		$shuffled = str_shuffle($chars);
		$pw = substr($shuffled, 0, $length);

		echo $pw;
		return $pw;

	}

function show_classe(){
	
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM classe");
	$stmt->execute();
	$classe = $stmt->fetchAll();
	return $classe;

	}


function show_salle(){
	
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM salle");
	$stmt->execute();
	$salle = $stmt->fetchAll();
	return $salle;

	}

function planning($classe,$salle,$date_debut,$date_fin){

	global $dbh;
	if ($salle=="*" and $classe !="*") {
	  echo"erreur1";
	  $stmt = $dbh->prepare("SELECT date_planning, pro.nom ,sujet,libelle
	  FROM planning pla,classe cla,prof pro,section_journee sec,salle sal
	  WHERE pla.id_prof=pro.id_prof
	  AND pla.id_classe=cla.id_classe
	  AND pla.id_section_journee=sec.id_section_journee
	  AND pla.id_salle=sal.id_salle
	  AND pla.id_classe=:classe
	  AND pla.date_planning BETWEEN :debut AND :fin");
	  $stmt->bindValue(":classe",$classe);
	  $stmt->bindValue(":debut",$date_debut);
	  $stmt->bindValue(":fin",$date_fin);

	}
	elseif ($classe=="*" and $salle!="*") {
		echo"erreur2";
   	  $stmt = $dbh->prepare("SELECT date_planning, pro.nom ,sujet,libelle
	  FROM planning pla,classe cla,prof pro,section_journee sec,salle sal
	  WHERE pla.id_prof=pro.id_prof
	  AND pla.id_classe=cla.id_classe
	  AND pla.id_section_journee=sec.id_section_journee
	  AND pla.id_salle=sal.id_salle
	  AND pla.id_salle=:salle
	  AND pla.date_planning BETWEEN :debut AND :fin");
	  $stmt->bindValue(":salle",$salle);
	  $stmt->bindValue(":debut",$date_debut);
	  $stmt->bindValue(":fin",$date_fin);

	}
	elseif ($classe=="*" and $salle=="*") {
		echo"erreur3";
	$stmt = $dbh->prepare("SELECT date_planning, pro.nom ,sujet,libelle 
	  FROM planning pla,classe cla,prof pro,section_journee sec,salle sal
	  WHERE pla.id_prof=pro.id_prof
	  AND pla.id_classe=cla.id_classe
	  AND pla.id_section_journee=sec.id_section_journee
	  AND pla.id_salle=sal.id_salle
	  AND pla.date_planning BETWEEN :debut AND :fin");
	$stmt->bindValue(":debut",$date_debut);
	$stmt->bindValue(":fin",$date_fin);
	}
	elseif ($classe!="*" and $salle!="*") {
		echo"erreur4";
	$stmt = $dbh->prepare("SELECT date_planning, pro.nom ,sujet,libelle
	  FROM planning pla,classe cla,prof pro,section_journee sec,salle sal
	  WHERE pla.id_prof=pro.id_prof
	  AND pla.id_classe=cla.id_classe
	  AND pla.id_section_journee=sec.id_section_journee
	  AND pla.id_salle=sal.id_salle
	  AND pla.id_classe=:classe
	  AND pla.id_salle=:salle
	  AND pla.date_planning BETWEEN :debut AND :fin");
	$stmt->bindValue(":classe",$classe);
	$stmt->bindValue(":salle",$salle);
	$stmt->bindValue(":debut",$date_debut);
	$stmt->bindValue(":fin",$date_fin);
	}


	$stmt->execute();
	$planning = $stmt->fetchAll();
	return $planning;
}
