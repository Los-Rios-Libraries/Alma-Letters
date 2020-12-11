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

				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
				
				<table role="presentation" cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px;">
				<tr>
					<td>@@You_were_specify@@</td>
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
						This resource should be available within 15 minutes.
					</xsl:when>
					<xsl:when test= "contains(notification_data/message, 'Will be available in 48 hours')">
						The above item will be available in 48 hours.
					</xsl:when>
					<xsl:when test="notification_data/message = 'Item was received.'">
						<p>This item has been received and will be viewable in OneSearch within 15 minutes.</p>
						
						<p>It may take some time for this item to get to the shelf. Shelving location and call number are subject to change. If you would like to request this item, please follow the prompts in OneSearch.</p>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="notification_data/message"/>
					</xsl:otherwise>
				</xsl:choose>
					</td>
				</tr>
				<tr>
					<td>
					<table role="presentation" align="center" cellpadding="0" style="width:auto !important; background:#fff;">
					<tr>
					<td align="center" style="text-align:center; wi">
						<a style="display:block;color:#ffffff;background:#252d65;font-size:13px;font-weight:bold;text-decoration:none;border:12px solid #252d65;border-radius: 4px;">
							<xsl:attribute name="href">
									<xsl:text>https://www.library.losrios.edu/onesearch/?record=</xsl:text>
									<xsl:value-of  select="notification_data/mms_id"/>
							</xsl:attribute>
							View in OneSearch
						</a>
					</td>
					</tr>
				</table>


					</td>
				</tr>
				</table>
				<!-- footer.xsl -->
				<xsl:call-template name="lrPatronFooter" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>