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
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation"  cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">
							<tr>
								<td style="font-size:100%; padding:12px;">
									@@find_attached@@
								</td>
							</tr>
						</table>
						<xsl:if test="notification_data/file_name !=''">
						<table role="presentation"  cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">
					
						<tr>
							<td style="padding:12px;">
								<strong> @@file_name@@:  </strong>
								<xsl:value-of select="notification_data/file_name" />
							</td>
						</tr>
					
				</table>
						</xsl:if>

					
					</div>
				</div>
				
				<xsl:call-template name="lrGoToAccount" />
						  <!-- footer.xsl -->
				<xsl:call-template name="lrPatronFooter" />
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>