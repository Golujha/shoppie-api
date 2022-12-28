<?php include "include/config.php";

if(!isset($_GET['id'])){
 redirect("index.php");
}

$id = $_GET['id'];
$callingrecord = calling("products JOIN category ON products.category=category.cat_id where id='$id'");
$row = $callingrecord[0];
?>
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
<body class="bg-light">
    <?php include "include/nav.php";?>
    <div class="container mt-4">
        <div class="row">
            <div class="col-3">
    <?php include "include/side.php";?>
                
            <div class="col-9">
            <div class="row">
                <div class="col-4 ">
                    <img src="productimages/<?= $row['image'];?>" class="card-img-top " style="height:300px;" alt="">
                </div>
                <div class="col-8">
                   <div class="card bg-info">
                   <table class="table">
                        <tr>
                            <th colspan="2"><?= $row['title'];?></th>
                        </tr>
                        <tr>
                        <th>MRP</th>
                        <td><?= $row['title'];?></td>
</tr>
                           <tr>
                           <th>price</th>
                        <td><?= $row['discount_price'];?></td>
                           </tr>
                           <tr>
                           <th>brand</th>
                        <td><?= $row['brand'];?></td>
                           </tr>
                        <tr>
                           <th>category</th>
                        <td><?= $row['cat_title'];?></td>
                           </tr>
                           <tr>
                           <th>offer price</th>
                        <td><del><?= $row['price'];?></del></td>
                           </tr>
                    </table>
                   

                    <div class="card-body">
                    <a href="view.php?p_id=<?= $row['id'];?>&id=<?= $_GET['id'];?>" class="btn btn-warning"><i class="bi bi-cart"></i> Add to Cart</a>
                    <a href="" class="btn btn-success"><i class="bi bi-bag"></i> Buy Now</a>
                    </div>
                   </div>
                </div>
            </div>
            </div>
        </div>
    </div>
               
</body>
</html>

<?php 

if(isset($_GET['p_id'])){
    //retrieve product details
    $p_id =$_GET['p_id'];
    $product = callingOne("products where id='$p_id'");

    //retrieve user data 
    $log = $_SESSION['user'];
    $user = callingOne("users where email='$log' OR contact='$log'");

    if($product){
        // retrieve order datails
        $user_id = $user['user_id'];
        $order  = callingOne("orders where ordered=0 AND user_id='$user_id'");
        $product_id =  $product['id'];

        if($order){
            // retrieve orderItem detail
            $orderItem = callingOne("order_item where user_id='$user_id' AND product_id='$product_id'");

            if($orderItem){
                $orderitem_id = $orderItem['orderitem_id'];
                $updateQuery = mysqli_query($connect,"update order_item SET qty=qty+1 where orderitem_id='$orderitem_id'");
                // redirect to cart page
            }
            else{
                $insertData = [
                    'ordered' => 0,
                    'user_id' => $user_id,
                    'product_id' => $product_id,
                    'order_id' => $order['id'],
                    'qty' => 1,
                ];
                insertData("order_item",$insertData);
                // redirect to cart page
            }
        }
        else{

            $insertOrder = [
                'ordered' => 0,
                'user_id' => $user_id,
            ];
            insertData("orders",$insertOrder);

            $lastId = mysqli_insert_id($connect);
            $insertData = [
                'ordered' => 0,
                'user_id' => $user_id,
                'product_id' => $product_id,
                'order_id' => $lastId,
                'qty' => 1,
            ];
            insertData("order_item",$insertData);
            

        }
    } 

    redirect("cart.php");

    
}

?>