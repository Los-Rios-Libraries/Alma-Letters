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

			<xsl:call-template name="toWhomIsConcerned" />
			<!-- mailReason.xsl -->

			<table cellspacing="0" cellpadding="5" border="0" width="600" style="width:600px; background:#fff; padding:0 8px 0 8px;" align="center">
				<tr>
					<td>
						The following
						<xsl:choose>
							<xsl:when test="/notification_data/assigned_object = 'com.exlibris.repository.model.etask.EActivationTask'">
								electronic activation task
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="/notification_data/assigned_object" />
							</xsl:otherwise>
						</xsl:choose>
						has been assigned to you by <xsl:value-of select="/notification_data/owner/first_name" />&#160;<xsl:value-of select="/notification_data/owner/last_name" />:

					</td>
				</tr>
				<tr>
					<td style="padding-left:12px;">
						<xsl:value-of select="/notification_data/assigned_object_name" /><br />
					</td>
				</tr>
			</table>

			<xsl:if test="notification_data/note != ''">
			
				<table cellspacing="0" cellpadding="5" border="0"  width="600" style="width:600px; background:#fff; padding:0 8px 0 8px;" align="center">
					<tr>
						<td>
							<strong>@@note@@:</strong>&#160;
							<xsl:value-of select="/notification_data/note" />
						</td>
					</tr>
				</table>


			</xsl:if>
			 <xsl:call-template name="lrGoToAlma" />
			<xsl:call-template name="lrStaffFooter" />
			<!-- footer.xsl -->
		</body>

		</html>
	</xsl:template>

</xsl:stylesheet>