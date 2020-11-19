<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="generalStyle">
 <style>
 body {@@language_related_body_css@@ background-color:#EEEDF2}  /* darken this?*/
 .listing td {border-bottom: 1px solid #eee}
/* .listing tr:hover td {background-color:#eee} */
 .listing th {background-color:#f5f5f5 }
h1 {font-size:140%; margin:0; }
h2{font-size:120%; margin:0;}
h3 {font-size:100%; margin:0;}
 h4{line-height: 0.2em}
 </style>
</xsl:template>

<xsl:template name="bodyStyleCss">
font-family: "Helvetica neue", Verdana, Arial, sans-serif; color:#333; margin:0; padding:10px 0 10px 0; font-size:110% ; background:#EEEDF2; /* darken this?*/
</xsl:template>

<xsl:template name="listStyleCss">
list-style: none; margin:0 0 0 1em; padding:0;
</xsl:template>

<xsl:template name="mainTableStyleCss">
width:600px; text-align:left; background-color:#fff; padding-left:8px; padding-right:8px; font-size:100%;
</xsl:template>

<xsl:template name="headerLogoStyleCss">
background-color:#ffffff;  width:100%;
</xsl:template>

<xsl:template name="headerTableStyleCss">
background-color:#fff;  width:600px; height:30px; padding-left:8px; padding-right:8px;
</xsl:template>

<xsl:template name="footerTableStyleCss">
padding:8px 0 20px 0 ; width:600px; color:#444;  font-size:80%; background:#fff; padding-left:8px; padding-right:8px;
</xsl:template>


</xsl:stylesheet>