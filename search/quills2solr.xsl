<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0">
	<xsl:output indent="yes"/>
	<xsl:template match="/">
		<add>
      <doc>

				<field name="id">
					<xsl:value-of select="/TEI/@xml:id"/>
				</field>

				<field name="date">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/date/@when"/>
				</field>

				<field name="titleMain">
					<xsl:value-of select="/TEI/text[1]/body[1]/head[1]"/>
				</field>

      			<field name="author">
      				<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/author"/>
      			</field>
      	
		      	<field name="editor">
		      		<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/publisher"/>
		      	</field>
				
				<field name="periodical">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='j']"/>
				</field>
				
				<field name="book">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='m']"/>
				</field>
				
				<field name="article">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='a']"/>
				</field>
				
				<field name="scientificName">
					<xsl:value-of select="/TEI/teiHeader/profileDesc/textClass/keywords[@n='scientific']/term/foreign"/>
				</field>
				
				<field name="speciesName">
					<xsl:value-of select="/TEI/teiHeader/profileDesc/textClass/keywords[@n='species']/term"/>
				</field>
				
				<field name="genre">
					<xsl:value-of select="/TEI/teiHeader/profileDesc/textClass/keywords[@n='genre']/term"/>
				</field>
				
				
				<!--xsl:apply-templates/-->
     <field name="text">
     	
     	<xsl:for-each select="descendant::note[@type='project']">                    
     		<xsl:value-of select="."/>                              
     		<xsl:text> </xsl:text>                                  
     	</xsl:for-each>
     	
     	<xsl:for-each select="descendant::text">                    
         <xsl:value-of select="."/>                              
         <xsl:text> </xsl:text>                                  
       </xsl:for-each>                                             
     </field>
			</doc>
		</add>


	</xsl:template>

	<!-- ignore tags -->
	<!--<xsl:template match="revisionDesc"/> 
	<xsl:template match="availability"/>
	<xsl:template match="principal"/>
	<xsl:template match="date"/>
	<xsl:template match="publicationStmt"/>
	<xsl:template match="keywords"/>-->
	
 <!--xsl:template match="text()">
		<xsl:if test="normalize-space(.) != ''">
			<field name="text">
				<xsl:value-of select="normalize-space(.)"/>
			</field>
		</xsl:if>
	</xsl:template-->
</xsl:stylesheet>
