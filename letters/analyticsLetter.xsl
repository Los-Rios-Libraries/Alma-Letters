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
			<head>
				<xsl:call-template name="generalStyle" />
			</head>
			<body>
				<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="salutation" /> <!-- footer.xsl -->
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background:#fff; padding:8px; ">
							<tr>
								<td>
									@@letterText@@
									&#160;Now, what was it you ordered up? Oh, right:
									
								</td>
							</tr>
							<tr>
								<td>
									<b>
										<xsl:value-of select="/notification_data/report_name" />
									</b>
								</td>
							</tr>
							<tr>
								<td>
									Happy analyzing!
								</td>
							</tr>
						</table>
					</div>
				</div>
				
        <!-- footer.xsl -->
        <xsl:call-template name="lrStaffFooter" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>