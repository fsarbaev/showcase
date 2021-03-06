-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Хост: localhost:8889
-- Время создания: Фев 17 2016 г., 01:14
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
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `url`, `parent_id`) VALUES
(2, 'Action', './action', NULL),
(3, 'Strategy', './strategy', NULL),
(4, 'RPG', './rpg', NULL),
(5, 'Fighting', './fighting', NULL),
(8, 'Horror', './horror', 2);

--
-- Триггеры `category`
--
DELIMITER $$
CREATE TRIGGER `before_insert_check` BEFORE INSERT ON `category`
 FOR EACH ROW BEGIN
IF EXISTS ( SELECT * FROM category c WHERE c.id = NEW.parent_id AND c.parent_id IS NOT NULL ) THEN
SET NEW.parent_id = NULL;
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_check` BEFORE UPDATE ON `category`
 FOR EACH ROW BEGIN
IF EXISTS ( SELECT * FROM category c WHERE c.id = NEW.parent_id AND c.parent_id IS NOT NULL ) THEN
SET NEW.parent_id = NULL;

END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `incategory`
--

CREATE TABLE `incategory` (
  `id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `incategory`
--

INSERT INTO `incategory` (`id`, `c_id`, `p_id`) VALUES
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
(14, 2, 14),
(16, 8, 4),
(17, 8, 2);

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
  `image` varchar(255) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `c_id`, `name`, `price`, `url`, `image`, `description`) VALUES
(1, 4, 'Fallout 4', 150, './fallout4', './images/games/1449868259_fallout-4.jpg', 'Bethesda Game Studios, создатель популярнейших игр Fallout 3 и The Elder Scrolls V: Skyrim, приглашает вас в мир Fallout 4 – своей самой грандиозной игры нового поколения с открытым миром. Вы – единственный выживший из убежища 111, оказавшийся в мире, разрушенном ядерной войной. Каждый миг вы сражаетесь за выживание, каждое решение может стать последним. Но именно от вас зависит судьба пустошей. Добро пожаловать домой.'),
(2, 2, 'Black Ops 3', 139, './blackops3', './images/games/1449868499_call-of-duty-black-ops-3.jpg', 'Call of Duty: Black Ops III объединяет 3 режима: кампанию, сетевую игру и «Зомби», являя фанатам самую захватывающую и амбициозную игру серии. Кампанию можно проходить в одиночку или в кооперативном режиме, поддерживающем до 4 игроков. Сетевой режим станет самым впечатляющим в серии, благодаря новым возможностям повышения ранга, настройкам персонализации и подготовки к бою. А режим «Зомби» с собственным сюжетом подарит игрокам бурю острых ощущений. Call of Duty: Black Ops III можно проходить, играя по сети или одному, и впервые для обоих подходов разработана своя система прокачки. Вас ждёт невообразимое количество нововведений: сногсшибательные карты, оружие, способности и новейшая система передвижения.'),
(3, 2, 'Assasin''s creed', 200, './assasincreed', './images/games/1453315383_assassins-creed-chronicles-india.jpg', 'Assassins Creed Chronicles: India— вторая глава трилогии Assassins Creed Chronicles. Действие главы развернется в Индии. Главным героем главы выступит ассассин Арбааз Мир. Глава посвящена противостоянию Сикхской империи и британских колонизаторов в 1841 году. На полуостров прибывает Мастер тамплиеров, у которого находится ценный предмет, прежде принадлежавший Братству ассассинов. Арбааз Мир должен выяснить, зачем тамплиер прибыл в Индию, найти этот предмет, а также защитить своих близких.'),
(4, 3, 'Anno', 99, './anno', './images/games/1449866638_anno.jpg', 'Anno 2205 - это полюбившийся игрокам симулятор городского строительства, который теперь выходит в космос! Помогите человечеству сделать очередной шаг в светлое будущее. Покорив Землю, вы построите богатые, кипящие жизнью города и огромные промышленные комплексы – но для того, чтобы по-настоящему обеспечить благополучие человечества, необходимо выйти в космос. Научный прорыв в исследованиях термоядерного синтеза может навсегда изменить все сферы общественной жизни. Увы, необходимый для этого изотоп гелий-3 можно добывать в необходимых количествах только на Луне. Ваша задача – построить космопорт и создать лунную колонию, чтобы принять участие в захватывающей борьбе за ресурсы и влияние.'),
(5, 3, 'Starcraft II', 200, './starcraftII', './images/games/1449865846_starcraft-2-legacy-of-the-void.jpg', 'StarCraft 2: Legacy of the Void - это третья, и заключительная часть культовой стратегии в реальном времени, события которой разворачиваются параллельно с Heart of the Swarm и после его окончания. Главным героем этой части вновь станет Зератул, однако игрокам предстоит взять на себя роль не лидера Темных Тамплиеров Протоссов, а Артаниса, командира протоссов, который надеется отбить родную планету протоссов - Айур - у зергов, а затем помочь Зератулу с разгадкой древнего пророчества, от которого зависит судьба всей вселенной. Игроков ждет не только сюжетная кампания за протоссов длинной более двух десятков миссий, но и специальный пролог под названием "Предчувствие Тьмы" (Whispers of Oblivion в оригинале), в котором на протяжении трех миссий Зератулу предстоит найти последний фрагмент некогда утраченного пророчества Ксел''нага. Многопользовательский режим в очередной раз пополнится шестью уникальными юнитами - по два для каждой стороны конфликта - новыми картами, и, разумеется, новыми тактиками и стратегиями для победы.'),
(6, 5, 'Zombie Viking', 89, './zombie_viking', './images/games/1449862767_zombie-vikings.jpg', 'Создатели Stick It to The Man! выпускают новую игру для 4 игроков. Отправляйтесь на смертельно забавные приключения с зомби-викингами. Вашей подгнившей группе предстоит найди потерянный глаз Одина.'),
(7, 2, 'The park', 100, './the_park', './images/games/1446484852_the-park.jpg', 'The Park – одиночный хоррор для PC. Funcom описывает The Park как "короткий, но насыщенный тайтл", где игрокам предстоит исследовать жуткий тематический парк после его закрытия. Играть предстоит за Лоррэйн, которая разыскивает своего пропавшего сына – Каллума.'),
(8, 2, 'Warhammer', 190, './warhammer', './images/games/1446482758_warhammer-end-times-vermintide.jpg', 'Vermintide – это эпическое приключение в жанре сражения от первого лица с возможностью кооператива, действие которого происходит в Конце Времен легендарной фэнтезийной вселенной Warhammer. Действия Vermintide происходят в городе Юбершрайк и его окрестностях, которые кишат скавенами – расой безжалостных людей-крыс. Вы будете играть роль одного из пяти героев, каждый из которых обладает уникальной личностью, игровым стилем, способностями и экипировкой. Работая сообща, вы должны использовать индивидуальные способности героев, чтобы выжить в апокалиптическом вторжении орд скавенов. Сражения будут происходить в разнообразных местностях, начиная от вершины Башни Магна и заканчивая недрами Нижней Империи.'),
(9, 2, 'Sky Hill', 167, './sky_hill', './images/games/1446487480_skyhill.jpg', 'Молодой бизнесмен Перри Джейсон приезжает в город, чтобы совершить крайне выгодную сделку. Нет сомнений в том, что скоро разбогатеет. Перри решает пожить на всю катушку и снимает пентхаус в самом роскошном отеле в городе. Тем более эта чертова война с Конфедерацией наконец-то заканчивается! Но по прибытию в номер происходит ужасное.'),
(10, 2, 'Fallen', 189, './fallen', './images/games/1446487155_fallen-a2p-protocol.jpg', 'Fallen: A2P Protocol - тактическая пошаговая стратегия в постапокалиптическом сеттинге (в стиле X-Com и Fallout), по сюжету которой вам предстоит провести военизированный караван по полуразрушенному миру и уничтожить ненавистную корпорацию GENKORP! В далеком 2125 году корпорация GENKORP разведала новый источник энергии, назвали которой A2P, началась активная его добыча. Одновременно с этим экологическая группа ARKANE выразила протест против добычи A2P и заявила о том что его добыча уничтожит землю. Экологов никто не послушал и спустя некоторое время Земля превратилась в пустыню. Таков сюжет новой походовой тактической стратегии Fallen: A2P Protocol, разрабатывается игра небольшой аргентинской студией Red Katana которая собрала деньги для проекта на Кикстартере. Игра представляет собой синтез классической походовой тактики и постапокалиптической RPG в стиле Fallout.'),
(11, 2, 'Statues', 99, './statues', './images/games/1446484371_statues.jpg', 'Вас никогда не посещала мысль, что статуи, которых вы постоянно видите в своем городе, такие же живые, как и мы? Что их пустой взгляд хранит за собой частицу души скульптора, который в течение года или даже больше, аккуратно, кусок за куском выбивал из камня? Что за каменной грудью бьется каменное сердце, которое в каждый момент времени наполнено скорее всего не самыми теплыми чувствами? Что они неподвижны только из-за неизвестной силы, которая пока удерживает их, не дает им даже пошевелиться? Но стоит только этой сдерживающей силе иссякнуть, как эти каменные изваяния обязательно сменят свои привычные позы, а потом и вовсе спустятся со своих пьедесталов для воплощения таящихся в их каменных головах замыслов в жизнь. Statues – игра, представляющая собой смесь двух жанров: сурвайвал-хоррор и приключенческий экшен. Основным ее элементом являются леденящие душу враги. Они не движутся и не представляют опасности, только когда главный герой, не моргая, смотрит на них. Эти враждебные существа лишат Вас чувства безопасности на протяжении всей игры.'),
(12, 2, 'Mad Max', 178, './mad_max', './images/games/1443475435_mad-max.jpg', 'Безумный Макс – культовый персонаж, недавно переживший второе рождение с выходом нового фильма серии. А теперь мы предлагаем всем фанатам самим отправиться на Пустошь и стать частью этого удивительного мира. В Avalanche Studios создали великолепный, богатый на детали открытый мир, в котором разворачивается действие новой истории о Безумном Максе. В игровом мире Mad Max машина – ключ к выживанию. В роли Безумного Макса – бойца-одиночки, которому приходится ежедневно бороться за жизнь на просторах Пустоши, – вам предстоит научиться сражаться не только стоя на твердой земле, но и за рулем увешанного оружием автомобиля.'),
(13, 2, 'Crookz', 78, './crookz', './images/games/1443480946_crookz-the-big-heist.jpg', '1970-е годы — эпоха фанка, джинсов-клеш и субботних дискотек. Первоклассная команда опытных воров превращает воровство в искусство. Используя свои многочисленные таланты, они проникают в самые богатые дома и крадут лучшие ювелирные изделия — все для финансирования своего гедонистического образа жизни. Так продолжается до попытки похищения знаменитого «лунного» камня из известного музея в Венеции, где из-за предательства команда распадается. Через пять лет оставшиеся участники банды воссоединяются, чтобы отомстить предателю. Естественно, их план также принесет им богатство, о котором они и мечтать не смели... Crookz - The Big Heist — тактическая стратегия в стиле фанка 1970-х с гладкой и заводной атмосферой. Покажите искусство воровства, планируя стильные кражи и грабежи. Используйте шпионаж и быстроту мышления, чтобы не допустить обнаружения. Перед каждым выходом на дело собирайте и снаряжайте команду, планируйте лучший способ проникновения, а затем применяйте разработанную стратегию.'),
(14, 2, 'Gridberd', 67, './gridberd', './images/games/1443480369_gridberd.jpg', 'Каждый дом хранит много страшных тайн. Их не легко разгадать, да и от ответов порой возникают только новые вопросы. Но что делать, когда от этих ответов зависит ваша жизнь? Игра GRIDBERD представляет собой экшен-хоррор от первого лица, в котором вам, предстоит разгадать страшную тайну старинного особняка Джонсонов. Кто вы? Как вы здесь оказались? Что вообще произошло? И кто этот таинственный призрак, который жаждет вас убить и уже вовсю точит свой топор? Пройдитесь по старинному родовому особняку, загляните в самые укромные и самые таинственные его уголки и узнайте секреты, которые он хранит. Узнавайте по крупицам информацию из своего прошлого и из истории этого места. Открывайте потайные ходы, разгадывайте головоломки и умело обходите ловушки, которые приготовил для вас старый замок. Убегайте и прячьтесь от его безжалостных обитателей, которым не терпится до вас добраться. И помните - здесь за каждым углом вас поджидают ужас и страх, а то, что вы найдете навсегда может изменить вашу жизнь. Так просто сбежать не получится! История только начинается, пройдите ее до конца!');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_ibfk_1` (`parent_id`);

--
-- Индексы таблицы `incategory`
--
ALTER TABLE `incategory`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `incategory`
--
ALTER TABLE `incategory`
  ADD CONSTRAINT `incategory_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `incategory_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
