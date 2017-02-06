<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0">

  <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>

  <xsl:param name="pagetype">bird</xsl:param>
  <xsl:param name="browser">test</xsl:param>

  <xsl:include href="config.xsl"/>

  <xsl:template match="/">

    <html lang="en" class="no-js">
      <head profile="http://dublincore.org/documents/dcq-html/">

        <meta charset="utf-8"/>

        <title>
          <xsl:text>Quills</xsl:text>
          <xsl:choose>
            <xsl:when test="$pagetype = 'doc'">
              | Birds | <xsl:value-of select="//text/body/head"/>
            </xsl:when>
            <xsl:when test="$pagetype = 'home'">
              | Home
            </xsl:when>
            <xsl:when test="$pagetype = 'about'">
              | About
            </xsl:when>
            <xsl:when test="$pagetype = 'intro'">
              | Introduction
            </xsl:when>
            <xsl:when test="$pagetype = 'birds'">
              | The Birds
            </xsl:when>
            <xsl:when test="$pagetype = 'bibl'">
              | Bibliography
            </xsl:when>
            <xsl:when test="$pagetype = 'searchresults'">
              | Search
            </xsl:when>
            <xsl:otherwise>
              
            </xsl:otherwise>
          </xsl:choose>  </title>

        <!-- Place favicon.ico and apple-touch-icon.png in the root of your domain and delete these references -->
        <link rel="shortcut icon" href="/favicon.ico"/>
        <link rel="apple-touch-icon" href="/apple-touch-icon.png"/>

        <!-- CSS Reset -->
        <link rel="stylesheet" href="{$siteroot}stylesheets/css/reset.css"/>

        <!-- CSS : implied media="all" -->
        <link rel="stylesheet" href="{$siteroot}stylesheets/css/style.css"/>

      </head>
      <body class="{$pagetype}">



        <div class="all">

          <a href="{$siteroot}">
            <div class="header">
              <h1>Quills and Feathers</h1>
            </div>
          </a>
          <!-- /header -->


          <div class="navigation">
            <ul>
              <li class="home">
                <a href="{$siteroot}">Home</a>
              </li>
              <li class="intro">
                <a href="{$siteroot}intro.html">Introduction</a>
              </li>
              <li class="birds">
                <a href="{$siteroot}birds.html">The Birds</a>
              </li>
              <li class="bibl">
                <a href="{$siteroot}bibliography.html">Bibliography</a>
              </li>

              <li class="about">
                <a href="{$siteroot}about.html">About</a>
              </li>
              <li>


                  <form action="{$siteroot}search/" method="get" style="margin-top: 0px;">
                  <input size="20" type="text" name="q" value="Search this site"
                    onfocus="this.value='';this.select();"/>
                  <input value="search" type="submit" style="padding: 0px; "/>
                  <br/>
                  <!-- edit -->
                  <!--<a href="searchHelp.html" class="help">Search Help</a>-->
                </form>
              </li>
            </ul>
          </div>
          <!-- /navigation -->

          <div class="content">

            <div class="main">

              <!-- HOME  -->

              <xsl:if test="$pagetype = 'home'">
                <xsl:call-template name="home"/>
              </xsl:if>

              <!-- INTRO  -->

              <xsl:if test="$pagetype = 'intro'">
                <xsl:call-template name="intro"/>
              </xsl:if>

              <!--  ABOUT -->

              <xsl:if test="$pagetype = 'about'">
                <xsl:call-template name="about"/>
              </xsl:if>

              <!-- BIBLIOGRAPHY -->

              <xsl:if test="$pagetype = 'bibl'">
                <xsl:call-template name="bibl"/>
              </xsl:if>

              <!--  SEARCH RESULTS -->

              <xsl:if test="$pagetype = 'searchresults'">
                <xsl:call-template name="search"/>
              </xsl:if>

              <!-- BIRDS  -->

              <xsl:if test="$pagetype = 'birds'">
                <xsl:call-template name="birds"/>
              </xsl:if>

              <!--  DOCUMENTS -->

              <xsl:if test="$pagetype = 'doc'">
                <xsl:call-template name="doc"/>
              </xsl:if>
              
              <!--  CREDITS -->
              
              <xsl:if test="$pagetype = 'credits'">
                <xsl:call-template name="credits"/>
              </xsl:if>

              <!--  ERROR - 404 -->

              <xsl:if test="$pagetype = 'error'">
                <p>This page does not exist!</p>
                <p>Please use the navigation or the search at left to find what you are looking
                  for.</p>
              </xsl:if>

            </div>
            <!-- /main -->

          </div>
          <!-- /content -->

          <div id="footer">
            <p>&#169; 2011 University of Nebraska&#8211;Lincoln <br/>Individual works are
              &#169; their respective owners.<br/>
              See <a href="{$siteroot}credits.html">credits page</a> for image and audio credits.</p>
            <img src="{$siteroot}imgs/unl_logo.png" alt="University of Nebraska-Lincoln Logo"/>
          </div>
          <!-- /footer -->

        </div>
        <!-- /all -->

        <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"><xsl:text> </xsl:text></script>
        <script type="text/javascript" src="{$siteroot}js/jQuery.jPlayer.2.0.0/jquery.jplayer.min.js"><xsl:text> </xsl:text></script>
        <script type="text/javascript" src="{$siteroot}js/plugins.js"><xsl:text> </xsl:text></script>
-->
      </body>
    </html>

  </xsl:template>






  <xsl:template match="head">
    <xsl:choose>
      <xsl:when test="head[1]">
        <h2>
          <xsl:apply-templates/>
        </h2>
      </xsl:when>
      <xsl:otherwise>
        <h3>
          <xsl:apply-templates/>
        </h3>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>



  <xsl:template match="text/body/div1/head[1]">
    <h2>
      <xsl:apply-templates/>
    </h2>
  </xsl:template>


  <xsl:template match="lg[@type=poem]">
    <div class="poem">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="l">
    <xsl:choose>
      <xsl:when test="@rend='indent'">
        <p class="indent">
          <xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:when test="@rend='indent2'">
        <p class="indent2">
          <xsl:apply-templates/>
        </p>
      </xsl:when>
      <xsl:otherwise>
        <p>
          <xsl:apply-templates/>
        </p>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template match="lg">
    <xsl:choose>
      <xsl:when test="@type='poem'">
        <div class="linegroup poem">
          <xsl:apply-templates/>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div class="linegroup">
          <xsl:apply-templates/>
        </div>
      </xsl:otherwise>
    </xsl:choose>



  </xsl:template>


  <xsl:template match="bibl[1]">
    <xsl:choose>
      <xsl:when test="string-length(string(title[@level='a'])) &gt; 0">
        <xsl:value-of select="title[@level='a']"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="title[@level='m']"/>
        <xsl:value-of select="title[@level='j']"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>


  <xsl:template match="sic">
    <xsl:apply-templates/>
    <xsl:text> [sic] </xsl:text>
  </xsl:template>

  <xsl:template match="gap[@reason='sampling']"> [&#133;] </xsl:template>

  <xsl:template match="emph | hi[@rend='italic'] | foreign">
    <em>
      <xsl:apply-templates/>
    </em>
  </xsl:template>

  <xsl:template match="list">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="item">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>




  <!-- ==========================================
     Page templates, move into another file later
     ==========================================-->
  <xsl:template name="home">
    <xsl:apply-templates select="//div1[@type='home']"/>
  </xsl:template>

  <xsl:template name="about">
    <xsl:apply-templates select="//div1[@type='about']"/>
  </xsl:template>
  
  <xsl:template name="credits">
    <!--<xsl:apply-templates select="//div1[@type='credits']"/>-->
    <h2>Credits</h2>
    <xsl:for-each select="//div1[@type='credits']/div2">
      <div class="birdcredit"><img>
        <xsl:attribute name="src">
          <xsl:value-of select="$siteroot"/>
          <xsl:text>figures/100/</xsl:text>
          <xsl:value-of select="@xml:id"/>
          <xsl:text>.jpg</xsl:text>
        </xsl:attribute>
      </img>
        <h4><xsl:value-of select="head"/></h4>
        <xsl:if test="bibl[@type='image']">
          <p>Image: 
            <xsl:choose>
            <xsl:when test="bibl[@type='image']/ptr/@target">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="bibl[@type='image']/ptr/@target"/>
                </xsl:attribute>
                <xsl:value-of select="bibl[@type='image']"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="bibl[@type='image']"/>
            </xsl:otherwise>
              </xsl:choose></p></xsl:if>
          
        <xsl:if test="bibl[@type='audio']"><p>Audio: <a>
          <xsl:attribute name="href">
            <xsl:value-of select="bibl[@type='audio']/ref/@target"/>
          </xsl:attribute>
          <xsl:value-of select="bibl[@type='audio']"/>
        </a></p></xsl:if>
     
      </div>
    </xsl:for-each>
   </xsl:template>

  <xsl:template name="intro">
    <xsl:apply-templates select="//div1[@type='intro']"/>
  </xsl:template>




  <xsl:template name="bibl">
    <xsl:apply-templates select="//div1[@type='bibl']"
      xpath-default-namespace="http://www.tei-c.org/ns/1.0"/>

    <xsl:for-each select="//doc" xpath-default-namespace="">
      <!--<xsl:sort select="str[@name='id']"/>-->

      <xsl:if test="str[@name='speciesName'][.!='']">

        <xsl:variable name="birdpagelink">
          <xsl:value-of select="str[@name='id']"/>
        </xsl:variable>
        <div class="biblInfo">
          <h3>
            <a href="{$siteroot}doc/{$birdpagelink}.xml">
              <xsl:value-of select="str[@name='titleMain']"/>
            </a>
          </h3>
          
            <p>Author: <xsl:apply-templates select="str[@name='author']"/></p>
         <xsl:choose>
           <xsl:when test="not(str[@name='periodical'] = '')">
             <p>Journal: <xsl:apply-templates select="str[@name='periodical']"/></p>
           </xsl:when>
           <xsl:when test="not(str[@name='book'] = '')">
             <p>Book: <xsl:apply-templates select="str[@name='book']"/></p>
           </xsl:when>
         </xsl:choose>

          <xsl:if test="not(int[@name='date'] = '')">
            <p>Date: <xsl:apply-templates select="int[@name='date']"/></p>
          </xsl:if>

        </div>
      </xsl:if>

    </xsl:for-each>

  </xsl:template>




  <xsl:template name="birds">
    <xsl:apply-templates select="//div1[@type='birds']"
      xpath-default-namespace="http://www.tei-c.org/ns/1.0"/>


    <xsl:for-each-group select="//doc" group-by="str[@name='speciesName']"
      xpath-default-namespace="">

      <xsl:sort select="str[@name='speciesName']"/>


      <xsl:if test="str[@name='speciesName'][.!='']">
        <div class="birdArticles">
          <h3>
            <xsl:value-of select="str[@name='speciesName']"/>
          </h3>

          <xsl:for-each select="current-group()">

            <xsl:variable name="birdpagelink">
              <xsl:value-of select="str[@name='id']"/>
            </xsl:variable>

            <p>
              <a href="{$siteroot}doc/{$birdpagelink}.xml">
                <xsl:value-of select="str[@name='titleMain']"/>
              </a>
            </p>

          </xsl:for-each>
        </div>
      </xsl:if>

    </xsl:for-each-group>

  </xsl:template>





  <xsl:template name="doc">

    <div class="literature">
      <xsl:apply-templates select="//text"/>
    </div>
    <!-- /literature -->
    <div class="media">
      <xsl:for-each select="//keywords[@n='species']/term/@key">

        <xsl:variable name="birdkey">
          <xsl:value-of select="."/>
        </xsl:variable>

        <h2>
          <xsl:value-of select="//keywords[@n='species']"/>
        </h2>
        <h3>
          <xsl:value-of select="//keywords[@n='scientific']"/>
        </h3>

        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>figures/230/</xsl:text>
            <xsl:value-of select="$birdkey"/>
            <xsl:text>.jpg</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="height">
            <xsl:text>230</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="width">
            <xsl:text>230</xsl:text>
          </xsl:attribute>
        </img>


        <xsl:if test="not(//keywords[@n='species']/term/@type = 'noAudio')">
          <audio controls="controls">
            <source src="{$siteroot}audio/mp3/{$birdkey}.mp3"/>
            <source src="{$siteroot}audio/ogg/{$birdkey}.ogg"/>

            <embed src="http://www.google.com/reader/ui/3523697345-audio-player.swf"
              flashvars="audioUrl={$siteroot}audio/mp3/{$birdkey}.mp3"
              type="application/x-shockwave-flash" width="230" height="27" quality="best"/>
          </audio>

          <p>
            <a href="{$siteroot}audio/mp3/{$birdkey}.mp3">mp3 file</a> | <a
              href="{$siteroot}audio/ogg/{$birdkey}.ogg">ogg file</a>
          </p>
        </xsl:if>
      </xsl:for-each>

    </div>


    <div class="projectNote">

      <h3>Notes</h3>
      <xsl:apply-templates select="//note[@type='project']"/>
    </div>
    <!-- /projectNote -->

    <div class="meta">
      <div class="bib">

        <h3>Bibliographical information</h3>
        <xsl:if test="//bibl/author">
          <p>Author: <xsl:apply-templates select="//bibl/author"/></p>
        </xsl:if>

        <xsl:if test="//bibl/title[@level='m']">
          <p>Book: <xsl:apply-templates select="//bibl/title[@level='m']"/></p>
        </xsl:if>
        <xsl:if test="//bibl/title[@level='j']">
          <p>Journal: <xsl:apply-templates select="//bibl/title[@level='j']"/>
            <xsl:if test="//bibl/biblScope[@type='page']"> , p: <xsl:apply-templates
                select="//bibl/biblScope[@type='page']"/>
            </xsl:if>
            <xsl:if test="//bibl/biblScope[@type='volume']"> , volume: <xsl:apply-templates
                select="//bibl/biblScope[@type='volume']"/>
            </xsl:if>
          </p>
        </xsl:if>



        <xsl:if test="//bibl/date">
          <p>Date: <xsl:apply-templates select="//bibl/date"/></p>
        </xsl:if>

        <xsl:if test="//bibl/publisher">
          <p>Publisher: <xsl:apply-templates select="//bibl/publisher"/></p>
        </xsl:if>


      </div>
      <!-- /bib -->

      <div class="projectInfo">
        <h3>Project Information</h3>

        <div class="iteminfo">

          <p>Genre: <xsl:value-of select="//keywords[@n='genre']"/></p>
          <!--<xsl:for-each select="//keywords">
            <p><xsl:value-of select="@n"/>: <xsl:value-of select="."/></p>
          </xsl:for-each>-->
        </div>
      </div>
      <!-- /projectInfo -->
    </div>
    <!-- /meta -->

  </xsl:template>






  <xsl:template name="search" xpath-default-namespace="">
    <!-- Add check for empty -->
    <xsl:variable name="rows" select="//str[@name='rows']"/>
    <xsl:variable name="searchTerm" select="substring(//str[@name='q'],2,string-length(//str[@name='q'])-2)"/>
    <xsl:variable name="start" select="//str[@name='start']"/>
    <xsl:variable name="numFound" select="//result/@numFound"/>
    <h2>Search Results</h2>
    <p>Your search for <strong>
        <xsl:value-of select="$searchTerm"/>
      </strong> returned <strong>
        <xsl:value-of select="$numFound"/>
      </strong> results.</p>
    <p>Results <xsl:value-of select="$start+1"/> through <xsl:choose>
        <xsl:when test="$numFound &gt; $start+$rows">
          <xsl:value-of select="$start+$rows"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$numFound"/>
        </xsl:otherwise>
      </xsl:choose> shown.</p>
    <xsl:choose>
      <xsl:when test="$start &lt;= 0"> previous </xsl:when>
      <xsl:otherwise>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>search/?q=</xsl:text>
            <xsl:value-of select="$searchTerm"/>
            <xsl:text>&#38;start=</xsl:text>
            <xsl:value-of select="$start - $rows"/>
            <xsl:text>&#38;rows=</xsl:text>
            <xsl:value-of select="$rows"/>
            <xsl:text/>
          </xsl:attribute>previous </a>
      </xsl:otherwise>
    </xsl:choose> | <xsl:choose>
      <xsl:when test="($start + $rows) &gt;= $numFound"> next </xsl:when>
      <xsl:otherwise>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>search/?q=</xsl:text>
            <xsl:value-of select="$searchTerm"/>
            <xsl:text>&#38;start=</xsl:text>
            <xsl:value-of select="$start + $rows"/>
            <xsl:text>&#38;rows=</xsl:text>
            <xsl:value-of select="$rows"/>
          </xsl:attribute>next </a>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:for-each select="//doc">
      <xsl:variable name="birdpagelink">
        <xsl:value-of select="str[@name='id']"/>
      </xsl:variable>
      <div class="searchResult">
        <h3>
          <a href="{$siteroot}doc/{$birdpagelink}.xml">
            <xsl:value-of select="str[@name='titleMain']"/>
          </a>
        </h3>
        <xsl:for-each select="//lst[@name='highlighting']/lst[@name=$birdpagelink]/arr/str">
          <p><xsl:text>...</xsl:text>
            <xsl:analyze-string regex="[\s]" select="normalize-space(.)">
              <xsl:non-matching-substring>
                <xsl:choose>
                  <xsl:when
                    test="contains(.,'&lt;em&gt;') and contains(.,'&lt;/em&gt;')">
                    <b>
                      <xsl:value-of
                        select="replace(replace(.,'&lt;em&gt;',''),'&lt;/em&gt;','')"
                      />
                    </b>
                    <xsl:text> </xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/>
                    <xsl:text> </xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:non-matching-substring>
            </xsl:analyze-string>
          </p>
        </xsl:for-each>
      </div>
    </xsl:for-each>
    <xsl:choose>
      <xsl:when test="$start &lt;= 0"> previous </xsl:when>
      <xsl:otherwise>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>search/?q=</xsl:text>
            <xsl:value-of select="$searchTerm"/>
            <xsl:text>&#38;start=</xsl:text>
            <xsl:value-of select="$start - $rows"/>
            <xsl:text>&#38;rows=</xsl:text>
            <xsl:value-of select="$rows"/>
            <xsl:text/>
          </xsl:attribute>previous </a>
      </xsl:otherwise>
    </xsl:choose> | <xsl:choose>
      <xsl:when test="($start + $rows) &gt;= $numFound"> next </xsl:when>
      <xsl:otherwise>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$siteroot"/>
            <xsl:text>search/?q=</xsl:text>
            <xsl:value-of select="$searchTerm"/>
            <xsl:text>&#38;start=</xsl:text>
            <xsl:value-of select="$start + $rows"/>
            <xsl:text>&#38;rows=</xsl:text>
            <xsl:value-of select="$rows"/>
          </xsl:attribute>next </a>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>








</xsl:stylesheet>
