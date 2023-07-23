<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="1.0" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" encoding="UTF-8" indent="yes"/>

<!--
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="xml" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
-->

<!--XHTML document outline-->
<xsl:template match="/">
<HTML>
<HEAD>
  <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

  <META name="keywords" content="half-life, game, ps2, decay, half-life decay"/>
  <META name="description" content=" "/>
  <META content="follow" name="robots"/>
  <link rel="stylesheet" type="text/css" href="css/decay.css"/>

  <TITLE> Half-Life: Decay </TITLE>

  <style>
  .statsTable { width: 550px }
  .statsTable tr td { text-align: center }
  .statsTable .label { text-align: left }
  .statsTable tr .missionimage { width: 130px }

  .human { width: 16px; height: 32px; background: url('gfx/decay_girls.gif') }
  .alien { width: 16px; height: 32px; background: url('gfx/decay_aliens.gif') }
  .player1 { background-position: 0px 0px }
  .player2 { background-position: 16px 0px }

  .grade { color: #F3A621; font-weight: bold }

  .dyimage { width: 128px; height: 56px; background: url('gfx/decay_pieces_01.gif'); border-right: 2px solid #F3A621 }
  .dy_accident1 { background-position: 0px 0px }
  .dy_accident2 { background-position: 0px 0px }
  .dy_hazard { background-position: 128px 0px }
  .dy_uplink { background-position: 0px 256px }
  .dy_dampen { background-position: 128px 256px }
  .dy_dorms { background-position: 0px 192px }
  .dy_signal { background-position: 128px 192px }
  .dy_focus { background-position: 0px 128px }
  .dy_lasers { background-position: 128px 128px }
  .dy_fubar { background-position: 0px 64px }
  .dy_outro { background-position: 0px 64px }
  .dy_alien { background-position: 128px 64px }
  </style>

  <STYLE type="text/css" media="all">
    <!--
    @import url("css/decay.css");
    -->
  </STYLE>
  <!--[if lte IE 6]>
    <style type="text/css">
    .iefix { height: 0.01%; }
    </style>
  <![endif]-->
</HEAD>

<BODY id="Home Page">
<DIV id="main">
  <DIV id="wrapper">
    <DIV id="masthead">
      <DIV id="flashcontent">
      <EMBED width="806" height="244" src="flash/Head.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" align="middle" play="true" loop="false" scale="showall" wmode="transparent" devicefont="false" bgcolor="#ffffff" name="Head" menu="true" allowfullscreen="false" allowscriptaccess="sameDomain" salign="" type="application/x-shockwave-flash"/>
      <EMBED width="806" height="64" src="flash/menu.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" align="middle" play="true" loop="true" scale="showall" wmode="transparent" devicefont="false" bgcolor="#ffffff" name="menu" menu="true" allowfullscreen="false" allowscriptaccess="sameDomain" salign="" type="application/x-shockwave-flash"/>
      </DIV> <!-- end of flashcontent -->
    </DIV> <!-- end of masthead -->
  </DIV> <!-- end of wrapper -->

  <DIV class="clear"></DIV>

  <DIV id="contentWrapper">
    <!-- DIV id="leftside">
    </DIV -->
    <DIV id="rightside">

    <TABLE border="0"  width="600" height="100%" cellspacing="0">
    <TBODY>
    <TR>
    <TD class="ctable_topleft"> </TD>
    <TD class="ctable_topright" width="21px"> </TD>
    </TR>
    <TR>
    <TD class="ctable_middleleft" id="contentarea" height="100%">
    <DIV class="articleItem">
    <xsl:apply-templates/>
    <br/>
    <DIV class="tagCloud">
    <a href="#top">[ top ]</a>
    </DIV>
    </DIV>
    </TD>
    <TD class="ctable_middleright" width="21px"> </TD></TR><TR><TD class="ctable_bottomleft"> </TD><TD class="ctable_bottomright" width="21px"> </TD>
    </TR>
    </TBODY>
    </TABLE>
    <BR/>
    </DIV> <!-- rightSide -->
  </DIV> <!-- end of contentWrapper -->
</DIV> <!-- end of Main -->

<DIV id="footer">
  <P>
  <A href="manual.xml">how to play</A> |
  <A href="stats.xml">stats</A> |
  <A href="credits.xml">credits</A> |
  <A href="http://decay.half-lifecreations.com/">official site</A> |
  <A href="http://decay.half-lifecreations.com/forum/">forum</A>
  </P>
  <P>
  Decay PC (C) Copyright 2004-2008 Vyacheslav Dzhura and Denys Zhatov. Portions by Hayri Yurdakul.<br/>
  Idea\game-design\models\sounds Copyright 2001 Gearbox Software.<BR/>
  All Rights Reserved. Page designed by <A href="http://www.dimensionforce.com.ua/langsettings.php?change=en" target="_blank">Dimension Force</A>
  </P>
</DIV> <!-- end of footer -->
</BODY></HTML>
</xsl:template>

    <!--Table headers and outline-->
    <xsl:template match="document">
      <h2><xsl:value-of select="title"/></h2>
      <xsl:copy-of select="body" />
    </xsl:template>

    <!--Stats page-->

    <xsl:template name="getMapName">
       <xsl:if test="name/text() = 'dy_accident1'">
         <xsl:text>00: INTRO</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_accident2'">
         <xsl:text>01: DUAL ACCESS</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_hazard'">
         <xsl:text>02: HAZARDOUS COURSE</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_uplink'">
         <xsl:text>03: SURFACE CALL</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_dampen'">
         <xsl:text>04: RESONANCE</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_dorms'">
         <xsl:text>05: DOMESTIC VIOLENCE</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_signal'">
         <xsl:text>06: CODE GREEN</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_focus'">
         <xsl:text>07: CROSSFIRE</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_lasers'">
         <xsl:text>08: INTENSITY</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_fubar'">
         <xsl:text>09: RIFT</xsl:text>
       </xsl:if>
       <xsl:if test="name/text() = 'dy_alien'">
         <xsl:text>10: XEN ATTACKS</xsl:text>
       </xsl:if>
    </xsl:template>

    <!-- input param "statsType" -->
    <xsl:template name="showStats">
      <xsl:param name="statsType"></xsl:param>
      <xsl:for-each select="$statsType">
      Player id: <xsl:value-of select="id"/><br/>
      Accuracy: <xsl:value-of select="accuracy"/><br/>
      Damage: <xsl:value-of select="damage"/><br/>
      Hits: <xsl:value-of select="hits"/><br/>
      Kills: <xsl:value-of select="kills"/><br/>
      <br/>
      Final grade:  <xsl:value-of select="grades/final"></xsl:value-of>
      Accuracy grade:  <xsl:value-of select="grades/accuracy"></xsl:value-of>
      Damage grade:  <xsl:value-of select="grades/damage"></xsl:value-of>
      Kills grade:  <xsl:value-of select="grades/kills"></xsl:value-of>
      <br/><br/>
      </xsl:for-each>
    </xsl:template>

    <xsl:template name="showStats2">
    <table class="statsTable">
      <tr>
        <td></td>
        <td>

        <xsl:choose>
          <xsl:when test="alien = 1">
            <div class="player1 alien"></div>
          </xsl:when>
          <xsl:otherwise>
            <div class="player1 human"></div>
          </xsl:otherwise>
        </xsl:choose>

        </td>
        <td>

        <xsl:choose>
          <xsl:when test="alien = 1">
            <div class="player2 alien"></div>
          </xsl:when>
          <xsl:otherwise>
            <div class="player2 human"></div>
          </xsl:otherwise>
        </xsl:choose>

        </td>
        <td></td>
      </tr>
      <tr>
        <td class="label">Accuracy</td>
        <td><xsl:value-of select="round( best[id=1]/accuracy )"></xsl:value-of>%</td>
        <td><xsl:value-of select="round( best[id=2]/accuracy )"></xsl:value-of>%</td>
        <td class="missionimage" rowspan="4"><div class="dyimage {name}" ></div></td>
      </tr>
      <tr>
        <td class="label">Kills</td>
        <td><xsl:value-of select="best[id=1]/kills"></xsl:value-of></td>
        <td><xsl:value-of select="best[id=2]/kills"></xsl:value-of></td>
      </tr>
      <tr>
        <td class="label">Wounds</td>
        <td><xsl:value-of select="best[id=1]/damage"></xsl:value-of></td>
        <td><xsl:value-of select="best[id=2]/damage"></xsl:value-of></td>
      </tr>
      <tr>
        <td class="label">Grade</td>
        <td class="grade"><xsl:value-of select="best[id=1]/grades/final"></xsl:value-of></td>
        <td class="grade"><xsl:value-of select="best[id=2]/grades/final"></xsl:value-of></td>
      </tr>
    </table>
    </xsl:template>

    <xsl:template match="decaystats">
      <xsl:for-each select="map">
      <p>
        <h2><xsl:call-template name="getMapName"></xsl:call-template></h2>
        <h5>
        Mission file name: <xsl:value-of select="name"/>
        <xsl:if test="locked = 1">
        <font color="#FF0000"> [ locked ] </font>
        </xsl:if>
        </h5>
        <!--
        <xsl:call-template name="showStats">
          <xsl:with-param name="statsType" select="best[id=1]"></xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="showStats">
          <xsl:with-param name="statsType" select="best[id=2]"></xsl:with-param>
        </xsl:call-template> -->

        <xsl:call-template name="showStats2">
        </xsl:call-template>

      </p>
      </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>