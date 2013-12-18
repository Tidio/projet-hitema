<?php
session_start();
require_once("gestion_note.php");

$listeNote = $_POST['note'];
$listeEleve = $_POST['eleve'];
$eval = $_POST['eval'];

modif_note($listeNote, $listeEleve, $eval);

echo "Votre enregistrement à bien été pris en compte. Redirection dans 5 seconde ...";

?>
