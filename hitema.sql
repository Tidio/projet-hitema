-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 18 Décembre 2013 à 15:30
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

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
  `telephone_ad` varchar(10) NOT NULL,
  PRIMARY KEY (`id_ad`),
  KEY `id_login` (`id_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id_ad`, `nom_ad`, `prenom_ad`, `fonction`, `id_login`, `telephone_ad`) VALUES
(1, 'Demaret', 'Stephane', 'Developpeur', 3, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `devoir`
--

INSERT INTO `devoir` (`id_devoir`, `nom_dev`, `date_dev`, `coeficient`, `id_matiere`, `id_classe`, `id_prof`) VALUES
(2, 'Pokomon', '2013-12-19', 2, 21, 16, 15);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `eleve`
--

INSERT INTO `eleve` (`id_eleve`, `nomel`, `prenomel`, `date_naissance`, `adresse`, `telephone`, `id_login`) VALUES
(2, 'martin', 'king', '2013-12-16', '10 rue montcul', '', 7),
(3, 'napoleon', 'bonaparte', '2013-12-15', '25 rue cacharel', '', 5),
(4, 'donut', 'simpson', '2013-12-15', '15 rue madrid', '', 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `evaluation`
--

INSERT INTO `evaluation` (`id_eval`, `id_devoir`, `id_eleve`, `note`) VALUES
(2, 2, 2, 0),
(3, 2, 3, 0),
(4, 2, 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_classe`
--

CREATE TABLE IF NOT EXISTS `ligne_classe` (
  `id_classe` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  `promotion` year(4) NOT NULL,
  PRIMARY KEY (`id_classe`,`id_eleve`),
  KEY `id_classe` (`id_classe`),
  KEY `id_eleve` (`id_eleve`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ligne_classe`
--

INSERT INTO `ligne_classe` (`id_classe`, `id_eleve`, `promotion`) VALUES
(16, 2, 2008),
(16, 3, 2008),
(16, 4, 2008);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(20) NOT NULL,
  `passe` varchar(256) NOT NULL,
  `salt` varchar(5) NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `passe` (`passe`),
  KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `login`
--

INSERT INTO `login` (`id`, `pseudo`, `passe`, `salt`, `type`) VALUES
(3, 'admin', 'a0fa5bde79784cc905cf788aa9c363a13eab766425cf2e75d7a8cacd9eb9ba7df41504383ee3a042b52c4a5024ec0c7265091e6835eefe0f22ef1ebf6f723165', 'bonus', 'administrateur'),
(4, 'bataille', '62f2123ce5f46ee6f1ae0fd0388f3394ce76eea1739d26e2c3d170b874aeff76c623f575ef3bfa716d0b85c7226afb3ef1cd1a16d7c721346c93599685ab9b55', 'binot', 'prof'),
(5, 'napoleon', '00317049fbfe624842ecd1181fcb0e99a84acb0093df836c268e70b493251f9019dab17f4daad47a93f06b54dc6480a95159766e55e8d414a6fd2bbabd846fe4', 'coco', 'eleve'),
(6, 'donut', 'f8f50f1d1f3a1e5d7cb182dda130b7783d6584158487f1d4df704be0efaf5ff32b3e4b87eb3c28beaa424f2f66083f3ebc969a2020f6ecb1857108e63969fbfb', 'kiki', 'eleve'),
(7, 'martin', '60b77bf6b549ca26f02c37d804f6a19204dcb01571d9a8d356f632225890dab40f43c18616f88314591b068d63dcb56b1d4e5fbcb91d949d7a6eccfd5e58e34a', 'lolo', 'eleve'),
(8, 'denis', '07353d9733b59fc22b00f74cdd690dc4fda0b07ffa5035aebb04351e13291752078a32d72b04f2d5ffb02eec2c454ec852dd5a123a4362ab4f7e45700d7d459e', 'goule', 'prof'),
(9, 'lucke', '68c2883d1b6bd773bb5b2bcbc76ddc6c971c207f61bd009621b117eace579b5af3be3a2cd03df44fbf37f42de2493f47e054c5949ddc674d2543e05953d76725', 'gudlo', 'prof');

-- --------------------------------------------------------

--
-- Structure de la table `maitre_stage`
--

CREATE TABLE IF NOT EXISTS `maitre_stage` (
  `id_maitre_stage` int(11) NOT NULL AUTO_INCREMENT,
  `nom_maitre_stage` varchar(30) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `id_login` int(11) NOT NULL,
  `prenom_maitre_stage` varchar(32) NOT NULL,
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
  `date_news` datetime NOT NULL,
  `titre_news` varchar(20) NOT NULL,
  `article_news` text NOT NULL,
  PRIMARY KEY (`id_news`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`id_news`, `date_news`, `titre_news`, `article_news`) VALUES
(20, '2013-12-18 12:51:45', 'fvhgfhj', 'ngdhgfghj');

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE IF NOT EXISTS `planning` (
  `id_planning` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `planning`
--

INSERT INTO `planning` (`id_planning`, `id_matiere`, `id_classe`, `id_prof`, `id_section_journee`, `date_planning`, `sujet`, `id_type_cours`, `id_salle`) VALUES
(1, 19, 16, 14, 1, '2013-12-18', 'php', 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `prof`
--

INSERT INTO `prof` (`id_prof`, `nom`, `prenom`, `adresse`, `telephone`, `id_login`) VALUES
(14, 'Bataille', 'Jean', '18 rue Messie', '0645182548', 4),
(15, 'lucke', 'lucky', '10 rue farwest', '', 9),
(16, 'denis', 'saint', '10 rue de la basilique', '', 8);

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

--
-- Contenu de la table `table_matiere`
--

INSERT INTO `table_matiere` (`id_matiere`, `id_prof`, `id_classe`) VALUES
(20, 14, 16),
(21, 15, 16);

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
  ADD CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `presence_ibfk_3` FOREIGN KEY (`id_planning`) REFERENCES `planning` (`id_planning`) ON DELETE CASCADE ON UPDATE CASCADE,
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
