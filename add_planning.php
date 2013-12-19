<form method='POST' action="gestion_planning.php">
<center><b>Classe:</b></br>
<select name="classe">
	<option value="*">*</option>
<?php
	$class=show_classe();

	foreach ($class as $classe) {
		echo"<option value='".$classe['id_classe']."'>".$classe['nom']."</option>";
	}
?>
</select>

</br></br>
<b>Matiere:</b></br>
<select name="matiere">
	<option value="*">*</option>
<?php
	$matieres=show_matiere();

	foreach ($matieres as $matiere) {
		echo"<option value='".$matiere['id_matiere']."'>".$matiere['nom_matiere']."</option>";
	}
?>
</select>
</br></br>
<b>Professeur:</b></br>
<select name="prof">
	<option value="*">*</option>
<?php
	$profs=show_prof();

	foreach ($profs as $prof) {
		echo"<option value='".$prof['id_']."'>".$prof['nom_']."</option>";
	}
?>
</select>
</br></br>
<b>Journée:</b></br>
<select name="journee">
	<option value="*">*</option>
<?php
	$jours=show_journee();

	foreach ($jours as $jour) {
		echo"<option value='".$jour['id_demi_journee']."'>".$jour['libelle']."</option>";
	}
?>
</select>
</br></br>
<b>Salle:</b></br>
<select name="salle">
	<option value="*">*</option>
<?php
	$salles=show_salle();

	foreach ($salles as $salle) {
		echo"<option value='".$salle['id_salle']."'>".$salle['nom_salle']."</option>";
	}
?>
</select>
</br></br>
<b>Type de cours:</b></br>
<select name="type">
	<option value="*">*</option>
<?php
	$types=show_type();

	foreach ($types as $type) {
		echo"<option value='".$type['id_type']."'>".$type['nom_type']."</option>";
	}
?>
</select>
</br></br>
<b>Date:</b></br>
<input type="date" name="date" >
</br>
<b>Sujet:</b></br>
<input type="date" name="sujet" ></br></br>
<input type="submit" value="Afficher">
