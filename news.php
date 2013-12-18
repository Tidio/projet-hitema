<?php

 		
 		$news=affich_news(); //Extraction des news
				
				foreach($news as $new) //Affiche les news
				{

					echo '<li>'.$new['titre_news'].'</br>'.$new['article_news'].'</br>Paru le&nbsp;:&nbsp;'.$new['date_news'].'</li>';
					if($_SESSION['user_type']=="administrateur"){
						echo '<a href="index.php?index=News&news='.$new['id_news'].'">Modifier</a>&nbsp;';
						echo '&nbsp;<a href="gestion_news.php?news='.$new['id_news'].'&delete=1">Supprimer</a>';
					}
				}
			?>
		<?php if($_SESSION['user_type']=="administrateur"){
		echo '</br></br><a href="index.php?index=News">Ajouter une news</a>';
		}
	  ?>
