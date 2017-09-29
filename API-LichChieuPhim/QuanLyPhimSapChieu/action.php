<html>
<head>
  <script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>


</head>
<body>
  <?php
  include("../config.php");


  if(isset($_GET['xoa']))
  {
    try {
      $stmt = $conn->prepare("DELETE FROM DanhSachPhimSapChieu WHERE id='".$_GET['xoa']."'");
      $stmt->execute();
      echo "Xoá thành công";
      echo "<input type=\"button\" onclick='window.location.href = \"index.php\"' value=\"Quay lại\">";
      exit;
    }
    catch(PDOException $e) {
      echo "Error: " . $e->getMessage();
    }
  }

  if(isset($_POST['id']))
  {
    if ($_POST['id']=='new')
    {
      try {
        $stmt = $conn->prepare("INSERT INTO DanhSachPhimSapChieu (TenPhim,TheLoai,DaoDien,DienVien,NhaSanXuat,ThoiLuong,KhoiChieu,NoiDung,HinhAnh,Trailer,Galaxy,CGV,Lotte,Rate) VALUES (:TenPhim,:TheLoai,:DaoDien,:DienVien,:NhaSanXuat,:ThoiLuong,:KhoiChieu,:NoiDung,:HinhAnh,:Trailer,:Galaxy,:CGV,:Lotte,0");
        $stmt->bindParam(':TenPhim', $_POST['TenPhim']);
        $stmt->bindParam(':TheLoai', $_POST['TheLoai']);
        $stmt->bindParam(':DaoDien', $_POST['DaoDien']);
        $stmt->bindParam(':DienVien', $_POST['DienVien']);
        $stmt->bindParam(':NhaSanXuat', $_POST['NhaSanXuat']);
        $stmt->bindParam(':ThoiLuong', $_POST['ThoiLuong']);
        $stmt->bindParam(':KhoiChieu', $_POST['KhoiChieu']);
        $stmt->bindParam(':NoiDung', $_POST['NoiDung']);
        $stmt->bindParam(':HinhAnh', $_POST['HinhAnh']);
        $stmt->bindParam(':Trailer', $_POST['Trailer']);
        $stmt->bindParam(':Galaxy', $_POST['Galaxy']);
        $stmt->bindParam(':CGV', $_POST['CGV']);
        $stmt->bindParam(':Lotte', $_POST['Lotte']);

        $stmt->execute();
        echo "Thành bài mới thành công";
        echo "<input type=\"button\" onclick='window.location.href = \"index.php\"' value=\"Quay lại\">";
        exit;
      }
      catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
      }

    }
    else {
      try {
        $stmt = $conn->prepare("UPDATE DanhSachPhimSapChieu SET TenPhim=:TenPhim,TheLoai=:TheLoai,DaoDien=:DaoDien,DienVien=:DienVien,NhaSanXuat=:NhaSanXuat,ThoiLuong=:ThoiLuong,KhoiChieu=:KhoiChieu,NoiDung=:NoiDung,HinhAnh=:HinhAnh,Trailer=:Trailer,Galaxy=:Galaxy,CGV=:CGV,Lotte=:Lotte WHERE id='".$_POST["id"]."'");
        $stmt->bindParam(':TenPhim', $_POST['TenPhim']);
        $stmt->bindParam(':TheLoai', $_POST['TheLoai']);
        $stmt->bindParam(':DaoDien', $_POST['DaoDien']);
        $stmt->bindParam(':DienVien', $_POST['DienVien']);
        $stmt->bindParam(':NhaSanXuat', $_POST['NhaSanXuat']);
        $stmt->bindParam(':ThoiLuong', $_POST['ThoiLuong']);
        $stmt->bindParam(':KhoiChieu', $_POST['KhoiChieu']);
        $stmt->bindParam(':NoiDung', $_POST['NoiDung']);
        $stmt->bindParam(':HinhAnh', $_POST['HinhAnh']);
        $stmt->bindParam(':Trailer', $_POST['Trailer']);
        $stmt->bindParam(':Galaxy', $_POST['Galaxy']);
        $stmt->bindParam(':CGV', $_POST['CGV']);
        $stmt->bindParam(':Lotte', $_POST['Lotte']);


        $stmt->execute();
        echo "Sửa bài thành công";
        echo "<input type=\"button\" onclick='window.location.href = \"index.php\"' value=\"Quay lại\">";
        exit;
      }
      catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
      }

    }
  }

  if(isset($_GET['sua']))
  {
    if ($_GET['sua']=="new")
    {
        ?>


        <center>Chuc nang nay chua lam</center>

      <?php
    }
    else {
              try {
                $stmt = $conn->prepare("SELECT * FROM DanhSachPhimSapChieu WHERE id='".$_GET["sua"]."'");
                $stmt->execute();

                // set the resulting array to associative
                $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
                foreach($stmt->fetchAll() as $k=>$v) {
                  ?>
                  <center>Bạn đang sửa phim <?php echo $v['TenPhim'] ?></center>
                  <form action="" method="POST">
                    TenPhim:
                    <input type="text" name="TenPhim" value="<?php echo $v['TenPhim'] ?>" ><br>
                    TheLoai:
                    <input type="text" name="TheLoai" value="<?php echo $v['TheLoai'] ?>"><br>
                    DaoDien:
                    <input type="text" name="DaoDien" value="<?php echo $v['DaoDien'] ?>" ><br>
                    DienVien:
                    <input type="text" name="DienVien" value="<?php echo $v['DienVien'] ?>" ><br>
                    NhaSanXuat:
                    <input type="text" name="NhaSanXuat" value="<?php echo $v['NhaSanXuat'] ?>" ><br>
                    ThoiLuong:
                    <input type="text" name="ThoiLuong" value="<?php echo $v['ThoiLuong'] ?>" ><br>
                    NoiDung:<br>
                    <textarea name="NoiDung" cols="40" rows="5"><?php echo $v['NoiDung'] ?></textarea><br>
                    HinhAnh:
                    <input type="text" name="HinhAnh" value="<?php echo $v['HinhAnh'] ?>" ><br>
                    Trailer:
                    <input type="text" name="Trailer" value="<?php echo $v['Trailer'] ?>" ><br>
                    Galaxy:
                    <input type="text" name="Galaxy" value="<?php echo $v['Galaxy'] ?>" ><br>
                    CGV:
                    <input type="text" name="CGV" value="<?php echo $v['CGV'] ?>" ><br>
                    Lotte:
                    <input type="text" name="Lotte" value="<?php echo $v['Lotte'] ?>" ><br>

                    <script> CKEDITOR.replace( 'editor1' ); </script>
                    <input type="hidden" name="id" value="<?php echo $v['id'] ?>">
                    <input type="submit" value="Hoàn thành">
                  </form>
                  <?php
                }
              }
              catch(PDOException $e) {
                echo "Error: " . $e->getMessage();
              }
    }
  }


echo "<input type=\"button\" onclick='window.location.href = \"../index.php\"' value=\"Quay lại\">"."<br>";

  ?>

</body>
</html>
