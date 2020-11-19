<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="salutation">

</xsl:template>
<xsl:template name="lrStaffFooter"> 
	<table align="center">
		<xsl:attribute name="style">
			<xsl:call-template name="footerTableStyleCss" />
			<!-- style.xsl -->
		</xsl:attribute>
		<tr>

			<td>
				<hr style="border:1px solid #ccc;" />Sent by the <a href="https://www.library.losrios.edu/">Los Rios Libraries</a></td>
		</tr>
		<tr>
			<td>
				Learn together at <a href="https://answers.library.losrios.edu/lrcq">Los Rios Common Questions</a>
			</td>
		</tr>
	</table>
</xsl:template>


<xsl:template name="lastFooter">
	<table>
	<xsl:attribute name="style">
		<xsl:call-template name="footerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
	<tr>
	<xsl:for-each select="notification_data/organization_unit">

		<xsl:attribute name="style">
			<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
		</xsl:attribute>
			<td align="center"><xsl:value-of select="name"/>&#160;<xsl:value-of select="line1"/>&#160;<xsl:value-of select="line2"/>&#160;<xsl:value-of select="city"/>&#160;<xsl:value-of select="postal_code"/>&#160;<xsl:value-of select="country"/></td>

	</xsl:for-each>
	</tr>
	</table>
</xsl:template>
<xsl:template name="contactUs">
	<table align="left">
	<tr>
	<td align="left">
		<a>
            <xsl:attribute name="href">@@email_contact_us@@</xsl:attribute>
			@@contact_us@@
		</a>
	</td>
</tr>
	</table>
</xsl:template>
<xsl:template name="myAccount">
	<table align="right">
	<tr>
	<td align="right">
		<a>
            <xsl:attribute name="href">@@email_my_account@@</xsl:attribute>
			@@my_account@@
		</a>
	</td>
</tr>
	</table>
</xsl:template>



</xsl:stylesheet>