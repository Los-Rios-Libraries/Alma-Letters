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
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word; padding-left:8px;">
							<tr>
								<td>
									@@on@@
									<xsl:value-of select="notification_data/request/create_date" />
									you requested the following item(s):
									
									
								</td>
							</tr>
							<tr>
								<td style="padding-left:20px;">
									<xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl -->
								</td>
							</tr>


							<xsl:if test="notification_data/request/start_time != ''">
								<tr>
									<td>
										<b> @@start_time@@: </b>
										<xsl:value-of select="notification_data/booking_start_time_str" />
									</td>
								</tr>
							</xsl:if>
						<xsl:if test="notification_data/request/end_time != ''">
								<tr>
									<td>
										<b> @@end_time@@: </b>
										<xsl:value-of select="notification_data/booking_end_time_str" />
									</td>
								</tr>
							</xsl:if>
						<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td>
										<b> @@request_note@@: </b>
										<xsl:value-of select="notification_data/request/note" />
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<p>We have canceled this request.</p>
									<p>Reason for canceling:</p>
									<p><xsl:value-of select="notification_data/request/status_note_display" /></p>
								</td>
							</tr>
							<xsl:if test="notification_data/request/cancel_reason != ''">
								<tr>
									<td>
										<b> @@request_cancellation_note@@: </b>
										<xsl:value-of select="notification_data/request/cancel_reason" />
									</td>
								</tr>
							</xsl:if>
						</table>
						
					
					</div>
				</div>
				 <xsl:call-template name="lrGoToAccount" />
        <!-- footer.xsl -->
        <xsl:call-template name="lrPatronFooter" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
