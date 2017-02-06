<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output encoding="UTF-8" indent="yes" method="html"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <add>
            <doc>

                <field name="id">
                    <xsl:value-of select="TEI.2/@id"/>
                </field>

                <field name="title">
                    <xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title[@type='main']"/>
                </field>

                <field name="project">
																  <xsl:text>liberty</xsl:text>
                </field>

                <xsl:for-each select="descendant::teiHeader/profileDesc/textClass/keywords/term">
                    <xsl:if
                        test="@type='genre' or @type='place' or @type='topic'">
                        <field>
                            <xsl:attribute name="name">
																												  <xsl:value-of select="@type"/>
                            </xsl:attribute>
                            <xsl:value-of select="@id"/>
                        </field>
                    </xsl:if>
                </xsl:for-each>

                <field name="text">
                    <xsl:for-each select="descendant::text">
                        <xsl:value-of select="."/>
                        <xsl:text> </xsl:text>
                    </xsl:for-each>
                </field>

            </doc>
        </add>
    </xsl:template>

</xsl:stylesheet>
