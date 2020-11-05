<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="toWhomIsConcerned">
<table cellspacing="0" cellpadding="5" border="0">
	<tr>
		<td>
			<xsl:for-each select="notification_data">
				<!--use receiver first name-->
				<p>@@dear@@ <xsl:value-of select="receivers/receiver/user/first_name"/>,</p>
			</xsl:for-each>
		</td>
	</tr>
</table>


</xsl:template>

</xsl:stylesheet>