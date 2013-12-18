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
	$lastid = $dbh->lastInsertId($name='id_devoir');
	$sql ="SELECT id_eleve FROM ligne_classe WHERE id_classe=:classe";
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(':classe', $eval[4]);
	$stmt->execute();
	$liste = $stmt->fetchAll();
	foreach ($liste as $ideleve) {
		$sql2 = "INSERT INTO evaluation value ('', :iddevoir, :ideleve, 0)";
		$stmt2 = $dbh->prepare($sql2);
		$stmt2->bindValue(':iddevoir', $lastid);
		$stmt2->bindValue(':ideleve', $ideleve['id_eleve']);
		$stmt2->execute();
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
		$sql = 'SELECT nomel, prenomel, note, evaluation.id_eleve, id_eval
			FROM devoir, evaluation, ligne_classe, eleve
			WHERE evaluation.id_devoir = devoir.id_devoir
			AND evaluation.id_eleve = ligne_classe.id_eleve
			AND ligne_classe.id_eleve = eleve.id_eleve
			AND evaluation.id_devoir=:ideval';
		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':ideval', $idEval);
		$stmt->execute();
		$listeNom = $stmt->fetchAll();
		return $listeNom;
}

//Modification d'une liste de note
function modif_note($note, $eleve, $eval){
	global $dbh;
	foreach ($note as $key => $n){
		$sql = 'UPDATE evaluation SET note=:note WHERE id_eval =:ideval AND id_eleve=:ideleve';
		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':ideval', $eval);
		$stmt->bindValue(':note', $n);
		$stmt->bindValue(':ideleve', $eleve[$key]);
		$stmt->execute();
	}
}

//Supprimer un devoir
function delete_eval($iddevoir){
	global $dbh;
	$sql = 'DELETE FROM devoir WHERE id_devoir =:iddevoir';
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(':iddevoir', $iddevoir);
	$stmt->execute();
}

//Recupère une liste de note en fonction de critères
function afficher_note(){

}

function show_eval(){
	global $dbh;
	$sql = 'SELECT * FROM evaluation';
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
	$listeEval = $stmt->fetchAll();
	return $listeEval;
}

function show_devoir(){
	global $dbh;
	$sql = 'SELECT id_devoir, nom_dev FROM devoir';
	$stmt = $dbh->prepare($sql);
	$stmt->execute();
	$listeEval = $stmt->fetchAll();
	return $listeEval;
}

?>
