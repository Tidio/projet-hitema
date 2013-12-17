<?php

require_once("db.php");

////////   affiche tout les eleves de l'ecole
function show_all_eleve(){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM eleve");
	$stmt->execute();
	$news = $stmt->fetchAll();
}
////////   affiche tout les profs de l'ecole
function show_all_prof(){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM prof");
	$stmt->execute();
	$news = $stmt->fetchAll();
}
////////   affiche tout les maitre de stage de l'ecole
function show_all_maitre_stage(){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM maitre_stage");
	$stmt->execute();
	$news = $stmt->fetchAll();
}
////////   affiche tout les admin de l'ecole
function show_all_admin(){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM admin");
	$stmt->execute();
	$news = $stmt->fetchAll();
}


////////   affiche tout les eleves d'une classe
function show_classe_eleve($classe){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *.eleve
	  FROM ligne_classe
	  WHERE eleve.id_eleve = ligne_classe.id_eleve
	  AND id_classe = $classe");
	$stmt->execute();
	$liste_eleve_classe = $stmt->fetchAll();
	return $liste_eleve_classe;
}

////////   affiche les entreprise,maitre de stage  
function show_stage($classe){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM eleve,maitre_stage,entreprise,stage
	  WHERE eleve.id_eleve = stage.id_eleve
	  AND maitre_stage.id_maitre_stage = stage.id_eleve
	  AND eleve.id_eleve = stage.id_eleve
	  AND eleve.id_eleve = stage.id_eleve
	  ");
	$stmt->execute();
	$liste_eleve_classe = $stmt->fetchAll();
	return $liste_eleve_classe;
}




?>
