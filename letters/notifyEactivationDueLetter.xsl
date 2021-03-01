<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
<xsl:template match="/">
<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

		<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

		<xsl:call-template name="generalStyle" />
		</head>

			<body>

			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" />
				<!-- SenderReceiver.xsl -->
				<xsl:call-template name="toWhomIsConcerned" />
			<!-- mailReason.xsl -->

				<table role='presentation'  cellspacing="0" cellpadding="5" border="0" width="600" style="width:600px; background:#fff; padding:0 8px 0 8px; table-layout:fixed;" align="center">
				<tr>
					<td>

				@@notificationTxt@@:



					</td>
					</tr>
</table>
				<table  cellspacing="0" cellpadding="5" border="0" width="600" style="width:600px; background:#fff; padding:8px; table-layout:fixed;" align="center">
					<caption style="text-align:left; padding:12px 0 10px 12px; font-weight:bold; background:#fff;">@@eTaskList@@</caption>
				
							
					<tr style="text-align:left;">
						<th>@@title@@</th>
						<th>@@identifier@@</th>
						<th>@@dueDate@@</th>
						</tr>
			<xsl:for-each select="notification_data/etasks_list/activation_task">
				 <tr>
					<td><xsl:value-of  select="title"/></td>
					<td><xsl:value-of  select="identifier"/></td>
					<td><xsl:value-of  select="due_date"/></td>
				 </tr>

	       </xsl:for-each>
	</table>

				
				<table cellspacing="0" cellpadding="5" border="0"  width="600" style="width:600px; background:#fff; padding:12px 8px 0 8px; text-align:center;" align="center">
				<tr>
					<td>Ready to work on it?</td>
				</tr>
			</table>
			 <xsl:call-template name="lrGoToAlma" />
			<xsl:call-template name="lrStaffFooter" />
			<!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>