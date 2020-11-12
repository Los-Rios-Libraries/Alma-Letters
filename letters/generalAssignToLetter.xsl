<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
				<xsl:call-template name="bodyStyleCss" />
				<!-- style.xsl -->
			</xsl:attribute>

			<xsl:call-template name="head" />
			<!-- header.xsl -->
			<xsl:call-template name="senderReceiver" />
			<!-- SenderReceiver.xsl -->

			<br />
			<xsl:call-template name="toWhomIsConcerned" />
			<!-- mailReason.xsl -->

			<table cellspacing="0" cellpadding="5" border="0">
				<tr>
					<td>
						@@you_are_assign@@
						<xsl:value-of select="/notification_data/assigned_object_name" /><br />
					</td>
				</tr>
			</table>
			<xsl:if test="notification_data/note">


				<br />
				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>
							<strong>@@note@@:</strong>&#160;
							<xsl:value-of select="/notification_data/note" />
						</td>
					</tr>
				</table>


			</xsl:if>
			<table cellspacing="0" cellpadding="5" border="0">
				<tr>
					<td>
						<a href="https://caccl-lrccd.alma.exlibrisgroup.com/SAML/idpCode/LRCCD">Go to Alma</a>
					</td>
				</tr>
			</table>
			<xsl:call-template name="lastFooter" />
			<!-- footer.xsl -->
		</body>

		</html>
	</xsl:template>

</xsl:stylesheet>