<?php 

$color = $_GET["color"];
$unit = $_GET["unit"];

if ($color=="red")
	echo file_get_contents("/home/bb/rgblights/red$unit");
if ($color=="blue")
	echo file_get_contents("/home/bb/rgblights/blue$unit");
if ($color=="green")
	echo file_get_contents("/home/bb/rgblights/green$unit");

?>

