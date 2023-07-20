<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
			<xsl:call-template name="head" /> <!-- header.xsl -->
			<!-- <xsl:call-template name="senderReceiver" /> SenderReceiver.xsl -->
			<br/>
			<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
			<div class="messageArea">
				<div class="messageBody">
					<table role='presentation' cellspacing="0" cellpadding="5" border="0">
		              <tr>
		              	<td>
							@@bodyTextBeforeWebhookCode@@
							<xsl:value-of  select="notification_data/webhook_code"/>
							@@bodyTextAfterWebhookCode@@<br/>
		                </td>
		              </tr>
		            </table>
					<table role='presentation'>
						<tr>
							<td>@@signature@@</td>
						</tr>
						<tr>
							<td>
								<xsl:value-of select="notification_data/organization_unit/name" />
							</td>
						</tr>
						<xsl:if test="notification_data/organization_unit/address/city !=''">
							<tr>
								<td>
									<xsl:value-of select="notification_data/organization_unit/address/city" />
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="notification_data/organization_unit/address/country !=''">
							<tr>
								<td>
									<xsl:value-of select="notification_data/organization_unit/address/country" />
								</td>
							</tr>
						</xsl:if>
					</table>
		          </div>
				</div>
			<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>