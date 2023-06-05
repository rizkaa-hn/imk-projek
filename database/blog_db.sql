-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2023 at 04:38 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '1'),
(2, 'admin2', '3'),
(4, 'admin3', '3');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `admin_id`, `user_id`, `user_name`, `comment`, `date`) VALUES
(1, 1, 2, 1, 'rr', 'RIP', '2022-12-01'),
(3, 1, 2, 1, 'rr', 'thank you', '2023-05-23');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `admin_id`, `post_id`) VALUES
(5, 1, 2, 1),
(6, 3, 2, 1),
(7, 4, 2, 4),
(8, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `category` varchar(25) NOT NULL,
  `image` varchar(20) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `admin_id`, `name`, `title`, `content`, `category`, `image`, `date`, `status`) VALUES
(1, 2, 'admin2', 'Captain America director Albert Pyun dies in hospice care aged 69', 'Sci-fi and action movie director Albert Pyun has died aged 69 following a long battle with dementia and multiple sclerosis.\r\n\r\nThe filmmaker, who was behind the likes of Captain America (1990) and Cyborg (1989), died on Saturday, his wife, producer Cynthia Curran, announced.\r\nSharing the heartbreaking news on Facebook, she penned: â€˜Albert Pyun passed away Saturday, November 26, at 5:50 pm.\r\n\r\nâ€˜I sat with him for his last breath that sounded like he was releasing the weight of the world.â€™\r\n\r\nPyun spent his final days in a hospice with his wife reading him personal messages from fans.\r\n\r\nEarlier in the week, she wrote on Facebook: â€˜Albert is spending time reaching up and looking up, like he is looking through a window to the other side. He has wonder in his face when he looks up.\r\n\r\nâ€˜This indicates the end is growing near.â€™\r\n\r\nShe added: â€˜I am learning how to keep him calm and out of pain so he can get gradual sneak preview of what lies ahead.â€™\r\n\r\nPyun announced in 2013 that he had been diagnosed with multiple sclerosis, a life-long condition that, according to the NHS website, can affect the brain and spinal cord, causing a wide range of potential symptoms, including problems with vision, arm or leg movement, sensation or balance.\r\n\r\nDuring his career, Pyun directed over 20 feature films in the 90s, including the Marvel movie Captain America, starring Matt Salinger, Ronny Cox, and Ned Beatty.\r\n\r\nTributes have been pouring in for the late star since the news broke.\r\nOne wrote: â€˜Woke up to the news that Albert Pyun is no longer with us. Dude was a genuine outsider artist/trash genre cinema legend who clearly loved making movies right up until the end and did more with his tiny budgets than those with 20x his resources were doing. RIP king.â€™', 'Captain America', 'albert.jpg', '2022-11-10', 'active'),
(2, 1, 'admin', 'Hawkeye Is A Good Way To Ease Into The Holidays', 'Iâ€™m not sure if itâ€™s intentional or by design, but Hawkeye is a series that can really help someone ease into the holidays. Meaning that if you arenâ€™t the type of person who jumps headfirst into merriment and Christmas carols as soon as the Thanksgiving dinner is cleared, this series is a good way to slowly prep for it. \r\n\r\nI think part of what makes that possible is that Hawkeyeâ€™s story features Clint slowly working through this adventure while trying to ensure he can wrap things up in enough time to get home to his family for Christmas. As such, the episodes are backdropped by a world preparing for the holidays, and while thatâ€™s not really the focal point of Hawkeye, that almost makes it better in the context of people gearing up to get in the holiday spirit. \r\n\r\nSure, the holidays are a time for holiday movies, but I think thereâ€™s something to be said for the casual holiday thriller. Hawkeye isnâ€™t the only superhero project that takes place during Christmas, but it is one of the most subtle and one that will help anyone ease into that classics, it ultimately gets better at the end.', 'Hawkeye', 'hawkeye.jpg', '2022-11-01', 'active'),
(3, 1, 'admin', 'Hawkeye&#39;s Series Has Only Gotten More Relevant Since Its Release', 'It may be a year old, but itâ€™s fair to say that Hawkeye is about just as relevant, if not more so, in the Marvel Cinematic Universe these days. Marvel is working on a series for Echo, who, of course, has strong ties to the Daredevil franchise and his iconic nemesis Kingpin. Back when the series first aired, we didnâ€™t know a lot about Daredevilâ€™s future in the MCU. Thatâ€™s because Charlie Coxâ€™s Matt Murdock wasnâ€™t officially confirmed for this universe until Spider-Man: No Way Home, which premiered towards the end of Hawkeye. \r\n\r\nSince that epic week in Marvel history, weâ€™ve not only learned that Matt Murdock is back, but heâ€™s getting his own series, Daredevil: Born Again. Weâ€™ve also seen that Matt is a bit different than he was in the Netflix show thanks to his appearances in She-Hulk. Of course, he appeared in a series with a comedic slant, so thereâ€™s reason to believe his personality might be a bit different, but how does his latest portrayal impact what Hawkeye showed us of Kingpin? \r\n\r\nIn case folks donâ€™t remember, Wilson Fisk had a lot more going on than a new sense of style in Hawkeye. He was a good deal more durable than he was in the past live-action series and looked to be able to take a ton of punishment without being slowed down. It seemed like a lot of overkill for a villain who would take on a street-level hero, or at least thatâ€™s what I thought until I saw She-Hulk. \r\n\r\nNow that weâ€™ve seen that the Matt Murdock of the MCU is doing flips down the sides of buildings and other things of that nature, Kingpinâ€™s upgrade in Hawkeye makes sense. Had he remained the character he was in the Netflix iteration, Wilson Fisk wouldâ€™ve gotten his ass whooped by the new Daredevil like it was nothing. Of course, none of this was apparent at the time of the original Hawkeye airing, so if stuff like that is apparent now, Iâ€™d love to see what else makes more sense or what folks might pick up on watching again. At the very least, fans should make sure theyâ€™re up to date on Kate Bishop, because sheâ€™ll likely be a fairly significant character in the franchise in the years to come. ', 'Hawkeye', 'hawkeye1.jpg', '2022-11-29', 'active'),
(4, 2, 'admin2', 'Chris Hemsworth Feels Next &#39;Thor&#39; Film May Be His Last', 'After over a decade of service to the Marvel Cinematic Universe, the longest-serving Avenger remaining thinks it might soon be time to hang up the cape, the magic hammer and the axe forged from the heart of a dying star. Chris Hemsworth has told Vanity Fair that, after four standalone films as the God of Thunder, he might soon be calling time on his role as Thor, saying:\r\n\r\nâ€œI feel like weâ€™d probably have to close the book if I ever did it again, you know what I mean? I feel like it probably warrants that. I feel like itâ€™d probably be the finale, but thatâ€™s not based on anything anyoneâ€™s told me or any sort of plans. You have this birth of a hero, the journey of a hero, then the death of a hero, and I donâ€™t know â€” am I at that stage? Who knows?â€\r\n\r\nHemsworth admitted that, in order for him to leave his family for filming, it would need to be a &#34;positive experience&#34; - however, he did add that would be &#34;completely open&#34; to another Thor film with Taika Waititi if there was &#34;something unique and fresh and unexpected to do with the character and the world. Iâ€™ve always loved the experience. Iâ€™ve been very thankful Iâ€™ve been able to do something different each time.&#34;\r\n\r\nHe went on to add: â€œNow, if somethingâ€™s going to pull me away from my family and my kids, itâ€™s got to be a positive, constructive, collaborative experience. I shot with George Miller on the new prequel to â€˜Fury Roadâ€™ [â€˜Furiosaâ€™], part of the â€˜Mad Maxâ€™ saga, and I said to my agent, â€˜Thatâ€™s where I want to spend my work hours; with someone who is kind and collaborative and interesting.&#39;â€\r\n\r\nhe climax to Thor: Love & Thunder, which released over the summer, did feature the note at the end of the credits detailing that &#34;Thor will return&#34; - something that surprised both star and director. However, given Marvel&#39;s propensity for multiversal shenanigans, Thor doesn&#39;t ever have to mean Hemsworth. The Disney+ show, Loki, introduced the concept of alternate Lokis across the multiverse, including Kid Loki. With the end to Love & Thunder featuring a passing of the torch, in a manner of speaking, to Thor&#39;s newly-adopted daughter, Love (played by Hemsworth&#39;s daughter, India), the future seems both murky and clear in the same instance.\r\n\r\nMarvel is now beginning to transition to younger characters, ahead of a move to Phases 5 and 6. Peter Parker, once the kid of the group, is starting to look like a wizened veteran at this point. Who&#39;s to say we won&#39;t be getting a teenage Prince of Asgard any time soon?\r\n\r\nIn the meantime, should audiences see Hemsworth return to the role, let&#39;s hope they appreciate the remaining time he will dedicate to Thor.', 'Thor', 'thor.jpg', '2022-11-28', 'active'),
(5, 2, 'admin2', 'Itâ€™s Going To Take A Moment For Marvel To Kick Back Up In 2023', '2022 has been a great year for Marvel, and 2023 looks like itâ€™ll be a blast as well considering how awesome Ant-Man: Quantumania looks. With all that being said, itâ€™s going to take a minute to get the party rolling, as that next movie isnâ€™t set to premiere until mid-February. That means from now until then, audiences will have to suffer through a couple of months where thereâ€™s a lack of Marvel programming, which is a bit of a bummer. \r\n\r\nSure, we just received The Guardians of the Galaxy Holiday Special, but thereâ€™s only so much to pull from that roughly 45-minute adventure. As fun as it may be, it doesnâ€™t have the meat to it that a show like Hawkeye does. Thatâ€™s not a knock on the hilarious special, but I doubt anyone will be able to or want to binge that this holiday season without searching for more superhero fun. \r\n\r\nHawkeye may not be considered by many to be the best of the MCU shows, but Iâ€™d be willing to go on the record and call it one of the most underrated. Iâ€™d also argue that it may age better than most the shows considering what we know now, and that anyone who was lukewarm on the show or hadnâ€™t had a chance to see it yet should certainly give it a chance this holiday season. \r\n\r\nAnyone with a Disney+ subscription can stream Hawkeye right now on Disney+(opens in new tab). Of course, be sure to hold onto that subscription in the new year for continued access to the best Marvel shows and a lot of new ones that are still on the way. ', 'Hawkeye', 'hawkeye2.jpg', '2022-11-29', 'active'),
(6, 1, 'admin', 'Chris Hemsworth Says a Potential THOR 5 Would Need to Be &#34;Completely Different&#34; From the Las', 'Chris Hemsworth is best known for playing Thor Odinson in the MCU. The first two movies were serious and somber in nature, and in my opinion, a little boring. Thor was able to come out of his shell a bit in the Avengers movies, and then we really got to see the fun side of him in Thor: Ragnarok and Thor: Love and Thunder. Now we arenâ€™t sure what the fate of Thor is, without any films coming up on the horizon for the superhero. But Hemsworth has feelings about what they should look like if he does return.\r\n\r\nIn a recent interview with Josh Horowitz on the Happy, Sad, Confused podcast, Hemsworth was asked point-blank where Thor Odinson&#39;s story should go next. He responded:\r\n\r\n&#34;I mean you look at Thor one and two, they were quite similar. Ragnarok and Love & Thunder: similar. I think it&#39;s just about re-inventing it. And I&#39;ve had such a unique opportunity even with [Avengers] Infinity War and Endgame to do very drastic things with the character; I enjoy that, I like keeping people on their toes, it keeps me on my toes, keeps me invested. And I&#39;ve said this before: when it becomes too familiar, I think there&#39;s a risk of getting lazy I think, like &#39;Ah, I know what I&#39;m doing,&#39; you know? So I don&#39;t know â€“ again, I don&#39;t even know if I&#39;m invited back. But if I was, I think it&#39;d have to be a drastically different version â€“ tone, everything. Just for my own sanity [laughs].&#34;\r\n\r\nThat makes sense, as Hemsworth has been playing this character over the past 11 years, and he doesnâ€™t want it to get stagnant. But I do wonder what a new version of the character would look like. What do you think?', 'Thor', 'thor1.jpg', '2022-11-30', 'active'),
(7, 1, 'admin', 'Black Widow&#39;s Taskmaster May Become Marvel&#39;s Most Powerful Avengers Villain', 'Black Widow&#39;s Taskmaster proved to be an excellent fighter and a nearly unbeatable foe. Unlike in the comics, however, the masked opponent&#39;s ability to mimic numerous fighting styles appears to stem from their suit&#39;s advanced technology. And that could directly lead to the Marvel Cinematic Universe debut of another villainous character: the Super-Adaptoid, one of The Avengers&#39; most powerful foes.\r\n\r\nTreated as an elite agent in service of the Red Room, Black Widow&#39;s Taskmaster was a formidable opponent, capable of copying her every move, as well as those of her fellow Avengers. The film&#39;s big twist came when it was revealed Taskmaster was actually Antonia Dreykov, daughter of the Red Room&#39;s director, believed to have died years earlier. A combination of analysis technology and her father&#39;s mind control allowed Antonia to become a perfect mimic. That same technology could well lay the foundation for the Super-Adaptoid.', 'Black Widow', 'post.jpeg', '2022-12-02', 'active'),
(8, 1, 'admin', 'IRON MAN Producer Describes Deleted Scenes From the Film That Kevin Feige Says Should Never Be Relea', 'The 2008 movie Iron Man was Marvelâ€™s kickoff to what went on to become a worldwide movie empire known to fans as the Marvel Cinematic Universe. The film introduced us to Tony Stark, aka Iron Man (Robert Downey Jr.), and what we expect from every Marvel film now, the post credits scene. This one in particular introduced S.H.I.E.L.D. Agent Nick Fury (Samuel L. Jackson), who gave us the notion that we were about to get deep into the world of superheroes. It was awesome! \r\n\r\nBut the film was the first of its kind in this new extended superhero network, and while it was definitely thinking ahead, it still had some rough edges to smooth out. And apparently one of those rough patches was a couple of deleted scenes that have never been released. \r\n\r\nProducer Jeremy Latcham recently sat down with ScreenRant to talk about his latest film, Dungeons & Dragons: Honor Among Thieves, and he talked about these never-before-seen scenes, saying:\r\n\r\n&#34; There are still three or four deleted scenes from [Iron Man] that I don&#39;t think will ever be released because they were so bad. I remember Kevin saying to me in 2012, when I was like, &#34;Should we put the Abu doing laundry deleted scenes out?&#34; And Kevin was like, &#34;No. We can never put out Abu doing laundry. People will know we don&#39;t know what we&#39;re doing. It&#39;ll be embarrassing if they see these scenes.&#34; But there was a whole runner in Iron Man where Tony Stark was doing laundry and I don&#39;t think they&#39;ve ever come out. &#34;\r\n\r\n&#34;Someone should look into it, but I don&#39;t think they&#39;ve ever been seen. Tony is doing laundry for the captors, but he&#39;s really breaking the washing machine and stealing parts from it to build the Mark 1 suit. It&#39;s so absurd. It&#39;s wild.&#34;\r\n\r\nThose scenes actually donâ€™t sound so bad. I wonder why MCU boss Kevin Feige is so hung up on them. They donâ€™t sound incredible or anything, but his disdain for them makes me curious as to just how bad they are! Maybe we will see them someday, but by the sound of it, it wonâ€™t be anytime soon.', 'Iron Man', 'ironman1.jpg', '2023-05-23', 'active'),
(9, 4, 'admin3', 'Captain America: New World Order Set Photo Reveals Sam Wilson&#39;s New Suit', 'Arecent Captain America: New World Order set photo has given fans a look at what seems to be a new suit for the Marvel Cinematic Universeâ€™s Sam Wilson.\r\n\r\nWhat does the new Captain America suit look like?\r\n\r\nThe set photos show a new Captain America suit that looks more in line with Steve Rogersâ€™ Captain America: The Winter Soldier outfit. In the Disney+ series The Falcon and the Winter Soldier, Sam wore a red, white, and blue Captain America suit that paralleled his comic look, though whether or not this new primarily blue costume will completely replace the original look in the upcoming sequel is currently unknown.\r\n\r\nCaptain America: New World Order will be directed by Julius Onah from a screenplay written by The Falcon and the Winter Soldier head writer Malcolm Spellman and Dalan Musson. The film features Anthony Mackie reprising his role as Sam Wilson, who has now officially taken on the mantle of the MCU&#39;s new Captain America.\r\n\r\nMackie will be joined by returning The Falcon and the Winter Soldier stars Danny Ramirez and Carl Lumbly, who are once again playing the roles of Joaquin Torres and Isaiah Bradley, respectively, as well as MCU newcomer Shira Haas as Sabra.', 'Captain America', 'ca1.png', '2023-05-23', 'active'),
(10, 4, 'admin3', 'The Incredible Hulk marks 61 years in Marvel Cinematic Universe, fans celebrate', 'THE FULL TOUR\r\n\r\nThis website enables enthusiasts to gain a better understanding of the Hulk. Apart from an itemized account of his biography including details such as occupation, known relatives, and superhuman powers, it mentions the physical characteristics, personality traits, and a timeline of significant events. The site acts as a baseline for fans to delve into more details through hyperlinks of comic collectors and comic price guides. \r\n\r\nFUN SPIN\r\n\r\nThis profile belongs to a digital creator under the alias Green Scar and acts as a portal for Hulk fans to engage in discourse through his posts. The artist brings forth nuances and sequences from specific Marvel comics and provides a creative spin on them through his captivating illustrations. This account is a must-visit for Marvel veterans to connect with other members of the community and bond over shared opinions. They can also battle it out over conflicting theories.\r\n\r\nHULK&#39;S WORLD\r\n\r\nAn elaborate encyclopaedia that explores multiple aspects of The Incredible Hulk listed in comics, films, TV shows, books, and games. Besides the general details, the community website has several unique features such as interactive maps that allow fans to create maps inspired by the world of Hulk. Fans can explore different versions of the anti-hero such as Red Hulk, Ravage, Devil Hulk, and other related characters such as Ironclad and David Banner. The fandom can also engage in interactions through tweet-like systems and solve their doubts and queries.  \r\n\r\nFANS ACROSS THE AGES\r\n\r\nThis website provides fans with posters relating to multiple events and belonging to different eras. Additionally, commentary is usually provided to add context to the posters. For fans who want to understand The Incredible Hulk from  its origin, the site also displays rare old school ads from 1972 and the creator regularly holds a contest called Guess that Panel within which fellow fans can post the series and issue number of the comic book represented.      ', 'Hulk', 'hulk1.jpeg', '2023-05-23', 'active'),
(11, 2, 'admin2', 'How Tony Stark became Marvelâ€™s most authentic, relatable hero ', '&#34;I am Iron Man.â€ Four words that changed the superhero film genre for good. With 2008â€™s Iron Man, director Jon Favreau and Marvel Studios gave audiences something theyâ€™d rarely seen before on the big screen: a superhero who doesnâ€™t hide their identity. For decades, the superhero was a caped silhouette, standing tall, god-like. But in recent years the Marvel Cinematic Universe has offered characters that both complement and complicate that image.\r\n\r\nIron Man, aka Tony Stark, made his solo comic book outing in 1968â€™s â€˜The Invincible Iron Manâ€™. In contrast to the character depicted in this series, the films show a complex, multi-faceted Stark who is anything but invincible. At a time when mental health is being discussed more openly than ever before, with one in six young people likely to experience anxiety and depression at some point in life, imperfect heroes couldnâ€™t have come at a better time.\r\n\r\nIn Favreauâ€™s Iron Man, after inheriting Stark Industries from his late father, our hero is brought face to face with the horrifying global impact of his companyâ€™s work. When he is kidnapped and forced to build a devastating weapon, he is made to see the realities of how he made his living. It was while being held hostage that he designed his first Iron Man suit as a means of escape.\r\n\r\nStarkâ€™s anxiety manifests itself as a need to be in complete control. He laments to Pepper Potts (Gwyneth Paltrow) in Iron Man 3, â€œYou experience things, and then theyâ€™re over, and you still canâ€™t explain them.â€ As an engineer, he breaks practical problems down into smaller ones that he can solve piece by piece. Itâ€™s much harder to do that with his mind. Stark canâ€™t process a problem he canâ€™t fix with a few metal pieces or wires, and he runs from this realisation his whole life.\r\n\r\nIn Iron Man 3, Stark has his first anxiety attack. The film directly follows the events of The Avengers, during which Stark flies into a wormhole in New York City to destroy it with a missile. As he enters the wormhole, J.A.R.V.I.S. suggests that he call Pepper; Stark knows what this means and is fully prepared to say goodbye.\r\n\r\nThis experience plagues him throughout the subsequent films. He feels completely unprepared, believing that if he faces a threat on that scale again he will let everyone down. Colonel Rhodes (Don Cheadle) informs Stark of a recent bombing but, as he does so, the background noise around Stark begins to build up, triggering flashbacks to the attack on New York. He bolts out of the cafÃ© and, out of breath, steps into his suit just as his knees buckle under him. Frantically, Stark asks J.A.R.V.I.S, â€œCheck my heart. Is it the brain? Was I poisoned?â€ When heâ€™s told that he suffered a severe anxiety attack, Stark is in disbelief: â€œMe?â€\r\n\r\nStarkâ€™s persistent denial that a person such as himself could deal with any form of mental illness speaks to his desire to fix everything. Instead of sleeping or spending time with Pepper, he devotes himself entirely to building new suits, new weapons, new lines of defence. Back in the cafÃ©, when Rhodes expresses his concern, Stark retorts, â€œEinstein slept three hours a year, look what he did.â€ While those closest to him think he has built 10 or 15 suits in total, in his basement Tony is working on a Mark 42. Heâ€™s no longer just anxious â€“ heâ€™s obsessive.\r\n\r\nIn Age of Ultron, when Scarlet Witch (Elizabeth Olsen) shows Tony his darkest fears, he sees the Avengers dead before his feet â€“ and itâ€™s his fault. In Captain America: Civil War, when brought face to face with the destruction he and his team always leaves behind, Stark canâ€™t live with the guilt and so he signs the Sokovia Accords, a piece of legislation requiring all superheroes to reveal their secret identities and disclose their powers. Stark constantly fears the day he lets down those he loves, and he deals with it by retreating from them to build them as much protection as he can.\r\n\r\nOf course, one rich white manâ€™s battle with mental illness isnâ€™t going to resonate with everyone. But itâ€™s important that Stark is not portrayed as a wholly good individual: he can be selfish, arrogant, an egomaniac. Sometimes, heâ€™s even framed as an antagonist. The villainous Ultron is literally the product of Starkâ€™s ego; blinded by progress he builds a sentient weapon that nearly kills millions and results directly in the drafting of the Sokovia Accords. You could go as far as calling Tony Stark an anti-hero â€“ that is what makes him such a compelling character. No matter how privileged a person is, they can still be affected by anxiety, depression and other forms of mental illness.\r\n\r\nTony Stark is an authentic and complicated hero, someone who can seemingly build anything and is willing to stand up to the worldâ€™s greatest evils â€“ often alone â€“ but who is still vulnerable, compulsive and obsessive, and who deals with the same inner demons we all must face. His arc has continu', 'Iron Man', 'ironman2.jpg', '2023-05-23', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'rr', 'rrr@gmail.com', 'r'),
(2, 'user', 'user@gmail.com', '1'),
(3, 'eee', 'eee@gmail.com', 'e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
