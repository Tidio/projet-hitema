<?php
session_start();
require_once('function.php');
$error = array();
$_SESSION['error']='';


if (empty($error)) {

	$veriflog = veriflog($_GET['login'],$_GET['mdp']); //////// on recupere le type d'utilisateur et son id de login

	if(empty($veriflog)){ /////////// on verifie si la variable n'est pas vide 
		$error[]="Le login ou/et le mot de passe est incorrecte";
		$_SESSION['error']=$error;
		header('Location: index.php');
	}
	else{
		foreach ($veriflog as $verif) { 
			$_SESSION['user_type']=$verif['type']; /////// on met en session le type d'utilisateur 
			$id_log=$verif['id'];                  
		}
		
		switch ($_SESSION['user_type']) {   ////////  on verifie le type d'user
	    	case "eleve":
	        	$type="eleve";
	        	$recup_info=recupid($id_log,$type);  /////// recuper les information de l'éleve 
	        break;		

	    	case "prof":
	    		$type="prof";
	        	$recup_info=recupid($id_log,$type); /////// recuper les information du prof 
	        break;

	    	case "admin":
	        	$type="admin";
	        	$recup_info=recupid($id_log,$type);/////// recuper les information de l'admin
	        break;
	        		
	        case "maitre_stage":
	        	$type="maitre_stage";
	        	$recup_info=recupid($id_log,$type);/////// recuper les information du maitre de stage 	        						
		}

		extract_info_user($recup_info);
		///////// on envoie en session les informations de l'user (array)
		header("Location: index.php");
	}


}




?>
