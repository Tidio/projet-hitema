<?php
if(!empty($_GET['news'])){
$news=modif_news($_GET['news']);
var_dump($news);
}
?>
<form type="POST"  action="gestion_news.php">
	<center>
	<b>Titre News</b></br>
		<input type="text" name="title" value="<?php if(!empty($_GET['news'])){echo $news[0]['titre_news'];} ?>" required></br>
	<b>Article</b></br><textarea cols="50" rows="8 " name="article"  required><?php if(!empty($_GET['news'])){echo $news[0]['article_news'];} ?></textarea></br></br>
		<input type="hidden" name="news" value ="<?php if(!empty($_GET['news'])){echo $_GET['news'];}?>">
	<input type="submit" Value="<?php if(empty($_GET['news'])){ echo 'Enregistrer';}else{echo'Modifier';} ?>">
</form>
