<?php
include('db.php');

 if(empty($_GET['title']) | empty($_GET['article'])){
 	
 	if(!empty($_GET['delete'])){

 	$stmt = $dbh->prepare("DELETE FROM news
	  WHERE id_news=:id");
	$stmt->bindValue(":id",$_GET['news']);
	$stmt->execute();
 	}
 	header("Location: index.php");
 }
 else{
 	 
 	if(!empty($_GET['news'])){

 	$stmt = $dbh->prepare("UPDATE news
	  SET titre_news=:title,article_news=:article
	  WHERE id_news = :id");
	$stmt->bindValue(":title",$_GET['title']);
	$stmt->bindValue(":id",$_GET['news']);
	$stmt->bindValue(":article",$_GET['article']);
	$stmt->execute();
	header("Location: index.php");
 	}
 	else{
	$stmt = $dbh->prepare("INSERT INTO news (titre_news,article_news,date_news)
	  VALUES (:title,:article,NOW())");
	$stmt->bindValue(":title",$_GET['title']);
	$stmt->bindValue(":article",$_GET['article']);
	$stmt->execute();
	header("Location: index.php");
		}

 }
