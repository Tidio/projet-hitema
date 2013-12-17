<?php
require_once("db.php");

//Créer une nouvelle évaluation
function creerEval($eval){
	global $dbh;
	$sql = "INSERT INTO devoir VALUES ('', :nom, :date, :coef, :mat, :classe, :prof)";
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(':nom', $eval[0]);
	$stmt->bindValue(':date', $eval[1]);
	$stmt->bindValue(':coef', $eval[2]);
	$stmt->bindValue(':mat', $eval[3]);
	$stmt->bindValue(':classe', $eval[4]);
	$stmt->bindValue(':prof', $eval[5]);
	$stmt->execute();
	$lastid = $dbh->lastInsertId();
	$sql ='SELECT id_eleve FROM ligne_classe WHERE id_classe=:classe';
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(':classe', $eval[4]);
	$liste = $stmt->fetchAll();
	foreach ($liste as $ideleve) {
		$sql2 = "INSERT INTO evaluation value ('', :iddevoir, :ideleve, 0)";
		$stmt2 = $dbh->prepare($sql2);
		$stmt->bindValue(':iddevoir', $lastid);
		$stmt->bindValue(':ideleve', $ideleve);
		$stmt->execute();
	}
}

//Recupère une liste de note pour une évaluation
function listeNote($idEval){
		global $dbh;
		$sql = 'SELECT * FROM evaluation WHERE id_eval=:ideval';
		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':ideval', $idEval);
		$stmt->execute();
		$listeNote = $stmt->fetchAll();
		return $listeNote;
}

function liste_nom_eval($idEval){
		global $dbh;
		$sql = 'SELECT nomel, prenomel, note
			FROM evaluation, ligne_classe, eleve
			WHERE id_eval=:ideval
			AND evaluation.id_eleve = ligne_classe.id_eleve
			AND ligne_classe.id_eleve = eleve.id_eleve';
		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':ideval', $idEval);
		$stmt->execute();
		$listeNom = $stmt->fetchAll();
		return $listeNom;
}

//Modification d'une liste de note
function modifNote(){

}

//Recupère une liste de note en fonction de critères
function afficherNote(){

}

function show_eval(){
	global $dbh;
	$sql = 'SELECT * FROM evaluation';
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
	$listeEval = $stmt->fetchAll();
	return $listeEval;
}
?>
