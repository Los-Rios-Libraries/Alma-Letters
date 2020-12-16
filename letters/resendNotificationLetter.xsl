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
				<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>
							<h3>@@dear@@</h3>
						</td>
					</tr>

				</table>
				<div class="messageArea">
					<div class="messageBody">
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									<h>@@find_attached@@ </h>
								</td>
							</tr>
						</table>

						<br />
						<br />
						<table role='presentation' >
							<tr>
								<td>@@sincerely@@</td>
							</tr>
							<tr>
								<td>@@from@@</td>
							</tr>
						</table>
						<br />
					</div>
				</div>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
				<br />
				<table role='presentation' >
					<xsl:if test="notification_data/file_name !=''">
						<tr>
							<td>
								<strong> @@file_name@@:  </strong>
								<xsl:value-of select="notification_data/file_name" />
							</td>
						</tr>
					</xsl:if>
				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>