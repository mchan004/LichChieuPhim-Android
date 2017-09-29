<html>
<head>

<link rel="stylesheet" href="https://www.galaxycine.vn/asset/default/css/style.css" />

</head>
<body>
<?php
  include '../simple_html_dom.php';

  $link = $_GET['link'];
  // Create DOM from URL or file
$html = file_get_html($link);

// Find all images
foreach($html->find('.inner .tab-pane') as $element)
       echo $element . '<br>';


?>
</body>
</html>
