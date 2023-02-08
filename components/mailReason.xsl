<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="toWhomIsConcerned">
<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background-color:#fff; padding:0 8px 0 8px;" >
	<tr>
		<td>
			<xsl:for-each select="notification_data">
				<!--use receiver first name-->
				<p style="text-align:left;">@@dear@@ <xsl:value-of select="receivers/receiver/user/first_name"/>,</p>
			</xsl:for-each>
		</td>
	</tr>
</table>


</xsl:template>

<xsl:template name="returns">
	<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background-color:#fff; padding:0 8px 0 8px;" role="presentation" >
		<tr>
			<td>
				<p>Most items may be returned to any Los Rios library. Reserve textbooks, laptops, and equipment should be returned to the college you checked them out from.</p>
				<p>Please see college-specific instructions on returns:</p>
				<ul>
					<li><a href="https://answers.library.losrios.edu/arc/faq/334191">ARC</a></li>
					<li><a href="https://answers.library.losrios.edu/crc/faq/320267">CRC</a></li>
					<li><a href="https://answers.library.losrios.edu/flc/faq/327551">FLC</a></li>
					<li><a href="https://answers.library.losrios.edu/scc/faq/316527">SCC</a></li>
				</ul>
			</td>
		</tr>
		
	</table>
</xsl:template>
	

</xsl:stylesheet>