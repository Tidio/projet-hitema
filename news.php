<?php
include('function.php');
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>Adminstration-</title>
	<meta name="description" content="<?php echo $meta_description; ?>">
<!-- 
	 <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	 <link href="css/style.css" type="text/css" rel="stylesheet" />
-->
</head>

<body>

	<div class="container">
		<div class="row">
			<h1>Archi ! | <?php echo $page_title; ?></h1>
			<table>
			<?php
			affich_news();
				foreach($news as $new)
				{

					echo '<tr><li>'.$new['libelle'].'</br>'.$new['content'].'</br>Paru le:'.$new['created_date'].'</li></tr>';
				}
			?>
		</table>
		</div>
	</div>
		<?php
		// Test si Session admin activé
		if($_SESSION['user_type']=="admin"){
		echo '<a href="add_news.php">Ajouter une news</a>';
		}
		?>

</body>
</html>

