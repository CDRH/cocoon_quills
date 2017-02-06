<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Solr Update</title>
</head>

<body style="text-align:left;">
<ol>
<?php 
/* the xslt conversions are handled by libxml xslt transformations */
$dir="/web/cdrh/earlytreaties/xml/"; $d=dir($dir); $stylesheet = "treaties2solr.xsl";
include 'SolrUpdate.php';
function convert2update ($filename) {
	global $dir; global $stylesheet;
		$xml = new DomDocument();
		$xml->load($dir.$filename);
		$xsl = new DomDocument;
		$xsl->load($stylesheet);
		$proc = new xsltprocessor();
		$proc->importStyleSheet($xsl);
		if (is_array($parameters)) {
			foreach ($parameters as $name=>$value) 	$proc->setParameter('',$name,$value);
		}
		 $xml_data = $proc->transformToXML($xml);
		//echo html_entity_decode($newhtml,ENT_COMPAT,$encoding);
		echo  "<li><p> $filename preprocessing complete</p>";
		/* the solr indexing update commands are included in SolrUpdate.php, but require curl
		to be enabled in PHP */
		
		$solr = new SolrUpdate();
		if ($solr->sendUpdate(preg_replace('/\n/','',$xml_data))) {
			echo "<span style='color:green; font-weight:bold;'>OK</span>";
			$solr->sendUpdate('<commit waitFlush="false" waitSearcher="false"/>');
		}
		echo "</li>";
}


if ($filename = $_GET['file']) {
	convert2update($filename);
}
else {
 while (false !== ($entry = $d->read())) {
 	if (is_file($dir.$entry) && preg_match('/\.valid\.xml$/',$entry) ) {
		convert2update($entry);
	}
	//else echo "$entry is not a file<br />";
  }
}

?>
</ol>
</body>
</html>
