<?php
include("../config.php");


echo "Quản lý phim đang chiếu <hr>";
try {
  $conn = new PDO("mysql:host=".$host.";dbname=".$nameDB.";charset=utf8", $userDB, $passDB);
  $stmt = $conn->prepare("SELECT * FROM DanhSachPhim ORDER BY id DESC");
  $stmt->execute();

  // set the resulting array to associative
  $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
  foreach($stmt->fetchAll() as $k=>$v) {
      echo "<a href='action.php?sua=" . $v["id"] . "'>Sửa</a>||";
      echo "<a href='action.php?xoa=" . $v["id"] . "'>Xoá</a>||";
      echo $v["TenPhim"] . "<hr>";
  }
}
catch(PDOException $e) {
  echo "Error: " . $e->getMessage();
}

echo "<hr>" . "<input type=\"button\" onclick='window.location.href = \"../index.php\"' value=\"Quay lại\">"."<br>";
?>
