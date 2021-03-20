-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 20 Mar 2021, 14:50
-- Wersja serwera: 10.4.14-MariaDB-1:10.4.14+maria~focal-log
-- Wersja PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `main`
--
CREATE DATABASE IF NOT EXISTS `main` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `main`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Ads`
--

CREATE TABLE `Ads` (
  `id_ad` int(11) NOT NULL,
  `id_owner` int(11) NOT NULL,
  `category` text DEFAULT NULL,
  `subcategory` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `user_name` text DEFAULT NULL,
  `user_phone` text DEFAULT NULL,
  `user_email` text DEFAULT NULL,
  `user_location` point DEFAULT NULL,
  `photo1` text DEFAULT NULL,
  `photo2` text DEFAULT NULL,
  `photo3` text DEFAULT NULL,
  `photo4` text DEFAULT NULL,
  `photo5` text DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `visit_counter` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Message`
--

CREATE TABLE `Message` (
  `id_message` int(11) NOT NULL,
  `id_user_sender` int(11) NOT NULL,
  `id_user_recipient` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `read_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Opinions`
--

CREATE TABLE `Opinions` (
  `id_opinion` int(11) NOT NULL,
  `id_ad` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_opinion` datetime NOT NULL DEFAULT current_timestamp(),
  `content` text DEFAULT NULL,
  `it_positive` tinyint(1) DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

CREATE TABLE `Users` (
  `id_user` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `username` text NOT NULL,
  `phone` text DEFAULT NULL,
  `location` point DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Watched`
--

CREATE TABLE `Watched` (
  `id_watched` int(11) NOT NULL,
  `id_user_watched` int(11) NOT NULL,
  `id_ad_watched` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Ads`
--
ALTER TABLE `Ads`
  ADD PRIMARY KEY (`id_ad`),
  ADD KEY `id_owner` (`id_owner`);

--
-- Indeksy dla tabeli `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `id_user_sender` (`id_user_sender`),
  ADD KEY `id_user_recipient` (`id_user_recipient`);

--
-- Indeksy dla tabeli `Opinions`
--
ALTER TABLE `Opinions`
  ADD PRIMARY KEY (`id_opinion`),
  ADD KEY `id_ad` (`id_ad`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeksy dla tabeli `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeksy dla tabeli `Watched`
--
ALTER TABLE `Watched`
  ADD PRIMARY KEY (`id_watched`),
  ADD KEY `id_ad_watched` (`id_ad_watched`),
  ADD KEY `id_user_watched` (`id_user_watched`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `Ads`
--
ALTER TABLE `Ads`
  MODIFY `id_ad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Message`
--
ALTER TABLE `Message`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Opinions`
--
ALTER TABLE `Opinions`
  MODIFY `id_opinion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Users`
--
ALTER TABLE `Users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Watched`
--
ALTER TABLE `Watched`
  MODIFY `id_watched` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `Ads`
--
ALTER TABLE `Ads`
  ADD CONSTRAINT `Ads_ibfk_1` FOREIGN KEY (`id_owner`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Message`
--
ALTER TABLE `Message`
  ADD CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`id_user_sender`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Message_ibfk_2` FOREIGN KEY (`id_user_recipient`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Opinions`
--
ALTER TABLE `Opinions`
  ADD CONSTRAINT `Opinions_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Opinions_ibfk_2` FOREIGN KEY (`id_ad`) REFERENCES `Ads` (`id_ad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `Watched`
--
ALTER TABLE `Watched`
  ADD CONSTRAINT `Watched_ibfk_1` FOREIGN KEY (`id_ad_watched`) REFERENCES `Ads` (`id_ad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Watched_ibfk_2` FOREIGN KEY (`id_user_watched`) REFERENCES `Users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
