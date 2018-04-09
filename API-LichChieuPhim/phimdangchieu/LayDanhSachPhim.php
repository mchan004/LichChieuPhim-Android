<?php
echo "<input type=\"button\" onclick='window.location.href = \"../index.php\"' value=\"Quay lại\">"."<br>";

function encodeURI($uri)
{
  $uri = mb_strtolower($uri);
    return preg_replace_callback("{[^0-9a-z_.!~*'();,/?:@&=+$#-]}i", function ($m) {
        return sprintf('%%%02X', ord($m[0]));
    }, $uri);
}
include '../simple_html_dom.php';
// Galaxy
$html = file_get_html("https://www.galaxycine.vn/phim-dang-chieu");
$DSPhim=array(
  "TenPhim" => array(),
  "Keywords" => array(),
	"Galaxy" => array(),
  "CGV" => array(),
  "Lotte" => array(),
  "NoiDung" => array(),
);
$i=0;
foreach($html->find('#tab_onshow .watchmovie-item') as $element)
{
	//echo $element->find('img')[0]->src;
	//echo $element->find('a')[0]->h;

  $DSPhim['STT'] = $i;
  $DSPhim['TenPhim'][$i]=mb_strtoupper(html_entity_decode($element->find('h4')[0]->plaintext));
  $DSPhim['Keywords'][$i]=preg_split("/[\s,:\/\\\]+/", mb_strtoupper(html_entity_decode($element->find('h4')[0]->plaintext)));
  $DSPhim['Galaxy'][$i]="https://www.galaxycine.vn".$element->find('a')[0]->href;
  $i++; 
}

// CGV
$html = file_get_html("https://www.cgv.vn/default/movies/now-showing.html");
foreach($html->find('.product-name a') as $element)
{
  $tenphim=mb_strtoupper(html_entity_decode($element->title));
  $keywords = preg_split("/[\s,:\/\\\]+/", $tenphim);
  $c = count($keywords)/2;
  if (count($keywords)==2)
    $c=2;
  $j = 0;
  $h=0;
  //Tim Key
  foreach ($DSPhim['Keywords'] as $v) {
    $c1 = count(array_intersect($v,$keywords));
    if ($c1 >= $c) {
      $h = 1;
      break;
    }
    $j++;
  }

  // Add to DSPhim
  if ( $h==1 ) {
    $DSPhim['CGV'][$j]=$element->href;
  }
  else {
    $DSPhim['STT'] = $i;
    $DSPhim['TenPhim'][$i]=$tenphim;
    $DSPhim['Keywords'][$i]=$keywords;
    $DSPhim['CGV'][$i]=$element->href;
    $i++;
  }
}
ksort($DSPhim['CGV']);

//Lotte
$html = file_get_html("http://www.lottecinemavn.com/vi-vn/phim-%C4%91ang-chieu.aspx");
foreach($html->find('.dn_lmvinfo a') as $element)
{
  $tenphim=mb_strtoupper(html_entity_decode($element->title));
  $keywords = preg_split("/[\s,:\/\\\]+/", $tenphim);
  $c = count($keywords)/2;
  if (count($keywords)==2)
    $c=2;
  $j = 0;
  $h=0;
  //Tim Key
  foreach ($DSPhim['Keywords'] as $v) {
    $c1 = count(array_intersect($v,$keywords));
    if ($c1 >= $c) {
      $h = 1;
      break;
    }
    $j++;
  }

  // Add to DSPhim
  if ( $h==1 ) {
    $DSPhim['Lotte'][$j]=encodeURI("http://www.lottecinemavn.com/vi-vn".$element->href);
  }
/*  else {
    $DSPhim['STT'] = $i;
    $DSPhim['TenPhim'][$i]=$tenphim;
    $DSPhim['Keywords'][$i]=$keywords;
    $DSPhim['Lotte'][$i]="http://www.lottecinemavn.com/vi-vn".$element->href;
    $i++;
  }*/
}
ksort($DSPhim['Lotte']);



$values = "";
for ($j=0; $j < count($DSPhim['TenPhim']); $j++) {
  $values .= "('".$DSPhim['TenPhim'][$j]."','";
  if (isset($DSPhim['Galaxy'][$j]))
  {
    $values .= $DSPhim['Galaxy'][$j];
  }
  else {
    $values .= "null";
  }
  $values .= "','";

  if(isset($DSPhim['CGV'][$j]))
  {
    $values .= $DSPhim['CGV'][$j];
  }
  else {
    $values .= "null";
  }
  $values .= "','";

  if(isset($DSPhim['Lotte'][$j]))
  {
    $values .= $DSPhim['Lotte'][$j];
  }
  else {
    $values .= "null";
  }
  $values .= "'),";
}

echo json_encode($DSPhim);


try {
  include "../config.php";
  $conn = new PDO("mysql:host=".$host.";dbname=".$nameDB.";charset=utf8", $userDB, $passDB);
  //$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $stmt = $conn->prepare("delete from DanhSachPhim; INSERT INTO DanhSachPhim (TenPhim,Galaxy,CGV,Lotte) VALUE ".substr($values,0,-1). ";");
  $stmt->execute();




} catch (PDOException $e) {
  echo "Failed to get DB handle: " . $e->getMessage() . "\n";
  exit;
}



/*
echo "<br><br><br>";
print_r($DSPhim['TenPhim']); echo count($DSPhim['TenPhim'])."<br><br>";
print_r($DSPhim['CGV']); echo count($DSPhim['CGV'])."<br><br>";
print_r($DSPhim['Galaxy']); echo count($DSPhim['Galaxy'])."<br><br>";
print_r($DSPhim['Lotte']); echo count($DSPhim['Lotte'])."<br><br>";
*/






?>
