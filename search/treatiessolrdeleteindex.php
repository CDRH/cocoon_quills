<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Solr Delete</title>
</head>

<body style="text-align:left;">
<ol>
<?php 
/* the xslt conversions are handled by libxml xslt transformations */
$dir="/web/cdrh/earlytreaties/xml/"; $d=dir($dir); $stylesheet = "treaties2solr.xsl";
include 'SolrUpdate.php';

$solr = new SolrUpdate();
if( $solr->sendUpdate('<delete><query>*:*</query></delete>') ) {
	echo "<span style='color:green; font-weight:bold;'>OK</span>";
} else {
	echo "<span style='color:red; font-weight:bold;'>FAIL</span>";
}
$solr->sendUpdate('<optimize/>');
$solr->sendUpdate('<commit waitFlush="false" waitSearcher="false"/>');

?>
</ol>
</body>
</html>
