-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 26 nov. 2022 à 13:21
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `nom` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `dateAjout` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`nom`, `type`, `idCategorie`, `dateAjout`) VALUES
('voyage', 'loisir', 9, '2022-03-08 16:22:56');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `idPersonneClient` int(11) NOT NULL,
  `societe` varchar(50) NOT NULL,
  `poste` varchar(50) NOT NULL,
  `dateAjout` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `idPersonneClient`, `societe`, `poste`, `dateAjout`) VALUES
(6, 26, 'client1 society', 'grand groupe', '2022-03-08 16:22:26');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `idPersonne` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `age` int(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `numeroTelephone` varchar(30) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `codePostale` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ajoutDate` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`idPersonne`, `nom`, `prenom`, `age`, `ville`, `numeroTelephone`, `adresse`, `codePostale`, `email`, `ajoutDate`, `image`) VALUES
(25, 'moi nom', 'moi prenom', 20, 'uuuu', '1235678', 'uuu', '9215', 'moi@gmail.com', '2022-03-08 16:18:11', 'cropped-avatar-gratuit.png'),
(26, 'client', 'client1', 20, 'Antony', '12467', 'adresse', '92160', 'client1@gmail.com', '2022-03-08 16:20:03', 'OIP.smmHdS__IlIrbDbN4pUYxwAAAA.jpg'),
(27, 'test10', 'test10', 30, '22', '3333', '22', '92160', 'test10@gmail.com', '2022-03-11 16:30:19', NULL),
(28, 'clotilde', 'kriss', 32, 'hvk', '11133455', '2 jjj', 'jv', 'kriss.clotilde@gmail.com', '2022-11-26 11:02:48', NULL),
(29, 'tototiti', 'titi', 21, 'ss', '1111', 'sss', '21111', 'ti@gmail.com', '2022-11-26 13:08:22', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idProduit` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `Prix` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `dateProduit` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `idCategorie`, `Prix`, `stock`, `nom`, `dateProduit`) VALUES
(14, 9, 1200, 200, 'voyage à la reunion', '2022-03-08 16:23:27'),
(15, 9, 1300, 3, 'voyage france', '2022-11-26 13:04:55'),
(16, 9, 1300, 3, 'voyage france', '2022-11-26 13:05:00'),
(17, 9, 1300, 3, 'voyage france', '2022-11-26 13:05:00'),
(18, 9, 1300, 3, 'voyage france', '2022-11-26 13:05:00'),
(19, 9, 1300, 3, 'voyage france', '2022-11-26 13:05:01'),
(20, 9, 1300, 3, 'voyage france', '2022-11-26 13:05:10'),
(21, 9, 1300, 12, 'voyage france', '2022-11-26 13:06:34');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `idPersonneUser` int(11) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `ajoutDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `idPersonneUser`, `motDePasse`, `ajoutDate`) VALUES
(4, 25, '$2a$10$vO1pMowo6JhjyPfZ0PDXROAL9zqLW/dFHkFixJJMlEqKySufZppEe', '2022-03-08 16:15:45'),
(5, 27, '$2a$10$PuAK0iOLq1IwuwIqfNT0Fut/LNY7hzOhpdx6Jj7AahEuJ0HLjWKna', '2022-03-11 16:30:21'),
(6, 28, '$2a$10$wMgBQN2v.9fszegRgb8Pl.dy0xhYnkbdGemt2Sl6V/J/yFbB9HWY2', '2022-11-26 11:02:49');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `idvente` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `PrixTotal` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `taxe` double NOT NULL,
  `dateVente` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`idvente`, `idClient`, `idProduit`, `quantite`, `PrixTotal`, `idUser`, `taxe`, `dateVente`) VALUES
(39, 6, 14, 1, 1200, 4, 20, '2022-03-08 16:53:24');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `foreign_key_client` (`idPersonneClient`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`idPersonne`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`),
  ADD KEY `foreign_key_Produit` (`idCategorie`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `foreign_key` (`idPersonneUser`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`idvente`),
  ADD KEY `fk_vente_client` (`idClient`),
  ADD KEY `fk_vente_produit` (`idProduit`),
  ADD KEY `fk_vente_user` (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `idPersonne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `vente`
--
ALTER TABLE `vente`
  MODIFY `idvente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `foreign_key_client` FOREIGN KEY (`idPersonneClient`) REFERENCES `personne` (`idPersonne`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `foreign_key_Produit` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `foreign_key` FOREIGN KEY (`idPersonneUser`) REFERENCES `personne` (`idPersonne`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `fk_vente_client` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `fk_vente_produit` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`),
  ADD CONSTRAINT `fk_vente_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
