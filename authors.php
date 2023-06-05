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
   <title>author</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Lato:wght@100;400&display=swap" rel="stylesheet">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="style.css">

</head>

<body>

   <!-- header section starts  -->
   <?php include 'component/user_header.php'; ?>
   <!-- header section ends -->


   <section class="authors">
      <h1>AUTHORS</h1>

      <div class="box-container">

         <?php
         $select_author = $conn->prepare("SELECT * FROM `admin`");
         $select_author->execute();
         if ($select_author->rowCount() > 0) {
            while ($fetch_authors = $select_author->fetch(PDO::FETCH_ASSOC)) {

               $count_admin_posts = $conn->prepare("SELECT * FROM `posts` WHERE admin_id = ? AND status = ?");
               $count_admin_posts->execute([$fetch_authors['id'], 'active']);
               $total_admin_posts = $count_admin_posts->rowCount();

               $count_admin_likes = $conn->prepare("SELECT * FROM `likes` WHERE admin_id = ?");
               $count_admin_likes->execute([$fetch_authors['id']]);
               $total_admin_likes = $count_admin_likes->rowCount();
               $count_admin_comments = $conn->prepare("SELECT * FROM `comments` WHERE admin_id = ?");
               $count_admin_comments->execute([$fetch_authors['id']]);
               $total_admin_comments = $count_admin_comments->rowCount();

         ?>
               <div class="box">
                  <p>author : <span><?= $fetch_authors['name']; ?></span></p>
                  <p>total posts : <span><?= $total_admin_posts; ?></span></p>
                  <p>total likes : <span><?= $total_admin_likes; ?></span></p>
                  <p>posts comments : <span><?= $total_admin_comments; ?></span></p>
                  <a href="author_posts.php?author=<?= $fetch_authors['name']; ?>" class="btn">view posts</a>
               </div>
         <?php
            }
         } else {
            echo '<p class="empty">no authors found</p>';
         }
         ?>

      </div>

   </section>









   <br><br><br>
   <?php include 'component/footer.php'; ?>







   <!-- custom js file link  -->
   <script src="script.js"></script>

</body>

</html>