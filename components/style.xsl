<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="generalStyle">
 <style>
  /* for Outlook clients */
table{ mso-table-lspace:0pt;   mso-table-rspace:0pt;}
/* resets */
 img{ border:0 none; height:auto; line-height:100%;outline:none; text-decoration:none; }
 a img{border:0 none;  }
 .imageFix{  display:block;  }
/* for gmail */
 #bodyTable{ height:100% !important;  margin:0; padding:0;   width:100% !important;  }
 body {@@language_related_body_css@@ background:#EEEDF2; margin:0; padding:0; -webkit-text-size-adjust:100%; /* recommended for Apple devices */}
 .listing td {border-bottom: 1px solid #eee}
/* .listing tr:hover td {background-color:#eee} */
 .listing th {background-color:#f5f5f5 }
h1 {font-size:140%; margin:0; }
h2{font-size:120%; margin:0;}
h3 {font-size:100%; margin:0;}
 h4{line-height: 0.2em}
 @media only screen and (max-width:480px){
   body {background: #fff !important; padding:0 !important;}
   table {width:100% !important;}
    }
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