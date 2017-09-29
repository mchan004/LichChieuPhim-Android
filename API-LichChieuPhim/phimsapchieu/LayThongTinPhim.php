<?php
echo "<input type=\"button\" onclick='window.location.href = \"../index.php\"' value=\"Quay lại\">"."<br>";

include '../simple_html_dom.php';
function EditText($v='')
{
  return trim(html_entity_decode($v));

}

try {
  include("../config.php");
  $conn = new PDO("mysql:host=".$host.";dbname=".$nameDB.";charset=utf8", $userDB, $passDB);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $stmt_Add = $conn->prepare("UPDATE DanhSachPhimSapChieu SET KhoiChieu=STR_TO_DATE(:KhoiChieu, '%d.%m.%Y'), TheLoai=:TheLoai, NoiDung=:NoiDung, DienVien=:DienVien, DaoDien=:DaoDien, NhaSanXuat=:NhaSanXuat, ThoiLuong=:ThoiLuong, HinhAnh=:HinhAnh, Trailer=:Trailer WHERE id=:id");
  $stmt_Add->bindParam(':id', $id);
  $stmt_Add->bindParam(':TheLoai',    $TL);
  $stmt_Add->bindParam(':DienVien',   $DV);
  $stmt_Add->bindParam(':DaoDien',    $DD);
  $stmt_Add->bindParam(':NhaSanXuat', $NSX);
  $stmt_Add->bindParam(':ThoiLuong',  $TLP);
  $stmt_Add->bindParam(':NoiDung',    $ND);
  $stmt_Add->bindParam(':KhoiChieu',  $KC);
  $stmt_Add->bindParam(':Trailer',    $Trailer);
  $stmt_Add->bindParam(':HinhAnh',    $Image);


  $stmt = $conn->prepare("SELECT id,Galaxy FROM DanhSachPhimSapChieu WHERE Galaxy<>'null'");
  $stmt->execute();
  $result = $stmt->fetchAll();
    foreach($result as $row) {
      $html = file_get_html($row['Galaxy']);
      $elements = $html->find('.inner article p');
      foreach($elements as $e)  {




        $k = trim(html_entity_decode($e->find('strong')[0]->plaintext));
          switch ($k) {
            case "Khởi chiếu:":
                $KC = mb_substr(EditText($e->plaintext), 15, 10);
                break;
            case "Thể loại:":
                $TL = EditText(mb_substr($e->plaintext, 11));
                break;
            case "Diễn viên:":
                $DV = EditText(mb_substr($e->plaintext, 18));
                break;
            case "Đạo diễn:":
                $DD = EditText(mb_substr($e->plaintext, 10));
                break;
            case "Nhà sản xuất:":
                $NSX = EditText(mb_substr($e->plaintext, 21));
                break;
            case "Thời lượng phim:":
                $TLP = EditText(mb_substr($e->plaintext, 17));
                break;
          }


      }
      $Trailer = mb_substr($html->find('.modal-body iframe')[0]->src,30,11);
      $Image = $html->find('#content .thumb img')[0]->src;
      $ND = html_entity_decode($html->find('.desc section p')[0]->plaintext);
      $id = $row['id'];
      $stmt_Add->execute();
      $KC = "";
      $TL = "";
      $DD = "";
      $DV = "";
      $NSX = "";
      $TLP = "";
    }
$KC = "";
$TL = "";
$DD = "";
$DV = "";
$NSX = "";
$TLP = "";
///////////////////////
///////////////////////
//////CGV//////////////
///////////////////////

    $stmt = $conn->prepare("SELECT id,CGV FROM DanhSachPhimSapChieu WHERE Galaxy='null' AND CGV<>'null'");
    $stmt->execute();
    $result = $stmt->fetchAll();
    foreach($result as $row) {


      $html = file_get_html($row['CGV']);


      $id = $row['id'];
      $TL = EditText($html->find('.product-shop .movie-genre .std')[0]->plaintext);
      $DV = EditText($html->find('.product-shop .movie-actress .std')[0]->plaintext);
      $DD = EditText($html->find('.product-shop .movie-director .std')[0]->plaintext);
      if (isset($html->find('.product-shop .movie-actress .std')[1]))
      {
        $TLP= EditText($html->find('.product-shop .movie-actress .std')[1]->plaintext);
      }
      else {
        $TLP = "";
      }
      $KC = EditText($html->find('.product-shop .movie-release .std')[0]->plaintext);

      $KC = str_replace("/",".",$KC);
      $NSX = "null";
      $ND = addslashes(trim($html->find('.product-collateral .std')[0]->plaintext));

      $Trailer = mb_substr("https:".EditText($html->find('.product_view_trailer iframe')[0]->src),30,11);
      $Image = EditText($html->find('.product-essential .product-img-box img')[0]->src);

      $stmt_Add->execute();

    }

} catch (PDOException $e) {
  echo "Failed to get DB handle: " . $e->getMessage() . "\n";
  exit;
}




?>
