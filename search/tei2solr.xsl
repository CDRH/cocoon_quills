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
					<!--<xsl:choose>
						<xsl:when test="//body//date/@value">
							<xsl:value-of select="substring(//body//date/@value,1,4)"/>
						</xsl:when>-->
					<!--<xsl:otherwise>
							<xsl:value-of select="//sourceDesc//date"/>
						</xsl:otherwise>-->
					<!--</xsl:choose>-->
				</field>

				<field name="titleMain">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/titleStmt/title[@type='main']"/>
				</field>
				
				<field name="titleSub">
					<xsl:value-of select="/TEI/teiHeader/fileDesc/titleStmt/title[@type='sub']"/>
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
				
				
				<xsl:apply-templates/>

			</doc>
		</add>


	</xsl:template>

	<!-- ignore tags -->
	<xsl:template match="revisionDesc"/> 
	<xsl:template match="availability"/>
	<xsl:template match="principal"/>
	<xsl:template match="date"/>
	<xsl:template match="publicationStmt"/>
	<xsl:template match="keywords"/>
	
	
	<!--<xsl:template match="fileDesc/titleStmt/title[1]">
		<xsl:choose>
			<xsl:when test="//titleStmt/title[@type='main']">
				<field name="title"><xsl:value-of
						select="normalize-space(//titleStmt/title[@type='main'])"
						/>&#160;<xsl:value-of
						select="normalize-space(//titleStmt/title[@type='sub'])"/>
				</field>
			</xsl:when>
			<xsl:otherwise>
				<field name="title">
					<xsl:value-of select="normalize-space(//titleStmt/title)"/>
				</field>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->

	<!-- author -->
	<!--<xsl:template match="handList">
		<xsl:choose>
			<xsl:when test="//text/body/div1/sp">
				<xsl:for-each select="hand">
					<xsl:variable name="speaker" select="@id"/>
					<xsl:choose>
						<xsl:when test="//text/body/div1/sp[@who=$speaker]">
							<field name="author">
								<xsl:value-of select="@scribe"/>
							</field>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="//monogr/author">
					<field name="author">
						<xsl:value-of select="normalize-space(.)"/>
					</field>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>-->
	<!-- 
		<xsl:templat match="text/body/div1/sp">
		<xsl:variable name="speaker" select="./@who"/>
		<dc:creator><xsl:value-of select="//handList/hand[@id=$speaker]/@scribe"/></dc:creator>
	</xsl:template>-->

	<!-- editor/contributor -->

	<!--<xsl:template match="monogr[1]/editor">
		<field name="editor">
			<xsl:value-of select="."/>
		</field>
	</xsl:template>-->


	<!--subjects -->
	<!--<xsl:template match="keywords/term">
		<field name="subject">
			<xsl:value-of select="normalize-space(.)"/>
		</field>
	</xsl:template>-->


	<xsl:template match="text()">
		<xsl:if test="normalize-space(.) != ''">
			<field name="text">
				<xsl:value-of select="normalize-space(.)"/>
			</field>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
