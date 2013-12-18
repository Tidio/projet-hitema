<?php
session_start();
require_once("gestion_note.php");

$newEval = array();
$newEval[] = $_POST['nomEvaluation'];
$newEval[] = $_POST['date'];
$newEval[] = $_POST['coef'];
$newEval[] = $_POST['matiere'];
$newEval[] = $_POST['classe'];
$newEval[] = $_POST['prof'];

creerEval($newEval);

echo "Votre enregistrement à bien été pris en compte. Redirection dans 5 seconde ...";


?>
