<?php
    require('../db.php');
    if (isset($_SESSION["publicKey"]) ) {
        $bet = stripslashes($_GET['bet']);
        $bet = mysqli_real_escape_string($con, $bet);

        $side = stripslashes($_GET['side']);
        $side = mysqli_real_escape_string($con, $side);

        if($bet < 25 || $bet > 6000){
            exit();
        }

        $userBalance = 0;
        $sql = "SELECT sum(value) as currentBalance FROM `transactions` join `users` on `users`.`id` = `transactions`.`userId` where publicKey = ?;";
        $stmt = mysqli_stmt_init($con);
        mysqli_stmt_prepare($stmt,$sql);
        mysqli_stmt_bind_param($stmt, "s", $_SESSION['publicKey']);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        while($row = mysqli_fetch_assoc($result)){
            if($row['currentBalance'] == ""){
                $userBalance = 0;
            }else{
                $userBalance = $row['currentBalance'];
            }
            break;
        }

        if($userBalance < floatval($bet)){
            echo "NOT ENOUGH CREDITS!";
        } else{
    
            // Remove User Coins
            $query    = "INSERT INTO `transactions`(userId, value, information) VALUES((SELECT id from users where publicKey = '" . $_SESSION["publicKey"] . "'), -".$bet.", 'Coin Flip'); ";
            $result   = mysqli_query($con, $query);
            if ($result) {
                //echo "Success";
            }

            $result = rand(1, 100);
            if($result <= 50){
                // User Won 50% Chance

                // Add User Coins
                $query    = "INSERT INTO `transactions`(userId, value, information, createDatetime) VALUES((SELECT id from users where publicKey = '" . $_SESSION["publicKey"] . "'), ".($bet*1.93).", 'Coin Flip', DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 second) ); ";
                $result   = mysqli_query($con, $query);
                if ($result) {
                    //echo "Success";
                }

                echo $side;

            } else{
                // User Lost 50% Chance
                if($side == 0){
                    echo 1;
                }else{
                    echo 0;
                }

            }

        }

    }

?>