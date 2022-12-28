 <?php include "include/config.php";?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body class="bg-secondary">
    <?php include "include/nav.php";?>
    <div class="container-fluid mt-4 ">
        <div class="row">
            <div class="col-3">
         <?php include "include/side.php";?>
            <div class="col-9">
                <div class="row">
                    <?php
                    $callingproduct = calling("products JOIN category ON products.category = category.cat_id");

                    if(isset($_GET['cat'])){
                        $cat = $_GET['cat'];
                        $callingproduct = calling("products JOIN category ON products.category = category.cat_id where category='$cat'");
                       
                    }
                    elseif(isset($_GET['find'])){
                        $search = $_GET['search'];
                        $callingproduct = calling("products JOIN category ON products.category = category.cat_id where title LIKE '%$search%'");
                   
                    }
                    foreach ($callingproduct as $value){
                        ?>
                        <div class="col-3">
                            <div class="card mb-3">
                            <img src="productimages/<?= $value['image'];?>" alt="" class="card-img-top" style="object-fit:cover; height:170px;"><hr>
                            <div class="card-body p-2">
                                <h2 class="h4">
                                    <span class="">₹ <?= $value['discount_price'];?></span>
                                    <del class="small text-danger "> ₹ <?= $value['price'];?></del ></h2>
                                <h5> <b class='m-0 p-0 text-truncate text-primary ms-2'><?= $value['title'];?></b></h5>
                                <small><b class='m-0 p-0 text-success text-truncate ms-2'><?= $value['cat_title'];?></b></small>
                               <a href="view.php?id=<?= $value['id'];?>" class="stretched-link"></a>
                            </div>          
                            </div>
                        </div>
                   <?php } ?>
                </div>
            </div>
        </div>
    </div>
</body>
</html>