<?php 
session_start();
require_once('function.php');
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>Administration | Accueil</title>
	<!--<meta name="description" content="<?php echo $meta_description; ?>"> -->
	<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<link href="css/style.css" type="text/css" rel="stylesheet" />
</head>

<body>

	<div class="container">
		<div class="row">
			<h2><?php if (empty($_SESSION['id'])){echo"Bienvenue à l'administration d'Hitema";}else{echo"Bonjour,".$_SESSION['nom'];}?></h2>
			<nav>

				<?php
				//Verifie si un utilisateur est connecté
				if (!empty($_SESSION['id'])): ?>

				<ul class="nav nav-pills">
					<li><a href="index.php" >Acceuil</a></li>
					<li><a href="index.php?index=Planning" >Planning</a></li>
					<li><a href="index.php?index=Presence" >Présence</a></li>
					<li><a href="index.php?index=Note" >Note</a></li>
					<li><a href="index.php?index=Gestion" >Gestion</a></li>
					<li><a href="deco.php" class='deco'>Deconnexion</a></li>
				</ul>
			</nav>
		</div>
		<div class="row">
		</div>
	</div>
	<div class="container">
		<div class="row">
			<h1><?php if (empty($_GET['index'])){echo 'News';}else{echo $_GET['index'];} ?></h1>
			<table>
			
			<?php
			if (empty($_GET['index'])) {
				require("news.php");
			}
			else{
				if ($_GET['index']=='Planning') {
				require("planning.php");}
				if ($_GET['index']=='Presence') {
				require("presence.php");}
				if ($_GET['index']=='Note') {
				require("note.php");}
				if ($_GET['index']=='Gestion') {
				require("gestion.php");}
				if ($_GET['index']=='News') {
				require("add_news.php");}
			}
			?>
		</table>
			
		</div>
	</div>

<?php endif; ?>
	
		<?php if (!empty($_SESSION['error'])) : ?>
		<div id="error" >
			<?php foreach ($_SESSION['error'] as $error): ?>
				

				<p><?php echo $error; ?> </p>


			<?php endforeach; ?>

		</div>
		<?php endif; ?>
	<?php if (empty($_SESSION['id'])): //Verifie si un utilisateur est connecter ?>
		
			<form type='POST' class='login' action='connexion.php'>
			 <center>
			 <b>Login </b></br><input type='text' name='login' required></br></br>
			 <b>Mot de Passe </b></br><input name='mdp' type='password' required></br></br>
			 <input type='submit' value='Connexion'>
			 </form>
	<?php endif;//Affichage de l'interface de connexion?>

</body>
</html>
