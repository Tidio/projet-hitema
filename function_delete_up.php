<?php
//Supprimer un eleve 
function delete_eleve(){
if(!empty($_POST['option'])){
if($_POST['option']=="delete"){

	$sql="DELETE FROM eleve
		  WHERE eleve.id_eleve=:id";
		  
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(":id", $_GET['id_eleve']);
	$stmt->execute();
	header("Location:list_eleve.php");		
}
}
// modification 
function up_eleve{
if(!empty($_GET['update'])) {
if($_GET['update']==1){
	$sql="SELECT *
		  FROM prof
		  WHERE id_prof=:id";
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(":id", $_GET['id_eleve']);
	$stmt->execute();
	$infos=$stmt->fetchAll();
}
}






//Supprimer un prof 
function delete_prof{
if(!empty($_POST['option'])){
if($_POST['option']=="delete"){

	$sql="DELETE FROM prof
		  WHERE prof.id_prof=:id";
		  
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(":id", $_GET['id_prof']);
	$stmt->execute();
	header("Location:list_prof.php");		
}
}

//modification professeur 
function up_prof(){
if(!empty($_GET['update'])) {
if($_GET['update']==1){
	$sql="SELECT *
		  FROM prof
		  WHERE id_prof=:id";
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(":id", $_GET['id_prof']);
	$stmt->execute();
	$infos=$stmt->fetchAll();
}
}

//Supprimer un maitre de stage 
function delete_maitre_stage{
if(!empty($_POST['option'])){
if($_POST['option']=="delete"){

	$sql="DELETE FROM maitre_stage
		  WHERE prof.id_maitre_stage=:id";
		  
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(":id", $_GET['id_maitre_stage']);
	$stmt->execute();
	header("Location:list_maitre_stage.php");		
}
}

//modification maitre stage 
function up_maitre_stage(){
if(!empty($_GET['update'])) {
if($_GET['update']==1){
	$sql="SELECT *
		  FROM maitre_stage
		  WHERE id_maitre_stage=:id";
	$stmt = $dbh->prepare($sql);
	$stmt->bindValue(":id", $_GET['id_maitre_stage']);
	$stmt->execute();
	$infos=$stmt->fetchAll();
}
}

?>
