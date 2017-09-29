<?php
echo "<input type=\"button\" onclick='window.location.href = \"index.php\"' value=\"Quay lại\"><br>";
include("config.php");


echo "Quản lý Comment <hr>";
try {
  $conn = new PDO("mysql:host=".$host.";dbname=".$nameDB.";charset=utf8", $userDB, $passDB);
  $stmt = $conn->prepare("SELECT * FROM CommentPhimdangchieu ORDER BY id DESC");
  $stmt->execute();

  // set the resulting array to associative
  $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
  foreach($stmt->fetchAll() as $k=>$v) {
      echo "<a href='actionDang.php?xoa=" . $v["id"] . "'>Xoá</a>||";
      echo $v["Name"] . "<br>Rate: " . $v["Rate"] . "<br>" . $v["Email"] . "<br>Danh gia phim: ". $v["idPhim"] . "<br>Binh luan: " .$v["Comment"] . "<hr>";
  }
}
catch(PDOException $e) {
  echo "Error: " . $e->getMessage();
}


?>
