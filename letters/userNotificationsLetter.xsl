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
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
				<!--<xsl:call-template name="head-do" />-->
				<!-- header.xsl -->

				<!--<xsl:call-template name="senderReceiver" />--> <!-- SenderReceiver.xsl -->

				<xsl:call-template name="toWhomIsConcerned" /><!-- mailReason.xsl -->

				<div class="messageArea">
					<div class="messageBody">



						<table cellspacing="0" cellpadding="5" border="0" width="600" style="width:600px; background:#fff; padding:0 8px 0 8px;" align="center">
							<xsl:choose>
								<xsl:when test="notification_data/notification_type = 'NOTIFY_PASSWORD_CHANGE' ">
									<tr>
										<td>
											<h3>@@Line_19@@</h3>
											<xsl:value-of select="notification_data/temp_password" />
										</td>

									</tr>
									<tr>

										<td>
											<h3>@@Line_20@@</h3>
										</td>
									</tr>
								</xsl:when>
									<tr>
										<td>
											<ul>
											</ul>

										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_ARC'">
									<tr>
										<td>
											<p>@@Line_1@@</p>
											<p>@@Line_2@@</p>
											<p>@@Line_3@@</p>
											<p>@@Line_4@@</p>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_CRC'">
									<tr>
										<td>
											<p>@@Line_5@@</p>
											<p>@@Line_6@@</p>
											<p>@@Line_7@@</p>
											<p>@@Line_8@@</p>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_FLC'">
									<tr>
										<td>
											<p>@@Line_9@@</p>
											<p>@@Line_10@@</p>
											<p>@@Line_11@@</p>
											<p>@@Line_12@@</p>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'CUSTOM_LETTER_SCC'">
									<tr>
										<td>
											<p>@@Line_13@@</p>
											<p>@@Line_14@@</p>
											<p>@@Line_15@@</p>
											<p>@@Line_16@@</p>
										</td>
									</tr>
								</xsl:when>
								
							</xsl:choose>
						</table>
					</div>
				</div>
				<xsl:call-template name="lrGoToAccount" />
				<xsl:call-template name="lrPatronFooter" />
				<!--<xsl:call-template name="lrDOFooter" />-->

				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>