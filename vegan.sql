-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2019 at 09:16 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vegan`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(64) NOT NULL,
  `color` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `slug`, `color`) VALUES
(1, 'Doručak', 'Šta se ujutru jede', 'dorucak', ''),
(2, 'Ručak', 'Popodnevni obrok', 'rucak', ''),
(3, 'Večera', 'Dovečer', 'vecera', ''),
(4, 'Salate', 'salate', 'salate', ''),
(5, 'Dezerti', 'slatko', 'dezerti', ''),
(6, 'Dečija', 'Za decu', 'decija', '');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `created_on` date NOT NULL,
  `status` enum('on moderation','approve','disapprove') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content_id`, `author_name`, `email`, `comment_content`, `created_on`, `status`) VALUES
(3, 13, 'vcvc', 'boris.dovecer@gmail.com', 'bcbvc', '2019-06-04', 'disapprove');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content_text` text NOT NULL,
  `image` int(11) NOT NULL,
  `gallery` varchar(255) DEFAULT NULL,
  `created_on` date NOT NULL,
  `author_id` int(11) NOT NULL,
  `ct_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `title`, `description`, `content_text`, `image`, `gallery`, `created_on`, `author_id`, `ct_id`, `category_id`, `slug`, `time`, `hits`) VALUES
(3, 'Maslinovo ulje i ostala ulja', '<p>Samo jedan litar bilo kojeg biljnog ulja sadrži 8000 kalorija čiste &nbsp; masti dok samo jedna ka&scaron;ika sadrži 120 kalorija čiste masti. Među &nbsp; biljnim uljima koja se na svetu najvi&scaron;e koriste spadaju suncokretovo &nbsp; ulje, kukuruzno ulje, kanola ulje, palmovo ulje, kokosovo ulje i &nbsp; maslinovo ulje. U ovom članku, saznaćemo kako se biljna ulja proizvode, &nbsp; od čega se sastoje i kako utiču na na&scaron;e zdravlje.</p>', '<p>izvor: <a href=\"https://www.matija.rs/maslinovo-ulje-i-ostala-ulja-iznad-kontradiktornosti/\">https://www.matija.rs/maslinovo-ulje-i-ostala-ulja-iznad-kontradiktornosti/</a></p><p><br></p><p>Samo jedan litar bilo kojeg biljnog ulja sadrži 8000 kalorija čiste &nbsp;masti dok samo jedna ka&scaron;ika sadrži 120 kalorija čiste masti. Među &nbsp;biljnim uljima koja se na svetu najvi&scaron;e koriste spadaju suncokretovo &nbsp;ulje, kukuruzno ulje, kanola ulje, palmovo ulje, kokosovo ulje i &nbsp;maslinovo ulje. U ovom članku, saznaćemo kako se biljna ulja proizvode, &nbsp;od čega se sastoje i kako utiču na na&scaron;e zdravlje.</p><p><strong>Kako se biljno ulje proizvodi?</strong></p><p>Postoje dve vrste biljnog ulja: rafinisano i nerafinisano.</p><p><strong>Rafinisano ulje</strong> je ulje koje se iz biljaka &nbsp;ekstraktuje veoma neprirodnim metodama koristeći beljenje, deodorisanje i &nbsp;tretiranje hemikalijama i aditivima. Da bi se produžio rok trajanja, &nbsp;dodaje se natrijum hidroksid. Da bi se ekstraktovalo &scaron;to vi&scaron;e ulja &nbsp;koriste se hemijska sredstva. Rafinisano ulje često sadrži i &nbsp;hidrogenizovano ulje &scaron;to znači da sadrži trans masti.</p><p><strong>Nerafinisano ulje</strong> je ulje koje se dobija metodom hladnog ceđenja i naziva se devičansko jer je čisto, nerafinisano i neprerađeno.</p><p>Uzmimo za primer maslinovo ulje. Najveći proizvođači maslina na svetu &nbsp;su zemlje koje se graniče sa Sredozemnim morem. Kvalitet maslinovog &nbsp;ulja se ocenjuje po nivou kiselosti odnosno količini slobodne oleinske &nbsp;kiseline u ulju. Tradicionalna metoda proizvodnje nerafinisanog &nbsp;maslinovog ulja je metoda hladnog ceđenja kojom se dobija devičansko &nbsp;maslinovo ulje. Devičansko maslinovo ulje se može nazvati ekstra &nbsp;devičansko ukoliko sadrži manje od 1% slobodne oleinske kiseline, tako &nbsp;da reč <em>ekstra</em> u ovom kontekstu zapravo znači <em>najbolje&nbsp;</em>odnosno <em>najboljeg kvaliteta</em>.</p><p>Metoda hladnog ceđenja je metoda gde se ulje dobija mehaničkim &nbsp;presovanjem. Za vreme žetve se masline ručno beru. Jedan berač za sat &nbsp;vremena prosečno ubere oko 7,1 kilograma odnosno 1775 maslina koje teže 4 &nbsp;grama. Masline koje su već pale na zemlju se stavljaju u posebnu korpu i &nbsp;odvajaju jer se smatraju kao inferiorne i radi toga se ulje dobijeno od &nbsp;njih ne može označiti kao ulje ekstra devičanskog kvaliteta. Nakon &nbsp;berbe se masline stavljaju u kameni mlin i gnječe ogromnim kamenjem &nbsp;te&scaron;ko preko tonu. Zgnječene masline se onda stavljaju u ma&scaron;inu i &nbsp;presuju jakim pritiskom da bi se iz njih iscedili ulje i voda. Onda se &nbsp;pusti da ulje slegne, a voda se uklanja centrifugom ili dekantacijom &nbsp;(proces odvajanja sme&scaron;a).</p><p><strong>Od čega se biljno ulje sastoji?</strong></p><p>Biljno ulje je najkaloričnija hrana na planeti i sastoji se&nbsp;od 100% čiste masti.</p><p>Većina biljnih ulja uključujući maslinovo ulje, suncokretovo ulje, &nbsp;kukuruzno ulje i sojino ulje sastoje se od otprilike 75% mononezasićenih &nbsp;masti, 10% polinezasićenih masti i 15% zasićenih masti, dok se palmovo &nbsp;ulje sastoji od 50% <strong>zasićenih masti&nbsp;</strong>i kokosovo ulje od 90% <strong>zasićenih masti</strong>. Kako ironično? Biljno ulje koje se generalno reklamira kao najzdravije je zapravo naj&scaron;tetnije. To je moć reklamiranja.</p><p>Povrh toga, <strong>mononezasićene i polinezasićene masti u biljnom ulju</strong> su izolovane i kada se konzumiraju izolovane onda mogu da budu &nbsp;proinflamatorne i da deluju suprotno od mononezasićenih i &nbsp;polinezasićenih masti koje dolaze upakovane u celovitim biljkama.</p><p><img src=\"https://www.matija.rs/wp-content/uploads/2017/04/Sastav-masti-u-biljnim-uljima-1075x605.jpg\" style=\"width: 70%;\" class=\"fr-fic fr-dib\"></p><p>Sastav masti u biljnim uljima @ <a href=\"matija.rs\">matija.rs</a> / Izvor: USDA Nutrient Database</p><p>Za samo 1 litar maslinovog ulja potrebno je 1375 maslina zgnječenih &nbsp;do iznemoglosti i li&scaron;enih kompletnog proteina, ugljenih hidrata, vlakana &nbsp;i većine hranljivih sastojaka. Jedan litar bilo kojeg biljnog ulja &nbsp;sadrži 8000 kalorija čiste masti dok samo jedna ka&scaron;ika biljnog ulja &nbsp;sadrži 120 kalorija čiste masti. Samo tri ka&scaron;ike biljnog ulja na dan je &nbsp;360 kalorija čiste masti, a mnogi ljudi unose mnogo vi&scaron;e. I ako to rade &nbsp;svakoga dana u mesecu, to je mesečno uno&scaron;enje 10.800 kalorija odnosno &nbsp;dodatnih 1,2 kilograma čistih izolovanih masti koje ne funkcioni&scaron;u isto &nbsp;kao masti koje dolaze prirodno upakovane u celovitim biljkama.</p><p><img src=\"https://www.matija.rs/wp-content/uploads/2017/04/OliveMillstone.jpg\" style=\"width: 70%;\" class=\"fr-fic fr-dib\"></p><p>Gnječenje maslina mlinskim kamenom &copy; dkaubo</p><p><strong>Kako biljno ulje utiče na zdravlje?</strong></p><p>Tvoje telo, mozak i mi&scaron;ići se sastoje od oko 70% vode i hrane se &nbsp;različitim hranljivim sastojcima, a biljke su pune vode, vlakna i &nbsp;hranljivih sastojaka poput vitamina, minerala i beta karotena. Ako &nbsp;pojede&scaron; celovite masline onda unosi&scaron; vodu, vlakna i kalorije koje su &nbsp;bogate hranljivim sastojcima, a ako unese&scaron; maslinovo ulje onda unosi&scaron; &nbsp;kalorije čiste masti koja je li&scaron;ena vode, proteina, ugljenih hidrata, &nbsp;vlakna i većine hranljivih sastojaka.</p><p>Ako ti neko kaže da neke vrste biljnog ulja sadrže sve hranljive &nbsp;sastojke jer su dobijene nekim specijalnim procesom, slobodno im kaži: &nbsp;&bdquo;Po&scaron;tujem tvoje mi&scaron;ljenje, ali se ne slažem. Hajmo da pogledamo naučne &nbsp;podatke.&ldquo; Sva biljna ulja su čista mast li&scaron;ena svih komponenti i većine &nbsp;hranljivih sastojaka.</p><p><br></p><p><img src=\"https://www.matija.rs/wp-content/uploads/2017/04/NutritivnaVrednostMaslinovogUlja-1075x605.jpg\" style=\"width: 70%;\" class=\"fr-fic fr-dib\"></p><p>Nutritivna vrednost celovitih maslina i maslinovog ulja @ <a href=\"matija.rs\">matija.rs</a> / Izvor: USDA Nutrient Database</p><p>Odma čim u svoje telo unesemo biljno ulje, bilo to kao dodatak uz &nbsp;salatu ili prženo uz neku hranu, ono smanjuje sposobnost na&scaron;eg tela da &nbsp;pro&scaron;iruje na&scaron;e artije i time smanjuje protok krvi. Biljno ulje takođe &nbsp;o&scaron;tećuje i značajno pogor&scaron;ava funkciju endotela čak u roku od tri sata &nbsp;nakon konzumiranja.</p><p>Kratkoročno pogor&scaron;ava funkciju endotela, a dugoročno doprinosi ka &nbsp;začepljenju arterija. Ukoliko te interesuju detalji i naučni dokazi, &nbsp;pogledaj članak <a href=\"https://nutritionfacts.org/video/what-about-coconuts-coconut-milk-and-coconut-oil-mcts/\" rel=\"noopener\" target=\"_blank\">&Scaron;ta je sa kokosom, kokosovim mlekom i kokosovim uljem od triglocerida srednjeg lanca?</a> i članak <a href=\"https://nutritionfacts.org/video/olive-oil-and-artery-function/\" rel=\"noopener\" target=\"_blank\">Maslinovo ulje i funkcija arterija</a> koji se temelje na 29 naučnih istraživanja.</p><p><br></p><p><img src=\"https://www.matija.rs/wp-content/uploads/2017/04/CloggedArteries.jpg\" style=\"width: 70%;\" class=\"fr-fic fr-dib\"></p><p>Začepljene arterije, trombociti i plak &copy; ralwel</p><p>Po&scaron;to je biljno ulje najkaloričnija hrana na svetu, ono takođe lako dovodi do gomilanja masti i gojaznosti. I po&scaron;to <a href=\"https://nutritionfacts.org/video/what-causes-insulin-resistance/\" rel=\"noopener noreferrer\" target=\"_blank\">konzumiranje previ&scaron;e kalorija bogatih zasićenim mastima dovodi do otpora insulina &scaron;to je&nbsp;uzrok dijabetesa tipa 2</a>, &nbsp;a biljno ulje je čista mast bogata zasićenim mastima, to znači da &nbsp;konzumiranje biljnog ulja povećava rizik dijabetesa tipa 2. Samo tri &nbsp;sata nakon konzumiranja visokog nivoa masti, telesne ćelije postaju &nbsp;otporne insulinu i sprečavaju unos glukoze &scaron;to dovodi do povi&scaron;enog nivoa &nbsp;glukoze u krvnim sudovima.</p><p>I suprotno popularnom verovanju, mediteranska dijeta nije zdravija od &nbsp;mnogih dijeta radi biljnog ulja, već uprkos biljnog ulja. Ono &scaron;to je &nbsp;čini zdravijom je to &scaron;to je bogata voćem, povrćem, pasuljem, ora&scaron;astim &nbsp;plodovima i integralnim žitaricama. &Scaron;ta je zdravije jesti: celovitu &nbsp;biljku bogatu vodom, proteinima, vlaknima i raznim hranljivim sastojcima &nbsp;ili biljno ulje čije kalorije sadrže čistu mast?</p><p><strong>Zaključak i re&scaron;enje</strong></p><p>S ovim informacijama možemo da zaključimo da je <strong>biljno ulje neprirodan proizvod koji &scaron;teti</strong>\r\n<strong>zdravlju</strong>,<strong>&nbsp;</strong>bilo &nbsp;to rafinisano ili nerafinisano ulje, maslinovo ulje, kokosovo ulje ili &nbsp;neko drugo biljno ulje. A ekstra devičansko maslinovo ulje?</p><blockquote><p>&nbsp;&bdquo;NIKAKVO &nbsp;ULJE! Ni maslinovo ulje, &scaron;to ide protiv mnogih drugih saveta o &nbsp;takozvanim dobrim mastima. I mononezasićene i zasićene masti u uljima &nbsp;&scaron;tete endotelu, unutra&scaron;njem omotaču arterija, i ta povreda je kapija &nbsp;koja vodi do vaskularnih bolesti. Nije bitno da li je to maslinovo ulje, &nbsp;kukuruzno ulje, kokosovo ulje, ulje kanone ili bilo koje drugo ulje. &nbsp;Izbegavaj SVAKO ulje.&ldquo;</p><p><cite><a href=\"https://www.facebook.com/Dr.Esselstyn\" rel=\"noopener\" target=\"_blank\">Dr. Kaldvel Eselstin</a>, &nbsp;hirurg koji se od 1984. hrani celovitom biljnom ishranom, osvajač &nbsp;zlatne medalje u veslanju na Olimpijskim igrama i direktor programa za &nbsp;prevenciju i lečenje kardiovaskularnih bolesti na institutu Cleveland &nbsp;Wellness Center. Autor je knjige <a href=\"http://www.dresselstyn.com/site/books/prevent-reverse/about-the-book/\" rel=\"noopener\" target=\"_blank\">Spreči i preokreni srčane bolesti</a>.</cite></p></blockquote><p>Za salate, umesto ulja može&scaron; za minut da napravi&scaron; svoj preliv za &nbsp;salatu tako &scaron;to kombinuje&scaron; limun, beli luk u prahu, cimet u prahu, &nbsp;mleveni biber i per&scaron;un. Ako naručuje&scaron; salatu u restoranu, može&scaron; da ih &nbsp;zamoli&scaron; da ne stavljaju ulje.</p><p>Za dinstanje, umesto ulja koristi iseckani paradajz ili vodu. U &nbsp;tiganj sipaj jednu do dve ka&scaron;ike vode i onda, ukoliko je potrebno, dodaj &nbsp;onoliko ka&scaron;ika koliko je potrebno. Povremeno me&scaron;aj hranu kako ne bi &nbsp;izgorela. Čitav proces je lagan, nekomplikovan i zdrav. Za pečenje, &nbsp;umesto ulja koristi začine. Kada hranu peče&scaron; u rerni, uop&scaron;te nema &nbsp;potrebe da je preliva&scaron; uljem, samo sipaj neke začine po želji.</p><p>I gotovo je nemoguće da se biljno ulje izbegne kada si u gradu, &nbsp;gostima ili na putovanju, ali zato biljno ulje može&scaron; da ne koristi&scaron; kada &nbsp;hranu sprema&scaron; kod kuće i da svoju ishranu iz dana u dana temelji&scaron; na &nbsp;hrani koja ne sadrži biljno ulje.</p><p>Za veliku selekciju <a href=\"http://nutritionstudies.org/recipes/\" rel=\"noopener noreferrer\" target=\"_blank\">ukusnih recepata bez ulja pogledaj sajt Nutrition Studies</a>.</p>', 18, NULL, '2019-05-12', 1, 2, NULL, 'pirinac-iz-in-d-haus', '', 29),
(6, 'Reduktarijanstvo vs. VEGANSTVO', '<p>Ako na reduktarijanstvo gledamo kao na koncept koji okuplja vi&scaron;e ljudi &nbsp;za manje patnje, može li ono biti korak ka boljem svetu? Pitanje je da &nbsp;li imamo koristi od posmatranja sveta u crno-belim kategorijama &ndash; ili bi &nbsp;bilo korisnije da vidimo i nijanse između.</p>', '<p>Ako na reduktarijanstvo gledamo kao na koncept koji okuplja vi&scaron;e ljudi &nbsp;za manje patnje, može li ono biti korak ka boljem svetu? Pitanje je da &nbsp;li imamo koristi od posmatranja sveta u crno-belim kategorijama &ndash; ili bi &nbsp;bilo korisnije da vidimo i nijanse između.</p><p><br></p><p>Može li fleksitarijanstvo da spase svet? Da li je veganstvo prevelik &nbsp;zalogaj za dana&scaron;njeg prosečnog čoveka koji većinu kalorija i dalje &nbsp;dobija iz mesa i sira, iako se to odavno kosi sa preporukama svih &nbsp;zdravstvenih institucija? Ima li onda smisla da promovi&scaron;emo smanjenje &nbsp;konzumacije životinjskih proizvoda, kada već ukidanje ne dolazi u obzir &nbsp;kod većine?</p><p>&nbsp;</p><p>Jednom prosečnom veganskom aktivisti je nezamislivo da zastupa &nbsp;smanjenje životinjskih proizvoda u prehrani, kad to i dalje znači &nbsp;plaćanje za eksploataciju životinja, iako u manjoj meri. Prelazak na &nbsp;veganstvo ogroman je korak za neke ljude, ali vegani su taj korak &nbsp;napravili i kontradiktorno je da očekuju manje od drugih.&nbsp;</p><p>&nbsp;</p><p>Reći će vegani &ndash; ili jesi ili nisi trudna, ne može&scaron; biti malo trudna &ndash; &nbsp;i biće u pravu. Kada je trudnoća u pitanju. Da li je tako kada je<strong>&nbsp;etika ishrane</strong> u pitanju ili postoje nijanse&hellip; moj odgovor je da nijanse postoje, a one su put do krajnje destinacije.<br><br></p><p>&nbsp;</p><p>Imamo &nbsp;li dovoljno dobar razlog da tražimo sve ili ni&scaron;ta od ljudi koji bi &nbsp;radije učinili ni&scaron;ta kada se pred njih postavi takav uslov? Dajemo li im &nbsp;besplatnu kartu da ne učine ba&scaron; ni&scaron;ta ako je stepenica za njih &nbsp;prevelika u ovom trenutku?&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Možemo da im se rugamo, da se podsmevamo njihovoj &ldquo;razmaženosti&rdquo;, da &nbsp;podsećamo na užase koje zbog njih trpe nedužna bića, da im ponavljamo &nbsp;već dobro naučene mantre i zdravorazumske argumente, naučne činjenice, &nbsp;citate velikih ljudi. Možemo da odlučimo da ne ručavamo za istim stolom &nbsp;sa njima, da poku&scaron;amo da ih postidimo u restoranu, da bojkotujemo hranu &nbsp;24 sata (koja je pritom veganska, pa to nema nikakvog smisla). Sve to &nbsp;radimo, već decenijama, ali vegana i dalje ima veoma malo. Premalo da bi &nbsp;napravili razliku za životinje.</p><p>&nbsp;</p><p>Čak 25% ljudi u Velikoj Britaniji smanjilo je konzumaciju mesa, upravo zbog novih kampanja i <a href=\"https://www.bda.uk.com/professional/resources/obd_ref_guide.pdf\">preporuka za smanjenje mesa u ishrani</a> i tzv. environmentalističkog pokreta. REZULTAT: ogromni porast broja, &nbsp;raznovrsnosti i kvaliteta veganskih proizvoda i zamena za meso i mlečne &nbsp;proizvode. Reduktarijanci obuhvataju mnogo veći udeo potro&scaron;ača i <strong>zahvaljujući reduktarijancima nikad nije bilo dostupnije jesti vegansku hranu kao danas</strong>. &nbsp;Ovaj pokret je, slučajno ili namerno, doprineo veganskom pokretu &ndash; &nbsp;nikada nije bilo lak&scaron;e postati vegan. Slično se desilo u Srbiji kada je &nbsp;ponovo postalo popularno da se posti uskr&scaron;nji i božićni post &ndash; <em>hvala vernicima</em>.</p><p>&nbsp;</p><h2><span style=\"font-size: 18px;\">Za&scaron;to treba da zastupamo smanjenje mesa u ishrani?</span></h2><p>&nbsp;</p><p>Preterana konzumacija mesa u dana&scaron;njoj ishrani savremenog čoveka &nbsp;značajno doprinosi pogor&scaron;anju zdravlja, povećanju rizika za gojaznost i &nbsp;razvoj nekih hroničnih bolesti: dijabetes, rak, bolesti srca. Brojne &nbsp;studije pokazuju da dana&scaron;nji prehrambeni sistemi nisu održivi i da će &nbsp;uskoro preći granicu preko kapaciteta izdržljivosti na&scaron;e životne &nbsp;sredine. Globalna produkcija hrane odgovorna je za degradaciju &nbsp;zemlji&scaron;ta, zagađenje reka i mora, vodeći je uzrok klimatske &nbsp;nestabilnosti. Način na koji proizvodimo i konzumiramo hranu &scaron;teti nama i &nbsp;planeti.</p><p>&nbsp;</p><p>Iz ovih razloga 37 vodećih svetskih naučnika iz celog sveta formirali &nbsp;su komisiju kako bi postigli naučni konsenzus definisanjem ishrane koja &nbsp;bi omogućila održivu proizvodnju hrane za rastuću populaciju i do 10 &nbsp;milijardi ljudi do 2050. godine.</p><p>&nbsp;</p><p>Rezultat rada LANCET komisije je<a href=\"https://eatforum.org/eat-lancet-commission/eat-lancet-commission-summary-report/\">&nbsp;izve&scaron;taj&nbsp;</a>u &nbsp;kom se nalaze preporuke u vidu &ldquo;Planetarno zdrave ishrane&rdquo; koje treba &nbsp;da posluže svim državama sveta kao referenca za nacionalne preporuke u &nbsp;cilju pobolj&scaron;anja zdravlja i očuvanja životne sredine. &nbsp;</p><p>&nbsp;</p><blockquote><p><em><a href=\"https://eatforum.org/eat-lancet-commission/\"><strong>Planetarno zdrava ishrana</strong></a></em><a href=\"https://eatforum.org/eat-lancet-commission/\"><strong>&nbsp;</strong>podrazumeva &nbsp;da se na polovini tanjira nađe obilje voća, povrća i ora&scaron;astih plodova. &nbsp;Na drugoj polovini nalaze se celovite žitarice, mahunarke (pasulj, &nbsp;sočivo, gra&scaron;ak), nezasićene biljne masnoće iz ulja, skromne količine &nbsp;mesa, mlečnih proizvoda, ne&scaron;to dodatog &scaron;ećera i skrobastog povrća.&nbsp;</a></p></blockquote><p>&nbsp;</p><p>Ove preporuke prilično su fleksibilne i mogu se adaptirati u &nbsp;zavisnosti od individualnih potreba i preferencija pojedinaca, kao i u &nbsp;odnosu na kulturolo&scaron;ke razlike.&nbsp;</p><p>&nbsp;</p><p>Prema &nbsp;izve&scaron;taju komisije Lancet-a vegetarijanska i veganska ishrana spadaju u &nbsp;dve opcije koje su zdrave i za planetu i za zdravlje pojedinca u okviru &nbsp;preporuka iz izve&scaron;taja.</p><p>&nbsp;</p><p>Nedavno je Kanada donela nove <a href=\"https://food-guide.canada.ca/en/\">nacionalne preporuke</a> koje su u skladu sa naučnim zaključcima Lancet komisije i baziraju se na biljnim namirnicama.</p><p><br></p><p><img src=\"https://i2.wp.com/veganportal.org/wp-content/uploads/2019/01/img_4798.jpg?resize=768%2C576&ssl=1\" style=\"width: 70%;\" class=\"fr-fic fr-dib\"></p><p><br></p><p><em>U slučaju da ne znate:</em>\r\n<strong>veganstvo je nastojanje da se &nbsp;izbegava nepotrebno kori&scaron;ćenje životinja, u ishrani, odevanju, kao vid &nbsp;zabave, prevozno sredstvo, ukras i tome slično &ndash; sve dok je to praktično &nbsp;moguće, dostupno i izvodljivo.</strong> Veganstvo, kada govorimo samo o &nbsp;ishrani, je etički koncept koji se zasniva isključivo na činjenici da &nbsp;je danas nepotrebno jesti životinje i njihove produkte.</p><p>&nbsp;</p><p>Kad nam se jede životinjski proizvod na koji smo navikli, poku&scaron;avamo da nađemo <strong>alternativu&nbsp;</strong>jer &nbsp;se protivimo eksploataciji životinja zbog na&scaron;ih čulnih pupoljaka. &nbsp;Veganstvo nema preterano veze sa zdravljem ili životnom sredinom, ali je &nbsp;biljna ishrana sasvim slučajno danas tema naučnika koje brine globalno &nbsp;zagrevanje na&scaron;e planete, zagađenje ali i zdravlje čoveka, uključujući i &nbsp;javno zdravlje zbog razvitka sojeva <a href=\"https://www.reactgroup.org/news-and-views/news-and-opinions/year-2017/antibiotics-in-animal-agriculture/\">bakterija rezistentnih na antibiotike usled intenzivnog uzgoja životinja</a>. Opet, hvala im na tome u ime veganskog pokreta.</p><p>&nbsp;</p><p>Sigurna sam da je potpuni prestanak kori&scaron;ćenja životinja jedina &nbsp;moguća budućnost čovečanstva jer je ono moralni korak napred kom su &nbsp;ljudi uvek težili &ndash; od robovlasni&scaron;tva do slobodnih građana, od &nbsp;obespravljenih žena do ravnopravnosti, od eksperimenata nad &nbsp;homoseksualcima do prihvatanja varijeteta seksualnosti. Sama sposobnost &nbsp;da moralno rezonujemo nas obavezuje da menjamo pona&scaron;anje i stavove u &nbsp;skladu sa uslovima u kojima živimo. Etika je neminovni deo ljudskog &nbsp;kodeksa pona&scaron;anja.&nbsp;</p><p>&nbsp;</p><p>Takođe sam sigurna da je put dug, i zato pozivam danas sve one &nbsp;nespremne na potpuno odricanje od kori&scaron;ćenja životinja probaju da umesto &nbsp;kravljeg mleka če&scaron;će kupe neko biljno (ima ih raznih i različitog ukusa &nbsp;i kvaliteta), da ubace vi&scaron;e biljnih, a smanje životinjske proteine, da &nbsp;pruže (i nekoliko) &scaron;ansi tofu-u, sejtanu, tempehu, indijskim jelima, &nbsp;pljeskavicama od pasulja, kobasicama i ćufticama od Bege Vege-a, &nbsp;Vegapčiće, Vege Posno Slasno kuhinju i proizvode, da isprobaju da &nbsp;naprave svoj sir od <a href=\"https://veganportal.org/2017/12/25/veganski-sir-od-indijskog-oraha/\">indijskih oraha</a> ili <a href=\"https://veganportal.org/2018/03/16/vege-posno-slasni-feta-sir-od-badema/\">badema</a>, i ogroman izbor <a href=\"https://veganportal.org/2018/05/28/veganski-proizvodi-u-srbiji/\">veganskih proizvoda</a> koji već postoje na na&scaron;em trži&scaron;tu.</p><p>&nbsp;</p>', 19, NULL, '2019-05-12', 1, 2, NULL, 'reduktarijanstvo-vs-veganstvo', '', 22),
(10, 'Veganstvo – saveti za početnike', '<p>Pitala sam vegane &scaron;ta bi preporučili nekom ko pravi prve korake na putu ka veganstvu i dobila sam brojne korisne savete.</p>', '<p>Pitala sam vegane &scaron;ta bi preporučili nekom ko pravi prve korake na putu ka veganstvu i dobila sam brojne korisne savete.</p><p><br><span style=\"font-size: 18px;\">&Scaron;ta da jedem na veganskoj ishrani?</span><br>&nbsp;</p><p>Veganska ishrana ne odnosi se samo na &nbsp;IZBACIVANJE životinjskih namirnica iz ishrane, već je istovremeno &nbsp;moguće, ali i poželjno UVOĐENJE nekih novih. Mnogi vegani ishranu iz tog &nbsp;razloga <strong>ne smatraju ni malo restriktivnom</strong> jer se na &nbsp;njihovom tanjiru nađu namirnice i začini za koje ranije nisu ni čuli. &nbsp;Jedan od saveta vegana novim veganima je da se oslanjaju na &nbsp;tradicionalna i manje tradicionalna jela bez životinjskih proizvoda, na &nbsp;nove ukuse i teksture, da eksperimenti&scaron;u ili da se drže proverenih, već &nbsp;poznazih ukusa. Da komplikuju ili da pojednostave, na njima je. Već &nbsp;naslućuje&scaron; da će&scaron; sam sebi morati da osmisli&scaron; svaki novi veganski korak &nbsp;jer je svačija priča drugačija, ali i to je jedan od saveta. Ako je &nbsp;nekom bilo lako ne znači da će biti lako i tebi, a ako je nekom bilo &nbsp;prete&scaron;ko ne znači da je svima te&scaron;ko. Veganstvo je za neke vegane &nbsp;najjednostavnija stvar na svetu, a za nekog je najveći naučni projekat. &nbsp;Svako je u pravu jer pravila nema. Ideja nas spaja, a sve drugo može, i &nbsp;ne mora, da nas razdvaja.</p><p>&nbsp;</p><p>Pored novih ukusa, tu su i dobri, stari, poznati ukusi tradicionalne &nbsp;kuhinje sa na&scaron;ih prostora: posne sarme, punjene paprike, podvarak, &nbsp;proja, đuveč, ajvar, pita krompiru&scaron;a, posni kolači&hellip; ali se u rubrikama &nbsp;&ldquo;posno&rdquo; često mogu naći i veganski recepti drugih kulinarskih tradicija. &nbsp;Vegani preporučuju indijsku kuhinju koja je prepuna ukusa sa dostupnim &nbsp;sastojcima &ndash; od karfiola, krompira, do najobičnijeg sočiva.</p><p>&nbsp;</p><p>Ako želi&scaron; sam da se oku&scaron;a&scaron; u kuvanju potraži recepte na facebook stranicama kao &scaron;to su: <a href=\"https://www.facebook.com/veganskikuvar/\" rel=\"noreferrer noopener\" target=\"_blank\">Veganski kuvar</a>, <a href=\"https://www.facebook.com/veselaveganskakuhinja/\" rel=\"noreferrer noopener\" target=\"_blank\">Vesela veganska kuhinja</a>, <a href=\"https://www.facebook.com/vegeposnoslasno/\" rel=\"noreferrer noopener\" target=\"_blank\">Vege posno slasno</a>, <a href=\"https://www.facebook.com/vegesign/\" rel=\"noreferrer noopener\" target=\"_blank\">Vegesign</a> i brojne druge, kao i facebook grupe: <a href=\"https://www.facebook.com/groups/iz.moje.vegan.kuhinje/\" rel=\"noreferrer noopener\" target=\"_blank\">Moja vegan kuhinja</a> gde može&scaron; videti neke već isprobane recepte. Tu su i <a href=\"https://www.facebook.com/groups/vegesrbija/\" rel=\"noreferrer noopener\" target=\"_blank\">Vege Srbija</a> i <a href=\"https://www.facebook.com/groups/734379246610659/\" rel=\"noreferrer noopener\" target=\"_blank\">Veganska zajednica</a>, grupe u kojima su teme raznolike ali se može naći i po koji recept. Takođe ne zaboravi na dobri stari <a href=\"http://Google.com\" rel=\"noreferrer noopener\" target=\"_blank\">Google</a>, pa tako ukucavanjem &ldquo;posni recepti&rdquo; može&scaron; pretražiti nekoliko sajtova sa velikom bazom podataka na na&scaron;em jeziku.</p><p>&nbsp;</p><h3><span style=\"font-size: 18px;\">&Scaron;ta da jedem u restoranu?</span><br><br></h3><p>Jedan od saveta bio je i da &ndash; u nevege restoranima gleda&scaron; sekciju &nbsp;&ldquo;Prilozi&rdquo;, a za bolji veganski ugođaj poseti&scaron; veganske restorane u Novom &nbsp;Sadu, Zagrebu, Splitu, Sarajevu, Beogradu&hellip; ukucaj željeno mesto na &nbsp;sajtu <a href=\"http://happycow.net\" rel=\"noreferrer noopener\" target=\"_blank\"></a><a href=\"http://happycow.net\">http://happycow.net</a> i izaći će ti vege i vegan ponude u gradu koji te zanima &scaron;irom sveta.</p><p>&nbsp;<br><span style=\"font-size: 18px;\">Suplementi &ndash; jedan je obavezan, neki mogu i ne moraju</span><br><br></p><p>Iako se na internetu i među veganima mogu naći podeljena mi&scaron;ljenja vezana za suplementaciju, vitamin <strong>B12 jedini je nutrijent koji se ne nalazi u hrani biljnog porekla</strong>, &nbsp;osim ako ona nije njime obogaćena. Sa ovim se slažu svi medicinski &nbsp;autoriteti i ako neko tvrdi drugačije, posumnjajte u njegovu &nbsp;kredibilnost. Na kraju krajeva, svako može da ima mi&scaron;ljenje, ali zato &nbsp;imamo nauku koja iz vi&scaron;e uglova i na velikim uzorcima može neku pojavu &nbsp;da proveri. U skladu sa tim, B12 vitamin je jedini nutrijent koji se &nbsp;preporučuje u obliku suplementa, kao sprej, tableta ili pastila svim &nbsp;veganima, brojnim vegetarijancima i nekolicini mesojeda, naročito onim &nbsp;iznad 65. godine života. B12 suplement je potpuno bezbedan, a sav vi&scaron;ak &nbsp;se izlučuje mokraćom, pa nema opasnosti od predoziranja. Doze koje se &nbsp;preporučuju su vi&scaron;estruko veće od potrebnih jer je apsorpcija ovog &nbsp;nutrijenta komplikovana i često veoma lo&scaron;a usled brojnih faktora. Ako te &nbsp;detaljno zanima sve u vezi vitamina B12, njegove apsorpcije, oblika, &nbsp;potrebnih doza i tome slično, sve to, i jo&scaron; mnogo vi&scaron;e može&scaron; naći na &nbsp;sajtu <a href=\"https://veganhealth.org/vitamin-b12/\" rel=\"noreferrer noopener\" target=\"_blank\"></a><a href=\"veganhealth.org\">veganhealth.org</a>.</p><p>&nbsp;</p><p>Ostali suplementi su opcioni i nisu rezervisani samo za vegane &ndash; u &nbsp;zavisnosti od individualnih potreba organizma i stila života. <strong>Vitamin D</strong> &ndash; ukoliko ne provodi&scaron; dovoljno vremena na suncu, nevezano za način ishrane, može&scaron; imati manjak ovog vitamina; <strong>Omega 3 masne kiseline</strong> &ndash; ukoliko ne uzima&scaron; dovoljno ovih masnoća iz hrane (orasi, čia seme, &nbsp;laneno seme), ima&scaron; lo&scaron;iju konverziju ALA u DHA, ili ima&scaron; povećane &nbsp;potrebe za ovim nutrijentom (deca, trudnice); <strong>JOD</strong> &ndash; &nbsp;ukoliko se trudi&scaron; da smanji&scaron; (jodiranu) so iz koje većina ljudi dobija &nbsp;dnevne potrebe joda ili ukoliko ima&scaron; povi&scaron;ene potrebe za ovim &nbsp;mikroelementom, a po savetu lekara (poremećaji rada tiroidne žlezde, &nbsp;trudnoća); <strong>Proteini&nbsp;</strong>&ndash; ukoliko ne uzima&scaron; dovoljno proteina iz soje, pasulja, sočiva, leblebija, sejtana, tofua, pistaća, kinoe, semena golice; <strong>Gvožđe&nbsp;</strong>&ndash; &nbsp;ukoliko ne uzima&scaron; dovoljno mahunarki, celovitih žitarica, suvog voća, &nbsp;zelenog lisnatog povrća, soje, uz puno voća i povrća bogatih vitaminom &nbsp;C; <strong>Kalcijum&nbsp;</strong>&ndash; ukoliko ne uzima&scaron; namirnice bogate kalcijumom (<a href=\"https://veganportal.org/2018/02/21/zasto-morate-da-pijete-mleko-ako-imate-netoleranciju-na-laktozu-spoiler-ne-morate/\">ne, ne morate piti mleko</a>); Za <strong>vitamin A</strong> konzumiraj namirnice bogate karotenoidima: &scaron;argarepa, bundeva, batat, narandžasto i crveno voće, tamnozeleno povće, paradajz.</p><p><br></p><p>Nutritivni deficit se takođe može lako &ldquo;postići&rdquo; ako gladuje&scaron; ili si na <strong>restriktivnoj dijeti</strong>, &nbsp;pa u tom slučaju predlaže se da jede&scaron; nutritivno bogatu, a kalorijski &nbsp;siroma&scaron;niju hranu &ndash; &scaron;to podrazumeva svu iznad nabrojanu hranu uz manje &nbsp;ili ni malo procesuirane hrane koja je obično (ne uvek) nutritivno &nbsp;slabija a kalorijski jača. Ukoliko to ne uspeva&scaron; ishranom &ndash; uzmi &nbsp;suplement!</p><h3><br></h3><p><img src=\"https://i2.wp.com/veganportal.org/wp-content/uploads/2019/02/veganplate2.jpg?resize=300%2C265&ssl=1\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p><h3><span style=\"font-size: 18px;\">Jedi nutritivno bogatu i raznovrsnu hranu</span><br><br></h3><p>&ldquo;Nije isto ako jede&scaron; svaki dan pice i paste, ili jede&scaron; mahunarke, &nbsp;voće, povrće, žitarice, po mogućstvu integralne i semenke. Razlika je u &nbsp;broju mikronutrijenata i odnosu makronutrijenata koje unosi&scaron; u svoje &nbsp;telo.&rdquo;</p><p>Kao savet jedna veganka je podelila svoj spisak obaveznih namirnica &nbsp;koje danas ima u kući, a nije ih ranije koristila: tofu, humus, tempeh, &nbsp;sočivo, soja, čia semenke, bademi, le&scaron;nici, suncokret, leblebije, &nbsp;indijski orasi, brazilski orasi, semenke konoplje, semenke bundeve, &nbsp;ekspandirana riža i proso, palenta, ovsene pahuljice, semenke lana, &nbsp;biljna mleka, mladi spanać, kikiriki puter, suncokret puter, kakao prah. &nbsp;U zamrzivaču uvek smrznute vi&scaron;nje, jagode i maline, a na stolu dve &nbsp;korpe pune voća.&nbsp;</p><p>Uzmi po koju ideju sa ovog spiska pri sledećoj poseti marketu ili &nbsp;prodavnici zdrave hrane, ali znaj da je frižider svakog vegana različit i &nbsp;da nisu sve bobice, semenke i žitarice apsolutno neophodne, ali &nbsp;zanimljive su i nutritivno korisne, pa za&scaron;to da ne ili za&scaron;to da da, na &nbsp;tebi je.</p><p>&nbsp;</p><h3><span style=\"font-size: 18px;\">Postepeno ili naglo</span><br><br></h3><p>Svi se slažu u jednom &ndash; kako god to može&scaron; i želi&scaron;. Od dobronamernih &nbsp;vegana dobiće&scaron; savet da ako pogre&scaron;i&scaron;, uvek može&scaron; da poku&scaron;a&scaron; ponovo, da &nbsp;postepeno izbacuje&scaron; životinjske proizvode, da prvo bude&scaron; vegetarijanac, &nbsp;da ne brza&scaron; i ne bude&scaron; gladan, da postepeno uči&scaron;, da ispituje&scaron; nove &nbsp;ukuse pre nego &scaron;to se potpuno odrekne&scaron; starih, da isprobava&scaron; iste ukuse &nbsp;na vi&scaron;e načina, da bude&scaron; strpljiv prema svojim receptorima za ukus, oni &nbsp;se menjaju u zavisnosti od toga &scaron;ta ih stimuli&scaron;e. Sve u svemu da bude&scaron; &nbsp;istrajan, strpljiv i da se ne obeshrabruje&scaron;, da podr&scaron;ku potraži&scaron; od &nbsp;iskusnijih bez straha od osude &scaron;to nisi savr&scaron;eno ljudsko biće &ndash; niko &nbsp;nije! <strong>Ne dozvoli da savr&scaron;enstvo bude neprijatelj dobrom (napretku)!</strong></p><p>&nbsp;</p><h3><span style=\"font-size: 18px;\">Razlika između &ldquo;sadrži&rdquo; i &ldquo;može da sadrži&rdquo;</span></h3><p>&nbsp;</p><p>Mleko i jaja, između ostalih, spadaju u grupu čestih alergena, i &nbsp;zakonska je obaveza proizvođača da na deklaracijama istakne moguće &nbsp;prisustvo tragova mleka i jaja. &ldquo;May contain&rdquo; ne znači da se neki &nbsp;sastojak po recepturi nalazi u proizvodu, ali znači da može doći do &nbsp;kroskontaminacije jer se na istoj proizvodnoj liniji mogu naći i neki &nbsp;drugi proizvodi koji u svom sastavu imaju neke od &ldquo;zabranjenih&rdquo; &nbsp;sastojaka. Etički gledano, ne postoji problem da se proizvodi sa ovom &nbsp;napomenom konzumiraju, oni se smatraju veganskim.</p><p>&nbsp;</p><h3><span style=\"font-size: 18px;\">Prijatelji, kolege, rodbina</span></h3><p>&nbsp;</p><p>Neki vegani doživeli su mnoga razočarenja prelaskom na veganski način &nbsp;života, a neki su mnoge prijatelje i izgubili. Ovo može da se desi iz &nbsp;vi&scaron;e razloga i na vi&scaron;e načina. Moguće je da su ti prijatelji bili &nbsp;antiveganski &scaron;upci (pardon my french) ili si previ&scaron;e zahtevan i strog &nbsp;prema svom okruženju. U prvom slučaju smatraj da si na dobitku, a u &nbsp;drugom predlažem da pročita&scaron; za&scaron;to <a href=\"https://veganportal.org/2018/03/26/ne-zameraj-drugima-karnizam/\"><strong>da ne zamera&scaron; bliskim ljudima karnizam</strong></a>.</p><p>&nbsp;</p><p>Za početak, bilo bi sjajno da se ne upu&scaron;ta&scaron; u rasprave i natezanja &nbsp;oko veganstva. Uživaj u druženju i deli trpezu kao i do sada sa dragim &nbsp;ljudima, to je odlična prilika da oni probaju neku novu klopu, a da ti &nbsp;nastavi&scaron; da uživa&scaron; u druženju. Jedina razlika je sada sadržina tvog &nbsp;tanjira, koja ne treba da vam se me&scaron;a u postojeća prijateljstva i &nbsp;rodbinske odnose. Imaj na umu da ni životinjama ni veganstvu ne koristi&scaron; &nbsp;izop&scaron;ten iz dru&scaron;tva.</p><p>&nbsp;</p><h3><span style=\"font-size: 18px;\">Želja za mesom, sirom, jajima</span></h3><p>&nbsp;</p><p>Potpuno je normalno i očekivano da se nakon vi&scaron;egodi&scaron;njeg, ili čak &nbsp;vi&scaron;edecenijskog uživanja u nekim jelima povremeno prisetimo i poželimo &nbsp;stare ukuse. Neki vegani kažu da im se želja smanjila vremenom, a nekima &nbsp;se ipak to nije dogodilo čak ni nakon vi&scaron;e godina veganstva. U te svrhe &nbsp;vegani ti preporučuju da isproba&scaron; zamene i imitacije poznatih ukusa, &nbsp;proizvoda i jela &ndash; nisi manje vegan ako ih jede&scaron;, a veganstvo ne treba &nbsp;da ti bude teret i mučenje. Istražuj, isprobavaj, eksperimenti&scaron;i. Ako &nbsp;putuje&scaron; u inostranstvo opskrbi se odličnim imitacijama životinjskih &nbsp;proizvoda. Nadam se da ćemo ih uskoro i mi imati na trži&scaron;tu, a to zavisi &nbsp;isključivo od potražnje, stoga POTRAŽUJ!</p><p>&nbsp;</p><h3><span style=\"font-size: 18px;\">Ako ne&scaron;to ne zna&scaron;, pitaj!</span></h3><p>&nbsp;</p><p>Veganska zajednica je na facebook-u kao i u životu sve jača i &nbsp;zdravija na svim prostorima gde se razume hrvatski, srpski, bo&scaron;njački i &nbsp;crnogorski jezik.<br>Za pitanja o nutricionizmu pitaj u grupi <a href=\"https://www.facebook.com/groups/135315593778565/\">Pitajte vegan savetnika.</a><br>Za pitanja o fitnesu i sportu pitaj u grupi <a href=\"https://www.facebook.com/groups/1489498031310597/\">Snaga bilja.</a><br>Za &nbsp;sva živa pitanja o jelima, proizvodima, etici ili ako samo poželi&scaron; da &nbsp;podeli&scaron; svoja razmi&scaron;ljanja i poveže&scaron; se sa istomi&scaron;ljenicima tu su grupe <a href=\"https://www.facebook.com/groups/734379246610659/\" rel=\"noreferrer noopener\" target=\"_blank\">Veganska zajednica</a> i <a href=\"https://www.facebook.com/groups/vegesrbija/\">Vege Srbija</a>.</p><p>&nbsp;</p><p>Ne zaboravi zbog koga čini&scaron; ove korake, ne zaboravi da je svaki tvoj &nbsp;odlazak u radnju tvoj glas za bolji svet za životinje, ne zaboravi da &nbsp;nisi sam i da je tvoja odluka značajna &scaron;ta god ti drugi govorili, ne &nbsp;zaboravi da je svaka dru&scaron;tvena promena počela sa malim brojem odlučnih &nbsp;ljudi!</p>', 16, NULL, '2019-05-13', 1, 2, NULL, 'veganstvo-saveti-za-pocetnike', '', 25),
(12, 'Hleb i humus', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Sastojci:</span></p><ul><li>hleb</li><li>humus</li><li>po želji dodati paradajz, masline, neke semenke, biljno mleko...</li></ul>', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Hleb i humus su neizostavan deo veganske ishrane. Te&scaron;ko da ćete naći jednostavniji, a ukusniji doručak od ovog. Humusa ima raznih vrsta, a može se napraviti i domaći, ba&scaron; kao i hleb. Za hleb treba uvek izabrati neki od integralnog bra&scaron;na i voditi računa o sastojcima, po&scaron;to u neke od onih u kesama &scaron;to imaju rok trajanja mesec dana stavljaju surutku. Paradajz i masline nikad nisu na odmet, a i mleveni lan ili susam su dobar dodatak. Uz ljuti humus urnebes uvek dobro dođe i neko biljno mleko ili jogurt ako uspete da ga pronađete.</span></p>', 20, NULL, '2019-06-03', 1, 1, 1, 'hleb-i-humus', '2 minuta', 12),
(13, 'Magični lonac', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Sastojci:</span></p><ul><li>2 &scaron;argarepe</li><li>3, 4 krompira</li><li>&scaron;olja crvenog sočiva</li><li>1, 2 paradajza</li><li>50g sirove golice</li><li>rezanci ili pirinač po želji da pokupe vi&scaron;ak tečnosti</li><li>kari sos/začin</li><li>so, biber, aleva, kurkuma, korijander&hellip;</li></ul>', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>U &scaron;erpu sipati malo vode i dok se ona zagreva iseći &scaron;argarepe i ubaciti. Iseći krompir na kockice i ubaciti i njega. Dodati vode po potrebi da sve to pliva. Vodu po želji posoliti, a i ne mora. Ubaciti i druge začine po želji, moja preporuka su kurkuma i korijander. Kad provri to sve, smanjiti ringlu.</span></p><p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Nakon pola sata kuvanja ubaciti u to i jednu &scaron;olju crvenog sočiva. U blenderu izblendovati paradajz i golice. Ubaciti i to u lonac i nastaviti sa kuvanjem. U koliko želite gu&scaron;ću konzistenciju variva ubaciti i ne&scaron;to pirinča ili rezanaca (na slici su rezanci). Kad je sve mekano i izgleda gotovo dodajte i kari sos i sve izme&scaron;ajte. Prijatno!</span></p><p class=\"Standard\"><br></p><p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Napomena: Može se dodati i jo&scaron; raznog povrća npr. keleraba, celer...</span></p>', 43, 'lonac', '2019-06-03', 1, 1, 2, 'magicni-lonac', '60 minuta', 19),
(14, 'Jafa Torta', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Sastojci:</span></p><ul><li>300g mlevenog posnog keksa</li><li>biljno mleko</li><li>500ml voćnog soka od naradže</li><li>1 kesica agar agara</li><li>posni čoko puding</li><li>200g Menaž čokolade</li></ul>', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>1. U kalup za tortu ili običnu pravougaonu plastičnu posudu sipati keks u prahu i dodati otprilike malo mleka da to postane homogeno ali dovoljno čvrsto da se može napraviti od toga prvi sprat torte. Uvek je bolje dodavati po malo mleka nego sipati vi&scaron;e pa da vam postane previ&scaron;e mekana masa, onda morate jo&scaron; keksa da dodajete dok ne postane odgovarajuća. Kada je masa konzistencije slične plastelinu utabati je rukama i napraviti prvi sprat, to jest koru. Onda ovo sve smestiti u frižider dok se radi na drugom spratu.</span></p><p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>2. U &scaron;erpu odmeriti 500ml soka od narandže i staviti na ringlu na najjače da provri (verovatno ćete se osećati sme&scaron;no kad ovo budete radili, ali posle nekog vremena se naviknete). Sok me&scaron;ati da ne zagori. Kad provri sipati 1 kesicu agara, smanjiti temperaturu ringle i me&scaron;ati 2 minuta, a onda skloniti sa ringle i ostaviti da se ohladi. Posle nekih pola sata trebalo bi da je počelo da se hladi i zgu&scaron;njava, ako nije pričekajte jo&scaron; neko vreme. Kad vi&scaron;e nije vrelo i relativno je gustasto, sipajte to preko prvog sprata torte (onog od keksa) i opet ostavite u frižider ili jo&scaron; bolje zamrzivač da se ohladi. Tu će se i stvoriti želatinozna masa, tj srednji sloj jafe.</span></p><p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>3. U jednu veću posudu sipati vode do pola i ostaviti da provri. Kad provri, uzeti manju posudu, u nju nadrobiti 200g čokolade i spustiti je u veću posudu (znači celu manju posudu sa sve čokoladom staviti unutar veće posude u kojoj već vri voda). To malo me&scaron;ati dok se ne istopi, a kad se istopi (pazite da se sve istopi i da ne bude gusto, već da je ba&scaron; dobro istopljeno) dodati čoko puding. Sve ovo dobro prome&scaron;ati da se lepo sjedini i ako se srednji sloj stvrdnuo sipati preko njega i ostaviti u frižideru na neko vreme da se sve ohladi.</span></p>', 1, 'torta', '2019-06-03', 1, 1, 5, 'jafa-torta', '45 minuta ', 10),
(15, 'Šarena salata', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Sastojci:</span></p><ul><li>3 krompira</li><li>konzerva pasulja</li><li>konzerva kukuruza &scaron;ećerca (ili smrznut pa skuvati)</li><li>3 paradajza</li><li>15ak maslina</li><li>&scaron;olja pirinča, kinoe, prosa ili druge slične stvari po želji</li><li>humus i malo vode</li><li>50g kikirikija</li><li>so, biber, aleva, kurkuma, korijander&hellip;</li></ul>', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Krompir iseći na kockice, začiniti (posoliti, dodati alevu, origano...) po želji i peći u prethodno zagrejanoj rerni na 180-200 stepeni nekih 45 min (pogledajte kad vam se pričini da je gotov, uglavnom treba da promeni boju, prepoznaje se lako). Za to vreme staviti vodu da provri, i kad provri u njoj skuvati pirinač (može malo da se posoli). Iseći paradajz na sitne komade, prepoloviti masline i sipati u veću posudu. U istu posudu dodati i pasulj i kukuruz &scaron;ećerac. Kad se skuva pirinač, dobro ga procediti pa dodati i njega i odmoriti se dok se ne ispeče i krompir. Kad se ispeče krompir ubaciti i njega u istu posudu. U manju posudu odvojiti ka&scaron;iku humusa i dodati malo vode te sve to izme&scaron;ati da nastane razblažen humus iliti humus sos. Ovim preliti sastojke velike posude, dodati kikiriki i sve temeljno izme&scaron;ati. I eto super zdravog, super ukusnog ručka za tili čas.</span></p><p class=\"Standard\"><br></p><p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Napomena: Može se dodati i jo&scaron; raznih stvari npr. seckani spanać svež (ili blitva), sveža paprika ili bilo &scaron;ta &scaron;to nađete a čini vam se da neće biti lo&scaron;e...</span></p>', 29, NULL, '2019-06-03', 1, 1, 2, 'sarena-salata', '45 minuta', 3),
(16, 'Zelene američke palačinke', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Sastojci:</span></p><ul><li>spanać svež ili smrznut (kolko god, nikad dosta)</li><li>laneno jaje (3 ka&scaron;ičice mlevenog lana + 1dl vode)</li><li>&scaron;olja pirinčanog bra&scaron;na (ili nekog drugog po izboru)</li><li>opciono 1 sitno naseckan praziluk ili mladi luk srebrenjak</li><li>1 ka&scaron;ičica pra&scaron;ka za pecivo</li><li>1 ka&scaron;ičica soli</li><li>pola ka&scaron;ičice belog luka u prahu</li><li>biljno mleko ili voda po potrebi</li></ul>', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>U ča&scaron;i napraviti laneno jaje (pome&scaron;ati 1dl vode sa 3 ka&scaron;ike mlevenog lana) i ostaviti 10ak minuta da odstoji. U blender staviti spanać (ako je smrznut pre toga ga otopiti u tiganju), laneno jaje, bra&scaron;no i sve ostale sastojke i izblendovati. Cilj je malo gu&scaron;ća smesa za palačinke. Po potrebi dodavati vode/biljnog mleka ako je previ&scaron;e gusto ili jo&scaron; bra&scaron;na ako je previ&scaron;e retko. Optimalnu konzistenciju postićićete vežbom. Tiganj podmažite malo uljem, stavite trunku ulja i razmažite ubrusom ili toalet papirom. Kad se zagreje sipati smesu za palačinke i peći par minuta, a onda prevrnuti na drugu stranu i opet peći nekoliko minuta. I tako dok ne potro&scaron;ite svu smesu. <br>Od ovih palačinkica mogu se na primer praviti super sendviči sa humusom i paradajzom. Izmežu 2 komada stavite kri&scaron;ku paradajza i humus, a možete i menjati sastojke po želji kao i u svim receptima.</span></p>', 30, 'zelene', '2019-06-03', 1, 1, 3, 'zelene-americke-palacinke', '30 minuta', 17),
(17, 'Keks i mleko', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Sastojci:</span></p><ul><li>keks</li><li>mleko</li><li>po želji dodati bananu ili neko drugo voće, chia seme ili neke ora&scaron;aste plodove, kakao&hellip;</li></ul>', '<p class=\"Standard\"><span style=\'font-size:16px;font-family:\"Liberation Serif\",serif;\'>Jo&scaron; jedan od ultra lakih recepata za doručak jeste keks i mleko. Ubacite posni keks i biljno mleko u blender, izblendujete, popijete i to je to. Posle nekoliko poku&scaron;aja skontaćete željeni odnos keks:mleko. Sirovi kakao prah je super dodatak jer sadrži gomilu nutritienata (npr. jedna ka&scaron;ika sirovog kakaa može da zadovolji preporučenu dnevnu količinu gvožđa), kao i ora&scaron;asto voće koje će vas drže održati u stanju sitosti. Uvek možete dodati i neko voće (banana, malina, jagoda ili bilo &scaron;ta &scaron;to imate, a deluje kao da neće biti užasna kombinacija).</span></p>', 35, NULL, '2019-06-03', 1, 1, 1, 'keks-i-mleko', '2 minuta', 12);

-- --------------------------------------------------------

--
-- Table structure for table `content_type`
--

CREATE TABLE `content_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_type`
--

INSERT INTO `content_type` (`id`, `name`, `description`) VALUES
(1, 'Recepti', 'Recepti'),
(2, 'Clanci', 'opis');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `image`) VALUES
(1, 'torta', 'torta1.jpg'),
(2, 'torta', 'torta2.jpg'),
(21, 'zelene', '1.jpg'),
(22, 'zelene', '3.jpg'),
(23, 'zelene', '2.jpg'),
(24, 'zelene', '5.jpg'),
(25, 'zelene', '4.jpg'),
(26, 'lonac', 'lonac1.jpg'),
(27, 'lonac', 'lonac2.jpg'),
(28, 'lonac', 'lonac3.jpg'),
(29, 'lonac', 'lonac4.jpg'),
(30, 'lonac', 'lonac7.jpg'),
(31, 'lonac', 'lonac6.jpg'),
(32, 'lonac', 'lonac5.jpg'),
(33, 'lonac', 'lonacfinal.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `filename`, `created_at`) VALUES
(1, 'torta1.jpg', '0000-00-00'),
(2, 'torta2.jpg', '0000-00-00'),
(5, 'pirinac.jpg', '0000-00-00'),
(11, 'makarone.jpg', '0000-00-00'),
(16, 'takos.jpg', '2019-05-13'),
(18, 'ulje.jpg', '2019-05-16'),
(19, 'img_4823.png', '2019-05-16'),
(20, 'humus.jpg', '2019-06-03'),
(21, '2.jpg', '2019-06-03'),
(22, '5.jpg', '2019-06-03'),
(23, '6.jpg', '2019-06-03'),
(24, '4.jpg', '2019-06-03'),
(25, '1.jpg', '2019-06-03'),
(26, '7.jpg', '2019-06-03'),
(27, 'final.jpg', '2019-06-03'),
(28, '3.jpg', '2019-06-03'),
(29, 'sarenasalata.jpg', '2019-06-03'),
(30, '1.jpg', '2019-06-03'),
(31, '3.jpg', '2019-06-03'),
(32, '2.jpg', '2019-06-03'),
(33, '5.jpg', '2019-06-03'),
(34, '4.jpg', '2019-06-03'),
(35, 'keks i mleko.jpg', '2019-06-03'),
(36, 'lonac1.jpg', '2019-06-04'),
(37, 'lonac2.jpg', '2019-06-04'),
(38, 'lonac3.jpg', '2019-06-04'),
(39, 'lonac4.jpg', '2019-06-04'),
(40, 'lonac7.jpg', '2019-06-04'),
(41, 'lonac6.jpg', '2019-06-04'),
(42, 'lonac5.jpg', '2019-06-04'),
(43, 'lonacfinal.jpg', '2019-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `surname`, `email`, `avatar`) VALUES
(1, 'Rene', 'Vegan', 'rene@vegan.rs', 'rene.jpg'),
(2, 'Boris', 'Dovečer', 'boris.dovecer@gmail.com', 'boris.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `frequency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `frequency`) VALUES
(36, 'hleb', 1),
(37, 'humus', 1),
(38, 'varivo', 1),
(39, 'krompir', 2),
(40, 'šargarepa', 1),
(41, 'čorba', 1),
(42, 'kari', 1),
(43, 'crveno sočivo', 1),
(44, 'jafa', 1),
(45, 'torta', 1),
(46, 'čokolada', 1),
(47, 'pomorandža', 1),
(48, 'keks', 2),
(49, 'mleko', 2),
(50, 'agar', 1),
(51, 'žurka', 1),
(52, 'salata', 1),
(53, 'miks', 1),
(54, 'pasulj', 1),
(55, 'pirinac', 1),
(56, 'masline', 1),
(57, 'kikiriki', 1),
(58, 'paradajz', 1),
(59, 'kukuruz', 1),
(60, 'palačinke', 1),
(61, 'spanać', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tag_content`
--

CREATE TABLE `tag_content` (
  `tag_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_content`
--

INSERT INTO `tag_content` (`tag_id`, `content_id`) VALUES
(36, 12),
(37, 12),
(38, 13),
(39, 13),
(40, 13),
(41, 13),
(42, 13),
(43, 13),
(44, 14),
(45, 14),
(46, 14),
(47, 14),
(48, 14),
(49, 14),
(50, 14),
(51, 14),
(52, 15),
(53, 15),
(39, 15),
(54, 15),
(55, 15),
(56, 15),
(57, 15),
(58, 15),
(59, 15),
(60, 16),
(61, 16),
(48, 17),
(49, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'rene', 'rene@vegan.rs', ''),
(2, 'boris', 'boris.dovecer@gmail.com', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image` (`image`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `ct_id` (`ct_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `gallery` (`gallery`);

--
-- Indexes for table `content_type`
--
ALTER TABLE `content_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_content`
--
ALTER TABLE `tag_content`
  ADD KEY `tag_id` (`tag_id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `content_type`
--
ALTER TABLE `content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`);

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`image`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_ibfk_2` FOREIGN KEY (`ct_id`) REFERENCES `content_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_ibfk_4` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_ibfk_5` FOREIGN KEY (`gallery`) REFERENCES `gallery` (`title`) ON DELETE CASCADE;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `tag_content`
--
ALTER TABLE `tag_content`
  ADD CONSTRAINT `tag_content_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
