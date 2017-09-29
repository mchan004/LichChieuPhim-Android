<?php
  try {
    include("../config.php");
    $conn = new PDO("mysql:host=".$host.";dbname=".$nameDB.";charset=utf8", $userDB, $passDB);
    $stmt = $conn->prepare("select * from CommentPhimsapchieu AS A INNER JOIN DanhSachPhimSapChieu AS B ON A.idPhim=B.TenPhim WHERE B.id=".$_GET['id']);
	  $stmt->execute();

$DSPhims = array();
	  while ($row = $stmt->fetch()) {

      array_push ($DSPhims,$DSPhim = array(
        'id' => $row['id'],
        'idPhim' => $row['idPhim'],
        'Name' => $row['Name'],
        'Email' => $row['Email'],
        'Rate' => $row['Rate'],
        'DateCreate' => $row['DateCreate'],
        'Comment' => $row['Comment'],
      ));

    }
    echo json_encode($DSPhims);

  } catch (PDOException $e) {
    echo "Failed to get DB handle: " . $e->getMessage() . "\n";
    exit;
  }
?>
