<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
				
				<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px;">
				<tr>
					<td colspan="2">@@You_were_specify@@</td>
				</tr>
				<tr>
					<td>
						<ul>
							<li><strong>@@title@@ </strong> <xsl:value-of select="notification_data/title"/></li>
							<xsl:if test="notification_data/poline_inventory/call_number">
								<li style="padding-top:10px;"><strong>Location: </strong> <xsl:value-of select="notification_data/organization_unit/name"/> - <xsl:value-of select="notification_data/poline_inventory/location/location_name_for_display"/></li>
								<li style="padding-top:10px;"><strong>@@callNumber@@ </strong> <xsl:value-of select="notification_data/poline_inventory/call_number"/></li>
							</xsl:if>
						</ul>
													
					</td>
				</tr>
				<tr>
					<td>
				<!-- Display patron-friendly message based on content of "message" in XML -->
				<xsl:choose>
					<xsl:when test="notification_data/message = 'E-resource was activated.'">
						The above resource will be available within the next 24 hours.
					</xsl:when>
					<xsl:when test= "contains(notification_data/message, 'Will be available in 48 hours')">
						The above item will be available in 48 hours.
					</xsl:when>
					<xsl:when test="notification_data/message = 'Item was received.'">
						The above item is now in stock.
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="notification_data/message"/>
					</xsl:otherwise>
				</xsl:choose>

						<br />

					</td>
					</tr>

				</table>
				<br />

				<!-- footer.xsl -->
				<xsl:call-template name="lrPatronFooter" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>