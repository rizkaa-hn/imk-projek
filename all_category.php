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
   <title>category</title>
   <link rel="shortcut icon" type="x-icon" href="images/logo.png">
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




   <section class="categories">

      <h1>post categories</h1>

      <div class="box-container">
         <div class="box"><span>01</span><a href="category.php?category=captain america">Captain America</a></div>
         <div class="box"><span>02</span><a href="category.php?category=thor">Thor</a></div>
         <div class="box"><span>03</span><a href="category.php?category=iron man">Iron Man</a></div>
         <div class="box"><span>04</span><a href="category.php?category=hawkeye">Hawkeye</a></div>
         <div class="box"><span>05</span><a href="category.php?category=hulk">Hulk</a></div>
         <div class="box"><span>06</span><a href="category.php?category=black widow">Black Widow</a></div>
      </div>

   </section>










   <?php include 'component/footer.php'; ?>







   <!-- custom js file link  -->
   <script src="script.js"></script>

</body>

</html>