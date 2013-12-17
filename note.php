<?php
session_start();
require_once("db.php");
require_once("gestion_note.php");
$evaluations = show_eval();
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF8">
	<title>Gestion des notes</title>
</head>

<body>
	<div>
		<p>Evaluation: <p>
		<select name="evaluation">
			<?php foreach($evaluations as $eva) :?>
			<option value="<?php echo $eva['id_matiere']?>"><?php echo $eva['nommat']?></option>
			<?php endforeach; ?>
		</select>
		<a href="form_note.php"><input type="button" name="Creer" value="Créer"></a>
		<br />
		<table>
			<tr>
				<td>Nom</td>
				<td>Prénom</td>
				<td>Note</td>
			</tr>
			<?php if (!empty($_POST['evaluation'])){
			$listeNom = liste_nom_eval($_POST['evaluation']);
			foreach ($listeNote as $note): ?>
				<tr>
					<td><?php echo $note['nomel'] ?></td>
					<td><?php echo $note['prenomel'] ?></td>
					<td><?php echo $note['note'] ?></td>
				</tr>
			<?php endforeach; }?>
	</div>
</body>
</html>
