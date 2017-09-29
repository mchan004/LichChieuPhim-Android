<?php
  try {
    include("../config.php");
    $conn = new PDO("mysql:host=".$host.";dbname=".$nameDB.";charset=utf8", $userDB, $passDB);
    $stmt = $conn->prepare("select * from DanhSachPhim");
	  $stmt->execute();

    $DSPhims = array();
	  while ($row = $stmt->fetch()) {

      $DSPhim = array(
        'id' => $row['id'],
        'TenPhim' => $row['TenPhim'],
        'TheLoai' => $row['TheLoai'],
        'DaoDien' => $row['DaoDien'],
        'NhaSanXuat' => $row['NhaSanXuat'],
        'DienVien' => $row['DienVien'],
        'ThoiLuong' => $row['ThoiLuong'],
        'KhoiChieu' => $row['KhoiChieu'],
        'NoiDung' => $row['NoiDung'],
        'Rate' => 0,
        'HinhAnh' => $row['HinhAnh'],
        'Trailer' => $row['Trailer'],
        'Galaxy' => $row['Galaxy'],
        'CGV' => $row['CGV'],
        'Lotte' => $row['Lotte'],
      );

      $stmt1 = $conn->prepare("select AVG(Rate) AS A from CommentPhimdangchieu WHERE idPhim=:TenPhim");
      $stmt1->bindParam(':TenPhim', $row['TenPhim']);
      $stmt1->execute();
      $result = $stmt1 -> fetch();
      $DSPhim['Rate']= $result['A'];

      array_push ($DSPhims,$DSPhim);

    }
    echo json_encode($DSPhims);

  } catch (PDOException $e) {
    echo "Failed to get DB handle: " . $e->getMessage() . "\n";
    exit;
  }
?>
