<?php 
include 'connected.php';

if (isset($_GET)) {
	if ($_GET['isAdd'] == 'true') {

        $name = $_GET['name'];
        $user = $_GET['user'];
        $type = $_GET['type'];
        $password =$_GET['password'];

          
    $sql="INSERT INTO `usertable` (`id`, `type`, `name`, `user`, `password`) VALUES (NULL, '$type', '$name', '$user', '$password');";
   
    $result=mysqli_query($conn,$sql);
        if ($result){
			echo "true";
		} else {
			echo "false";
    }
    
  

} else echo "Welcome Master UNG inserdata";
 
    
}
mysqli_close($conn);

 
?>