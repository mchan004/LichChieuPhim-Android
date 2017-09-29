<?php
include "../config.php";
if( isset($_POST['Name']) && isset($_POST['id']) && isset($_POST['Email']) && isset($_POST['Rate']) && isset($_POST['Comment']))
{

  try {
    $conn = new PDO("mysql:host=".$host.";dbname=".$nameDB.";charset=utf8", $userDB, $passDB);
    $stmt = $conn->prepare("INSERT INTO CommentPhimdangchieu (idPhim, Name, Email, Rate, Comment, DateCreate) VALUES (:idPhim, :Name, :Email, :Rate, :Comment, NOW())");
    $stmt->bindParam(':idPhim', $_POST['id']);
    $stmt->bindParam(':Name', $_POST['Name']);
    $stmt->bindParam(':Email', $_POST['Email']);
    $stmt->bindParam(':Rate', $_POST['Rate']);
    $stmt->bindParam(':Comment', $_POST['Comment']);

    $stmt->execute();

echo "Cám ơn bạn ".$_POST['Name']." đã đánh giá phim này";

  } catch (PDOException $e) {
    echo "Failed to get DB handle: " . $e->getMessage() . "\n";
    exit;
  }










}
else {
  exit("WTF Error!!!!!!!");
}

?>
