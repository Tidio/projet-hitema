-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 17 Décembre 2013 à 14:23
-- Version du serveur: 5.5.20-log
-- Version de PHP: 5.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `hitema`
--
CREATE DATABASE IF NOT EXISTS `hitema` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hitema`;

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_ad` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ad` varchar(20) NOT NULL,
  `prenom_ad` varchar(20) NOT NULL,
  `fonction` varchar(20) NOT NULL,
  `id_login` int(11) NOT NULL,
  PRIMARY KEY (`id_ad`),
  KEY `id_login` (`id_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_classe`),
  KEY `id_classe` (`id_classe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=21 ;

--
-- Contenu de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `nom`) VALUES
(16, 'BTS1'),
(17, 'BTS2'),
(18, 'L3 Dev'),
(19, 'L3 Res'),
(20, 'M1');

-- --------------------------------------------------------

--
-- Structure de la table `devoir`
--

CREATE TABLE IF NOT EXISTS `devoir` (
  `id_devoir` int(11) NOT NULL AUTO_INCREMENT,
  `nom_dev` varchar(20) NOT NULL,
  `date_dev` date NOT NULL,
  `coeficient` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  PRIMARY KEY (`id_devoir`),
  KEY `id_matiere` (`id_matiere`),
  KEY `id_classe` (`id_classe`),
  KEY `id_prof` (`id_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE IF NOT EXISTS `eleve` (
  `id_eleve` int(11) NOT NULL AUTO_INCREMENT,
  `nomel` varchar(20) NOT NULL,
  `prenomel` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `id_login` int(11) NOT NULL,
  PRIMARY KEY (`id_eleve`),
  KEY `id_login` (`id_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE IF NOT EXISTS `entreprise` (
  `id_entreprise` int(11) NOT NULL AUTO_INCREMENT,
  `nom_entreprise` varchar(20) NOT NULL,
  `adresse` varchar(40) NOT NULL,
  `ville` varchar(15) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  PRIMARY KEY (`id_entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
  `id_eval` int(11) NOT NULL AUTO_INCREMENT,
  `id_devoir` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `note` float NOT NULL,
  PRIMARY KEY (`id_eval`),
  KEY `id_devoir` (`id_devoir`),
  KEY `id_eleve` (`id_eleve`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ligne_classe`
--

CREATE TABLE IF NOT EXISTS `ligne_classe` (
  `id_classe` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `promotion` date NOT NULL,
  PRIMARY KEY (`id_classe`,`id_eleve`),
  KEY `id_classe` (`id_classe`),
  KEY `id_eleve` (`id_eleve`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(20) NOT NULL,
  `passe` varchar(256) NOT NULL,
  `salt` varchar(5) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `passe` (`passe`),
  KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `login`
--

INSERT INTO `login` (`id`, `pseudo`, `passe`, `salt`, `type`) VALUES
(3, 'admin', 'admin', '', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `maitre_stage`
--

CREATE TABLE IF NOT EXISTS `maitre_stage` (
  `id_maitre_stage` int(11) NOT NULL AUTO_INCREMENT,
  `nom_maitre_stage` varchar(30) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `id_login` int(11) NOT NULL,
  PRIMARY KEY (`id_maitre_stage`),
  KEY `id_login` (`id_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `id_matiere` int(11) NOT NULL AUTO_INCREMENT,
  `nommat` varchar(20) NOT NULL,
  PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `nommat`) VALUES
(19, 'Anglais'),
(20, 'Communication'),
(21, 'PHP'),
(22, 'Javascript'),
(23, 'Java');

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id_news` int(11) NOT NULL AUTO_INCREMENT,
  `date_news` date NOT NULL,
  `titre_news` varchar(20) NOT NULL,
  `article_news` text NOT NULL,
  PRIMARY KEY (`id_news`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE IF NOT EXISTS `planning` (
  `id_planning` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_section_journee` int(11) NOT NULL,
  `date_planning` date NOT NULL,
  `sujet` varchar(30) NOT NULL,
  `id_type_cours` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  PRIMARY KEY (`id_planning`),
  KEY `id_matiere` (`id_matiere`),
  KEY `id_classe` (`id_classe`),
  KEY `id_prof` (`id_prof`),
  KEY `id_section_journee` (`id_section_journee`),
  KEY `id_type_cours` (`id_type_cours`),
  KEY `id_classe_2` (`id_classe`),
  KEY `id_salle` (`id_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `presence`
--

CREATE TABLE IF NOT EXISTS `presence` (
  `id_presence` int(11) NOT NULL AUTO_INCREMENT,
  `id_eleve` int(11) NOT NULL,
  `present` tinyint(1) NOT NULL,
  `id_planning` int(11) NOT NULL,
  PRIMARY KEY (`id_presence`),
  KEY `id_planning` (`id_planning`),
  KEY `id_eleve` (`id_eleve`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

CREATE TABLE IF NOT EXISTS `prof` (
  `id_prof` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `id_login` int(11) NOT NULL,
  PRIMARY KEY (`id_prof`),
  KEY `id_login` (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int(11) NOT NULL AUTO_INCREMENT,
  `nom_salle` varchar(15) NOT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom_salle`) VALUES
(1, 'trinity'),
(2, 'vador'),
(3, 'morpheus'),
(4, 'serpentard');

-- --------------------------------------------------------

--
-- Structure de la table `section_journee`
--

CREATE TABLE IF NOT EXISTS `section_journee` (
  `id_section_journee` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) NOT NULL,
  PRIMARY KEY (`id_section_journee`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `section_journee`
--

INSERT INTO `section_journee` (`id_section_journee`, `libelle`) VALUES
(1, 'matin'),
(2, 'apres-midi');

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
  `id_entreprise` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `id_maitre_stage` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `id_type_contrat` int(11) NOT NULL,
  PRIMARY KEY (`id_entreprise`),
  KEY `numel1` (`id_maitre_stage`),
  KEY `id_entreprise` (`id_entreprise`),
  KEY `id_eleve` (`id_eleve`),
  KEY `id_matiere` (`id_maitre_stage`),
  KEY `id_type_contrat` (`id_type_contrat`),
  KEY `id_entreprise_2` (`id_entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `table_matiere`
--

CREATE TABLE IF NOT EXISTS `table_matiere` (
  `id_matiere` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  PRIMARY KEY (`id_matiere`,`id_prof`,`id_classe`),
  KEY `id_prof` (`id_prof`),
  KEY `id_classe` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_contrat`
--

CREATE TABLE IF NOT EXISTS `type_contrat` (
  `id_type_contrat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_contat` varchar(20) NOT NULL,
  PRIMARY KEY (`id_type_contrat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `type_contrat`
--

INSERT INTO `type_contrat` (`id_type_contrat`, `nom_contat`) VALUES
(1, 'apprentissage'),
(2, 'professionnalisation');

-- --------------------------------------------------------

--
-- Structure de la table `type_cours`
--

CREATE TABLE IF NOT EXISTS `type_cours` (
  `id_type_cours` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  PRIMARY KEY (`id_type_cours`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `type_cours`
--

INSERT INTO `type_cours` (`id_type_cours`, `nom`) VALUES
(1, 'cours'),
(2, 'evaluation');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `administrateur_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `devoir`
--
ALTER TABLE `devoir`
  ADD CONSTRAINT `devoir_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `ligne_classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `devoir_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `devoir_ibfk_3` FOREIGN KEY (`id_prof`) REFERENCES `prof` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `eleve` (`id_eleve`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`id_eleve`) REFERENCES `ligne_classe` (`id_eleve`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`id_devoir`) REFERENCES `devoir` (`id_devoir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ligne_classe`
--
ALTER TABLE `ligne_classe`
  ADD CONSTRAINT `id_classe` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_eleve` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `maitre_stage`
--
ALTER TABLE `maitre_stage`
  ADD CONSTRAINT `maitre_stage_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `fk_cours` FOREIGN KEY (`id_type_cours`) REFERENCES `type_cours` (`id_type_cours`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prof` FOREIGN KEY (`id_prof`) REFERENCES `prof` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_section` FOREIGN KEY (`id_section_journee`) REFERENCES `section_journee` (`id_section_journee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planning_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planning_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `planning_ibfk_3` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `presence`
--
ALTER TABLE `presence`
  ADD CONSTRAINT `presence_ibfk_1` FOREIGN KEY (`id_planning`) REFERENCES `planning` (`id_planning`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `presence_ibfk_2` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `prof`
--
ALTER TABLE `prof`
  ADD CONSTRAINT `prof_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `fk_eleve` FOREIGN KEY (`id_eleve`) REFERENCES `ligne_classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contrat` FOREIGN KEY (`id_type_contrat`) REFERENCES `type_contrat` (`id_type_contrat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_entreprise` FOREIGN KEY (`id_entreprise`) REFERENCES `entreprise` (`id_entreprise`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stage_ibfk_1` FOREIGN KEY (`id_maitre_stage`) REFERENCES `maitre_stage` (`id_maitre_stage`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `table_matiere`
--
ALTER TABLE `table_matiere`
  ADD CONSTRAINT `table_matiere_ibfk_1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `table_matiere_ibfk_2` FOREIGN KEY (`id_prof`) REFERENCES `prof` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `table_matiere_ibfk_3` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
