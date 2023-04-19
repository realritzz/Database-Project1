<?php
    // grab all functions
    require('functions.php');

    // testing any errors
    error_reporting(E_ALL);
    ini_set('display_errors', 1);


    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $email = $_POST['email'];
        $password = $_POST['password'];
        $auth = checkAccountCreation($email);

        // default password for new users are "newuser"
        if(($password == "newuser") && ($auth == 0)){
            setcookie('email', $email, time() + 300, '/');
            header('Location: createAccount.php');
        } else{
            // check login info - returns SSN
            $confirmLogin = checkUser($email, $password);

            // if login info doesn't exist
            if($confirmLogin == ""){
                setcookie('email', '', time() - 3600, '/');
                callAlert("Email or Password does not exist");
            } else{
                // sets a cookie that only lasts 5 minute, needs to be authenticated
                setcookie('email', $email, time() + 300, '/');
                // callAlert("Successfully logged in");
                header('Location: doubleAuthentication.php');
            }
        }
    }

?>

<html>

    <head>

    </head>

    <body>
        <form method = "post" autocomplete="off">
            <fieldset>
                <!-- All inputs to form is required -->
                <!-- EMAIL -->
                <label for="email" id="inputLabels"> Email: </label>
                <input type="text" id="email" name="email" required>
                <br>
                <!-- PASSWORD -->
                <label for="password" id="inputLabels"> Password: </label>
                <input type="password" id="password" name="password"  required>
                <p> 
                    * BOTH USERNAME AND PASSWORD ARE CASE SENSITIVE 
                </p>
                <p>
                    * DEFAULT PASSWORD FOR NEW USERS IS 'newuser'
                </p>
                <br>
                <!-- SUBMIT -->
                <input type="submit" id="submitBtn" name="login" value="LOG IN">
            </fieldset>
        </form>
    </body>

</html>

