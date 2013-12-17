<?php
if (empty($_GET['index'])) {
 		
 		$news=affich_news(); //Extraction des news
				
				foreach($news as $new) //Affiche les news
				{

					echo '<li>'.$new['titre_news'].'</br>'.$new['article_news'].'</br>Paru le&nbsp;:&nbsp;'.$new['date_news'].'</li>';
				}
			?>
		</table>
		</div>
		<?php if(!empty($_SESSION['user_type'])){
		echo '<a href="add_news.php">Ajouter une news</a>';
		}
	  } ?>
