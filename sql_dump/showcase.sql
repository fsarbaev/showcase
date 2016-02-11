-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Хост: localhost:8889
-- Время создания: Фев 11 2016 г., 12:35
-- Версия сервера: 5.5.42
-- Версия PHP: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `showcase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `url`) VALUES
(2, 'Action', '/showcase/c_action'),
(3, 'Strategy', '/showcase/c_strategy'),
(4, 'RPG', '/showcase/c_rpg'),
(5, 'Fighting', '/showcase/c_fighting');

-- --------------------------------------------------------

--
-- Структура таблицы `in_category`
--

CREATE TABLE `in_category` (
  `id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `in_category`
--

INSERT INTO `in_category` (`id`, `c_id`, `p_id`) VALUES
(0, 2, 2),
(1, 2, 3),
(3, 4, 1),
(4, 3, 4),
(5, 3, 5),
(6, 5, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `c_id`, `name`, `price`, `url`, `image`) VALUES
(1, 4, 'Fallout 4', 150, '/showcase/fallout4', 'http://igri-2012.ru/uploads/posts/2015-12/1449868259_fallout-4.jpg'),
(2, 2, 'Black Ops 3', 139, '/showcase/blackops3', 'http://igri-2012.ru/uploads/posts/2015-12/1449868499_call-of-duty-black-ops-3.jpg'),
(3, 2, 'Assasin''s creed', 200, '/showcase/assasincreed', 'http://igri-2012.ru/uploads/posts/2015-12/1449867875_assassins-creed-syndicate.jpg'),
(4, 3, 'Anno', 99, '/showcase/anno', 'http://igri-2012.ru/uploads/posts/2015-12/1449866638_anno.jpg'),
(5, 3, 'Starcraft II', 200, '/showcase/starcraftII', 'http://igri-2012.ru/uploads/posts/2015-12/1449865846_starcraft-2-legacy-of-the-void.jpg'),
(6, 5, 'Zombie Viking', 89, '/showcase/zombie_viking', 'http://igri-2012.ru/uploads/posts/2015-12/1449862767_zombie-vikings.jpg'),
(7, 2, 'The park', 100, '/showcase/the_park', 'http://igri-2012.ru/uploads/posts/2015-11/1446484852_the-park.jpg'),
(8, 2, 'Warhammer', 190, '/showcase/warhammer', 'http://igri-2012.ru/uploads/posts/2015-11/1446482758_warhammer-end-times-vermintide.jpg'),
(9, 2, 'Sky Hill', 167, '/showcase/sky_hill', 'http://igri-2012.ru/uploads/posts/2015-11/1446487480_skyhill.jpg'),
(10, 2, 'Fallen', 189, '/showcase/fallen', 'http://igri-2012.ru/uploads/posts/2015-11/1446487155_fallen-a2p-protocol.jpg'),
(11, 2, 'Statues', 99, '/showcase/statues', 'http://igri-2012.ru/uploads/posts/2015-11/1446484371_statues.jpg'),
(12, 2, 'Mad Max', 178, '/showcase/mad_max', 'http://igri-2012.ru/uploads/posts/2015-09/1443475435_mad-max.jpg'),
(13, 2, 'Crookz', 78, '/showcase/crookz', 'http://igri-2012.ru/uploads/posts/2015-09/1443480946_crookz-the-big-heist.jpg'),
(14, 2, 'Gridberd', 67, '/showcase/gridberd', 'http://igri-2012.ru/uploads/posts/2015-09/1443480369_gridberd.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `in_category`
--
ALTER TABLE `in_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `c_id` (`c_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id` (`c_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `in_category`
--
ALTER TABLE `in_category`
  ADD CONSTRAINT `in_category_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `in_category_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
