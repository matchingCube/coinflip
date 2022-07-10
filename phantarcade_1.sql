-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2022 at 06:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phantarcade`
--

-- --------------------------------------------------------

--
-- Table structure for table `blackjack`
--

CREATE TABLE `blackjack` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `cardDeck` varchar(1024) NOT NULL,
  `userHits` int(11) NOT NULL DEFAULT 0,
  `userStand` int(11) NOT NULL,
  `userStand2` int(11) NOT NULL DEFAULT 0,
  `userSplit` tinyint(1) NOT NULL DEFAULT 0,
  `bet` float NOT NULL,
  `bet2` float DEFAULT NULL,
  `insurance` tinyint(1) NOT NULL DEFAULT 0,
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `endDatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crashgame`
--

CREATE TABLE `crashgame` (
  `id` int(11) NOT NULL,
  `result` float DEFAULT NULL,
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp(),
  `endDatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crashgamebets`
--

CREATE TABLE `crashgamebets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `gameId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `multiplier` float NOT NULL,
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `freecredittransactions`
--

CREATE TABLE `freecredittransactions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `value` float NOT NULL,
  `information` text NOT NULL,
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nftpayouts`
--

CREATE TABLE `nftpayouts` (
  `id` int(11) NOT NULL,
  `nftId` int(11) NOT NULL,
  `payoutToUserId` int(11) NOT NULL,
  `payoutDate` datetime DEFAULT NULL,
  `error` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nfts`
--

CREATE TABLE `nfts` (
  `id` int(11) NOT NULL,
  `address` varchar(1024) NOT NULL,
  `imageURL` varchar(2056) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `price` float NOT NULL,
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nftssolcity`
--

CREATE TABLE `nftssolcity` (
  `id` int(11) NOT NULL,
  `address` varchar(1024) NOT NULL,
  `imageURL` varchar(2056) DEFAULT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `price` float NOT NULL,
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paymentsreceived`
--

CREATE TABLE `paymentsreceived` (
  `id` int(11) NOT NULL,
  `txHash` varchar(1024) NOT NULL,
  `vaultWalletId` int(11) NOT NULL,
  `amount` float NOT NULL,
  `tokenId` int(11) NOT NULL,
  `transactionId` int(11) DEFAULT NULL,
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roulette`
--

CREATE TABLE `roulette` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  `bets` varchar(2056) NOT NULL DEFAULT '[]',
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tokenpayouts`
--

CREATE TABLE `tokenpayouts` (
  `id` int(11) NOT NULL,
  `payoutToUserId` int(11) NOT NULL,
  `amount` float NOT NULL,
  `tokenId` int(11) NOT NULL,
  `payoutDate` datetime DEFAULT NULL,
  `error` varchar(2056) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `tokenAddress` varchar(1024) NOT NULL,
  `decimals` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `symbol` varchar(256) NOT NULL,
  `icon` varchar(1024) NOT NULL,
  `coinWorth` float NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `value` float NOT NULL,
  `information` text NOT NULL,
  `createDatetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `publicKey` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `refCode` varchar(1024) DEFAULT NULL,
  `createDatetime` datetime NOT NULL,
  `achievementDeposit` tinyint(1) NOT NULL DEFAULT 0,
  `achievementPlayGames` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `publicKey` varchar(1024) NOT NULL,
  `walletTypeId` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wallettypes`
--

CREATE TABLE `wallettypes` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blackjack`
--
ALTER TABLE `blackjack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `crashgame`
--
ALTER TABLE `crashgame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crashgamebets`
--
ALTER TABLE `crashgamebets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nftpayouts`
--
ALTER TABLE `nftpayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payoutToUserId` (`payoutToUserId`),
  ADD KEY `nftId` (`nftId`);

--
-- Indexes for table `nfts`
--
ALTER TABLE `nfts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymentsreceived`
--
ALTER TABLE `paymentsreceived`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tokenId` (`tokenId`),
  ADD KEY `fromWalletId` (`vaultWalletId`),
  ADD KEY `transactionId` (`transactionId`);

--
-- Indexes for table `roulette`
--
ALTER TABLE `roulette`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokenpayouts`
--
ALTER TABLE `tokenpayouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `walletTypeId` (`walletTypeId`);

--
-- Indexes for table `wallettypes`
--
ALTER TABLE `wallettypes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blackjack`
--
ALTER TABLE `blackjack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crashgame`
--
ALTER TABLE `crashgame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crashgamebets`
--
ALTER TABLE `crashgamebets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nftpayouts`
--
ALTER TABLE `nftpayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nfts`
--
ALTER TABLE `nfts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentsreceived`
--
ALTER TABLE `paymentsreceived`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roulette`
--
ALTER TABLE `roulette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokenpayouts`
--
ALTER TABLE `tokenpayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallettypes`
--
ALTER TABLE `wallettypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blackjack`
--
ALTER TABLE `blackjack`
  ADD CONSTRAINT `blackjack_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `nftpayouts`
--
ALTER TABLE `nftpayouts`
  ADD CONSTRAINT `nftpayouts_ibfk_1` FOREIGN KEY (`payoutToUserId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `nftpayouts_ibfk_2` FOREIGN KEY (`nftId`) REFERENCES `nfts` (`id`);

--
-- Constraints for table `paymentsreceived`
--
ALTER TABLE `paymentsreceived`
  ADD CONSTRAINT `paymentsreceived_ibfk_1` FOREIGN KEY (`tokenId`) REFERENCES `tokens` (`id`),
  ADD CONSTRAINT `paymentsreceived_ibfk_2` FOREIGN KEY (`vaultWalletId`) REFERENCES `wallets` (`id`),
  ADD CONSTRAINT `paymentsreceived_ibfk_3` FOREIGN KEY (`transactionId`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`walletTypeId`) REFERENCES `wallettypes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
