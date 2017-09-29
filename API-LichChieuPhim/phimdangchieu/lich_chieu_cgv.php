
<?php
  include '../simple_html_dom.php';

  //$link = $_GET['link'];
  // Create DOM from URL or file
$html = file_get_html("https://www.cgv.vn/vn/sinh-vat-huyen-bi-va-noi-tim-ra-chung.html");


       $btn = $html;

       echo $btn;
?>
