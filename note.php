<?php
session_start();
require_once("db.php");
require_once("gestion_note.php");
$devoir = show_devoir();

if (isset($_POST['supprimer'])) {
	delete_eval($_POST['evaluation']);
}
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
			<form method="POST" action="note.php">
				<select name="evaluation">
					<?php foreach($devoir as $dev) :?>
					<option value="<?php echo $dev['id_devoir']?>"><?php echo $dev['nom_dev']?></option>
					<?php endforeach; ?>
					</select>
				<input type="submit" name="afficher" value="Afficher">
				<input type="submit" name="supprimer" value="Supprimer">
				<a href="form_note.php"><input type="button" name="Creer" value="Créer"></a>
			
			</form>
			<br />
			<form method="POST" action="changer_note.php">
				<table>
					<tr>
						<td>Nom</td>
						<td>Prénom</td>
						<td>Note</td>
					</tr>
					<?php if (!empty($_POST['evaluation'])){
					$listeNote = liste_nom_eval($_POST['evaluation']);
					foreach ($listeNote as $note): ?>
						<tr>
							<td><?php echo $note['nomel'] ?></td>
							<td><?php echo $note['prenomel'] ?></td>
							<td><input type ="number" name="note[]" min="0" max="20" value="<?php echo $note['note'] ?>"></td>
							<input type="hidden" name="eleve[]" value="<?php echo $note['id_eleve']?>">
							<input type="hidden" name="eval" value="<?php echo $note['id_eval'] ?>"
						</tr>
					<?php endforeach; }?>

				</table>
				<?php if (!empty($_POST['evaluation'])): ?>
						<input type="submit" value = "Sauvegarder">
					<?php endif ?>
			</form>
	</div>
</body>
</html>
