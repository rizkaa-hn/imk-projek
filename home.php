<?php

include 'component/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
   $user_id = $_SESSION['user_id'];
} else {
   $user_id = '';
};

include 'component/like_post.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" type="x-icon" href="images/logo.png">
   <title>fan page-avengers</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Lato:wght@100;400&display=swap" rel="stylesheet">

   <link rel="stylesheet" href="style.css">

</head>

<body>

   <?php include 'component/user_header.php'; ?>

   <section class="homepage">
   </section>
   <!----------------------------------------------------------------ABOUT US------------------------------------------------------------->
   <section class="about">
      <br><br><br><br><br><br>
      <h1>WELCOME</h1>
      <br><br><br>
      <p>Selamat datang di fanpage Avenger dari studio Marvel!!! <br> Nah, situs fanpage ini berisi untuk kalian <br>
         yang suka sama Avengers, apalagi ke-6 main hero ini. Disini kita bakal bertukar informasi <br>
         seputar big 6 Avenger sekaligus movie-movie mereka. Jadi, jangan lupa untuk sign in dan <br>
         log in ya.... mari bertemu dengan komunitasmu!</p>
   </section>

   <!------------------------------------------------------------------------HOME GRID------------------------------------------------->
   <section class="home-grid">
      <h1>CATEGORIES</h1>
      <div class="box-container">
         <div class="box">
            <div class="flex-box">
               <a href="category.php?category=captain america" class="links">Captain America</a>
               <a href="category.php?category=iron man" class="links">Iron Man</a>
               <a href="category.php?category=hulk" class="links">Hulk</a>
               <a href="category.php?category=black widow" class="links">Black Widow</a>
               <a href="category.php?category=hawkeye" class="links">Hawkeye</a>
               <a href="category.php?category=thor" class="links">Thor</a>
               <a href="all_category.php" class="btn">view all</a>
            </div>
         </div>



      </div>

   </section>
   <!---------------------------------------------------------POST CONTAINER---------------------------------------------------------->
   <section class="posts-container">

      <h1>LATEST POST</h1>

      <div class="box-container">

         <?php
         $select_posts = $conn->prepare("SELECT * FROM `posts` WHERE status = ? LIMIT 6 ");
         $select_posts->execute(['active']);
         if ($select_posts->rowCount() > 0) {
            while ($fetch_posts = $select_posts->fetch(PDO::FETCH_ASSOC)) {

               $post_id = $fetch_posts['id'];

               $count_post_comments = $conn->prepare("SELECT * FROM `comments` WHERE post_id = ?");
               $count_post_comments->execute([$post_id]);
               $total_post_comments = $count_post_comments->rowCount();

               $count_post_likes = $conn->prepare("SELECT * FROM `likes` WHERE post_id = ?");
               $count_post_likes->execute([$post_id]);
               $total_post_likes = $count_post_likes->rowCount();

               $confirm_likes = $conn->prepare("SELECT * FROM `likes` WHERE user_id = ? AND post_id = ?");
               $confirm_likes->execute([$user_id, $post_id]);
         ?>
               <form class="box" method="post">
                  <input type="hidden" name="post_id" value="<?= $post_id; ?>">
                  <input type="hidden" name="admin_id" value="<?= $fetch_posts['admin_id']; ?>">
                  <div class="post-admin">
                     <i class="fas fa-user"></i>
                     <div>
                        <a href="author_posts.php?author=<?= $fetch_posts['name']; ?>"><?= $fetch_posts['name']; ?></a>
                        <div><?= $fetch_posts['date']; ?></div>
                     </div>
                  </div>

                  <?php
                  if ($fetch_posts['image'] != '') {
                  ?>
                     <img src="images/<?= $fetch_posts['image']; ?>" class="post-image" alt="">
                  <?php
                  }
                  ?>
                  <div class="post-title"><?= $fetch_posts['title']; ?></div>
                  <div class="post-content content-150"><?= $fetch_posts['content']; ?></div>
                  <a href="view_post.php?post_id=<?= $post_id; ?>" class="inline-btn">read more</a>
                  <a href="category.php?category=<?= $fetch_posts['category']; ?>" class="post-cat"> <i class="fas fa-tag"></i> <span><?= $fetch_posts['category']; ?></span></a>
                  <div class="icons">
                     <a href="view_post.php?post_id=<?= $post_id; ?>"><i class="fas fa-comment"></i><span>(<?= $total_post_comments; ?>)</span></a>
                     <button type="submit" name="like_post"><i class="fas fa-heart" style="<?php if ($confirm_likes->rowCount() > 0) {
                                                                                                echo 'color:var(--red);';
                                                                                             } ?>  "></i><span>(<?= $total_post_likes; ?>)</span></button>
                  </div>

               </form>
         <?php
            }
         } else {
            echo '<p class="empty">no posts added yet!</p>';
         }
         ?>
      </div>

      <div class="more-btn" style="text-align: center; margin-top:1rem;">
         <a href="posts.php" class="inline-btn">view all posts</a>
      </div>
      <br>
   </section>
   <!------------------------------------------------------------- HEROES ------------------------------------------------------------>
   <section class="heroes">
      <div class="flip-card">
         <div class="flip-card-back">
            <div class="inner">
               <img src="images/logo-hawk.png" class="icon" />
               <h3>Hawkeye</h3>
               <p>
                  an extremely skilled marksman and a former special agent of S.H.I.E.L.D.
                  Known for his use of the bow and arrow as his primary weapon and an extremely keen eyesight and accuracy
               </p>
            </div>
         </div>
         <div class="flip-card-front">
            <div class="inner">
               <img src="https://i.imgur.com/aJauAJV.png" class="icon" />
               <h3>Iron Man</h3>
               <p>
                  the leader and benefactor of the avengers who is a self-described genius, billionaire,
                  playboy, and philanthropist with electronical suits of armor of his own making
               </p>
            </div>
         </div>
      </div>
      <div class="flip-card">
         <div class="flip-card-back">
            <div class="inner">
               <img src="images/logo-bw.png" class="icon">
               <h3>Black Widow</h3>
               <p>
                  one of the most talented spies and assassins in the entire world. she was targeted by S.H.I.E.L.D.,
                  before given the chance to ultimately defect to the organization by Hawkeye and became one of S.H.I.E.L.D.'s most efficient agents
               </p>
            </div>
         </div>
         <div class="flip-card-front">
            <div class="inner">
               <img src="https://i.imgur.com/ep0HjjD.png" class="icon">
               <h3>Thor</h3>
               <p>
                  the Asgardian God of Thunder, the former king of both Asgard and New Asgard, and the holder of the great hummer Mjølnir.
               </p>
            </div>
         </div>
      </div>
      <div class="flip-card">
         <div class="flip-card-front">
            <div class="inner">
               <img src="images/looo.png" class="icon">
               <h3>Captain America</h3>
               <p>
                  a FUGUITIVE SUPERHERO AND LEADER OF A FACTION OF AVENGERS. A WORLD WAR II VETERAN HE WAS
                  ENHANCED TO THE PEAK OF HUMAN PHYSICALITY BY AN EXPERIMENTAL SERUM AND FROZEN IN SUSPENDED
                  ANIMATION BEFORE WAKING UP IN THE MODERN WORLD
               </p>
            </div>
         </div>
         <div class="flip-card-back">
            <div class="inner">
               <img src="images/logo-hulk.png" class="icon">
               <h3>Hulk</h3>
               <p>
                  an avenger and a genius scientist who, because of exposure to gamma radiation, transforms into a
                  monster when enraged or agitated
               </p>
            </div>
         </div>
      </div>
   </section>
   <!------------------------------------------------------------- MOVIES ------------------------------------------------------------->
   <section class="movies">
      <h1>MOVIES</h1>
      <div class="containermv">
         <div class="row">
            <div class="col">
               <div class="feature-img">
                  <img src="images/m1.jpeg" width="100%">
                  <img src="images/play.png" class="play-btn" onclick="playvideo('images/theavengers.mp4')">
               </div>
            </div>
            <div class="col">
               <div class="small-img-row">
                  <div class="small-img">
                     <img src="images/m2.jpeg">
                     <img src="images/play.png" class="play-btn" onclick="playvideo('images/v2.mp4')">
                  </div>
               </div>
               <div class="small-img-row">
                  <div class="small-img">
                     <img src="images/m3.png">
                     <img src="images/play.png" class="play-btn" onclick="playvideo('images/v3.mp4')">
                  </div>
               </div>
               <div class="small-img-row">
                  <div class="small-img">
                     <img src="images/m4.jpg">
                     <img src="images/play.png" class="play-btn" onclick="playvideo('images/v4.mp4')">
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="video-player" id="videoplayer">
         <video width="100%" controls autoplay id="videoo">
            <source src="images/theavengers.mp4" type="video/mp4">
         </video>
         <img src="images/close.png" class="close-btn" onclick="stopvideo()">
      </div>
      <script>
         var videoplayer = document.getElementById("videoplayer");
         var videoo = document.getElementById("videoo");

         function stopvideo() {
            videoplayer.style.display = "none";
         }

         function playvideo(file) {
            videoo.src = file;
            videoplayer.style.display = "block";
         }
      </script>
   </section>











   <?php include 'component/footer.php';
   ?>

   <script src="script.js"></script>

</body>

</html>