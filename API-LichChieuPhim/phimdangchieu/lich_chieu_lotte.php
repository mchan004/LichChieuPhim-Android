
<?php
  include '../simple_html_dom.php';


$link = $_GET['link'];
$html = file_get_html($link);


$html = $html->find('.dn_pcontent .dn_tabsmvdt2')[1];
$i=0;
foreach ($html->find('a') as $a )
{
    $html->find('a')[$i]->href = "http://www.lottecinemavn.com/" . $a->href ;
    $i++;
}
echo $html;


?>
