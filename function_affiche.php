<?php

require_once("db.php");

////////   affiche tout les eleves de l'ecole
function show_all_eleve(){
        global $dbh;
        $stmt = $dbh->prepare("SELECT *
          FROM eleve");
        $stmt->execute();
        $listeEleve = $stmt->fetchAll();
        return $listeEleve;
}
////////   affiche tout les profs de l'ecole
function show_all_prof(){
        global $dbh;
        $stmt = $dbh->prepare("SELECT *
          FROM prof");
        $stmt->execute();
        $listeProf = $stmt->fetchAll();
        return $listeProf;
}
//////// affiche toute les classe de l'ecole
function show_all_classe(){
        global $dbh;
        $stmt = $dbh->prepare("SELECT *
          FROM classe");
        $stmt->execute();
        $listeClasse = $stmt->fetchAll();
        return $listeClasse;
}

////////   affiche tout les maitre de stage de l'ecole
function show_all_maitre_stage(){
        global $dbh;
        $stmt = $dbh->prepare("SELECT *
          FROM maitre_stage");
        $stmt->execute();
        $listeMaitreStage = $stmt->fetchAll();
        return $listeMaitreStage;

}
////////   affiche tout les admin de l'ecole
function show_all_admin(){
        global $dbh;
        $stmt = $dbh->prepare("SELECT *
          FROM admistration");
        $stmt->execute();
        $listeAdmin = $stmt->fetchAll();
        return $listeAdmin;
}

///////// afiche toute les matieres
function show_matiere(){
    global $dbh;
    $stmt = $dbh->prepare("SELECT *
      FROM matiere");
    $stmt->execute();
    $listeMatiere = $stmt->fetchAll();
    return $listeMatiere;
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

////////   affiche les entreprise,maitre de stage d'une classe
function show_stage_classe($classe){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM ligne_classe,maitre_stage,entreprise,stage
	  WHERE ligne_classe.id_eleve = stage.id_eleve
	  AND maitre_stage.id_maitre_stage = stage.id_eleve
	  AND entreprise.id_entreprise = stage.id_entreprise
	  AND id_classe=$classe
	  ");
	$stmt->execute();
	$liste_eleve_classe = $stmt->fetchAll();
	return $liste_stage_classe;
}

////////   affiche les entreprise,maitre de stage d'une classe
function show_stage($){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM ligne_classe,maitre_stage,entreprise,stage
	  WHERE ligne_classe.id_eleve = stage.id_eleve
	  AND maitre_stage.id_maitre_stage = stage.id_eleve
	  AND entreprise.id_entreprise = stage.id_entreprise
	  ");
	$stmt->execute();
	$liste_eleve_classe = $stmt->fetchAll();
	return $liste_stage;
}



//////// affiche le ou les eleves, entreprise associé au maitre de stage
function show_stage_once($maitre){
	global $dbh;
	$stmt = $dbh->prepare("SELECT *
	  FROM ligne_classe,maitre_stage,entreprise,stage
	  WHERE ligne_classe.id_eleve = stage.id_eleve
	  AND maitre_stage.id_maitre_stage = stage.id_eleve
	  AND entreprise.id_entreprise = stage.id_entreprise
	  AND id_maitre_stage = $maitre;
	  OR nom = $maitre
	  ");
	$stmt->execute();
	$liste_eleve_classe = $stmt->fetchAll();
	return $liste_stage_once;
}


?>
