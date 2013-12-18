<?php
session_start();

require_once("db.php");
require_once("function_affiche.php");

$profs = show_all_prof();
$matieres = show_all_matiere();
$classes = show_all_classe();
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF8">
	<title>Gestion des notes</title>
</head>

<body>
	<div>
		<form method="POST" action ="devoir.php">
			<p>Nom de l'évaluation</p>
			<input type="text" name="nomEvaluation">
			<br />
			<p>Date de l'évaluation</p>
			<input type="date" name="date">
			<br />
			<p>Coefficient<p>
			<select name="coef">
			<option value=1>1</option>
			<option value=2>2</option>
			<option value=3>3</option>
			<option value=4>4</option>
			</select>
			<br />
			<p>Matière<p>
			<select name="matiere">
				<?php foreach($matieres as $mat) :?>
				<option value="<?php echo $mat['id_matiere']?>"><?php echo $mat['nommat']?></option>
				<?php endforeach; ?>
			</select>
			<br />
			<p>Classe<p>
			<select name="classe">
				<?php foreach($classes as $cla) :?>
				<option value="<?php echo $cla['id_classe']?>"><?php echo $cla['nom']?></option>
				<?php endforeach; ?>
			</select>
			<br />
			<p>Prof</p>
			<select name="prof">
				<?php foreach($profs as $pro) :?>
				<option value="<?php echo $pro['id_prof']?>"><?php echo $pro['nom']?></option>
				<?php endforeach; ?>
			</select>
			<br />
			<input type="submit" name="send" value ="Créer">
		</form>
	</div>
</body>
</html>
