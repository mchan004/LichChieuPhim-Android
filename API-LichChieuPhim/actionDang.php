<?php
include("config.php");
  if(isset($_GET['xoa']))
  {
    try {
      $stmt = $conn->prepare("DELETE FROM CommentPhimdangchieu WHERE id='".$_GET['xoa']."'");
      $stmt->execute();
      echo "Xoá thành công";
      echo "<input type=\"button\" onclick='window.location.href = \"index.php\"' value=\"Quay lại\">";
      exit;
    }
    catch(PDOException $e) {
      echo "Error: " . $e->getMessage();
    }
  }
?>
