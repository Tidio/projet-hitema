<?php
require_once("db.php");

function new_etudiant($nom,$prenom,$date,$adresse,$tel,$id_log){
	global $dbh;
	$stmt = $dbh->prepare("INSERT INTO `eleve`( `nomel`, `prenomel`, `date_naissance`, `adresse`, `telephone`,id_login)
						    VALUES (:nom,:prenom,:datee,:adresse,:tel,:id_log)");
	$stmt->bindValue(":nom",$nom);
	$stmt->bindValue(":prenom",$prenom);
	$stmt->bindValue(":datee",$date);
	$stmt->bindValue(":adresse",$adresse);
	$stmt->bindValue(":tel",$tel);
	$stmt->bindValue(":id_log",$id_log);
	$stmt->execute();
}

function new_prof($nom,$prenom,$adresse,$tel,$id_log){
global $dbh;
	$stmt = $dbh->prepare("INSERT INTO `prof`( `nom`, `prenom`, `adresse`, `telephone`,id_login)
						    VALUES (:nom,:prenom,:adresse,:tel,:id_log)");
	$stmt->bindValue(":nom",$nom);
	$stmt->bindValue(":prenom",$prenom);
	$stmt->bindValue(":adresse",$adresse);
	$stmt->bindValue(":tel",$tel);
	$stmt->bindValue(":id_log",$id_log);
	$stmt->execute();
}

function new_maitre_stage($nom,$tel,$id_log){
global $dbh;
	$stmt = $dbh->prepare("INSERT INTO `maitre_stage`( `nom`, `telephone`,id_login)
						    VALUES (:nom,:prenom,:datee,:adresse,:tel,:id_log)");
	$stmt->bindValue(":nom",$nom);
	$stmt->bindValue(":tel",$tel);
	$stmt->bindValue(":id_log",$id_log);
	$stmt->execute();
}


function new_administration($nom,$prenom,$fonction,$id_log){
global $dbh;
	$stmt = $dbh->prepare("INSERT INTO `administration`( `nom`,prenom, `fonction`,id_login)
						    VALUES (:nom,:prenom,:datee,:adresse,:tel,:id_log)");
	$stmt->bindValue(":nom",$nom);
	$stmt->bindValue(":prenom",$prenom);
	$stmt->bindValue(":fonction",$fonction);
	$stmt->bindValue(":id_log",$id_log);
	$stmt->execute();
}

///////// un nouveau login
function new_login($pseudo,$passe,$type){
	global $dbh;
	$stmt = $dbh->prepare("INSERT INTO `login`( `pseudo`, `passe`, `type`) VALUES (:pseudo, :passe, :type)");
	$stmt->bindValue(":pseudo",$pseudo);
	$stmt->bindValue(":passe",$passe);
	$stmt->bindValue(":type",$type);
	$stmt->execute();
	$id_log = $dbh->lastInsertId()

	return $id_log;
}
//////// verifie si le login est disponible 
function dispoflog($login){

	$stmt = $dbh->prepare("SELECT count(*)
	  FROM login
	  WHERE login= :login");
	$stmt->bindValue(":login",$login);
	$stmt->execute();
	$dispo = $stmt->fetch();
	return $dispolog;
}

//////// ajoute une nouvelle entreprise
function new_entreprise($nom_entreprise,$adresse_entreprise,$ville_entreprise,$cp_entreprise,$tel_entreprise){
	global $dbh;
	$stmt = $dbh->prepare("INSERT INTO `entreprise`(`nom_entreprise`, `adresse`, `ville`, `cp`, `telephone`) 
						    VALUES (:nom,:adresse,:ville,:cp,:tel)");
	$stmt->bindValue(":nom",$nom_entreprise);
	$stmt->bindValue(":adresse",$adresse_entreprise);
	$stmt->bindValue(":ville",$ville_entreprise);
	$stmt->bindValue(":cp",$cp_entreprise);
	$stmt->bindValue(":tel",$tel_entreprise);
	$stmt->execute();

}


//////// ajoute une nouvelle eleve dans une classe 
function new_eleve_classe($id_eleve,$id_classe,$promotion){
	global $dbh;
	$stmt = $dbh->prepare("INSERT INTO `ligne_classe`(id_eleve, id_classe, promotion) 
						    VALUES (:id_eleve,:id_classe,:promotion)");
	$stmt->bindValue(":id_eleve",$id_eleve);
	$stmt->bindValue(":id_classe",$id_classe);
	$stmt->bindValue(":promotion",$promotion);
	$stmt->execute();

}


?>
