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
								<xsl:when test="notification_data/notification_type = 'DO_CHROMEBOOK_EXCHANGE'">
									<tr>
										<td>
											<p>The Los Rios district has a limited number of refurbished desktop computers. You may be eligible to trade your Chromebook loan in for a desktop computer that will be yours to keep.</p>
											<p>Desktop specs:</p>
											<ul>
												<li>23&quot; screen</li>
												<li>30 lbs.</li>
												<li>compact, all-in-one device (no separate tower)</li>
												<li>Windows 10</li>
												<li>enough memory and disk space for additional software.</li>
											</ul>
											<p>If you are interested in exchanging your Chromebook for a desktop, please fill out a request form.</p>
										</td>
									</tr>
									<tr>
										<td>
											<table align="center" cellpadding="0" style="width:auto !important;">
												<tr>
													<td>
														<a style="display:block;color:#ffffff;background:#252d65;font-size:13px;font-weight:bold;text-decoration:none;border:12px solid #252d65;border-radius: 4px; text-align:center;" href="https://hub.losrios.edu/secure/forms/studentDeviceRequest/exchange.php">Computer Exchange Request</a>
													</td>
												</tr>
											</table>
											<p>If desktops are available we will make arrangements for you to come in to pick it up.</p>

										</td>
									</tr>
									
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'COVID_GRANT_LAPTOP'">
									<tr>
										<td>
											<p>According to our records, you currently have a Chromebook or laptop on loan from the college. We are excited to share with you news that <strong>your loaned device is now yours to keep permanently, free of charge!</strong> You are no longer required to return the device to the library and may continue to use it to support ongoing needs. This loan and any related charges will be removed from your student record in the library system. </p>
											<p>If you are no longer in need of the device and do not wish to keep it for any reason, you may return it to the library and we will offer it to another student.</p>
											<p>To transition ownership, your device may need to be reset if it is currently managed by the college; the reset will remove any further access to the device by the college. <strong>You will receive an email the week of May 17, 2021</strong> with additional information about the reset process and what you can expect. </p>
										</td>
									</tr>
									
								</xsl:when>
								<xsl:when test="notification_data/notification_type = 'COVID_GRANT_HOTSPOT'">
									<tr>
										<td>
											<p>According to our records, you currently have a mobile hotspot on loan from the college. We are excited to share with you news that <strong>your loaned hotspot is now yours to keep permanently, free of charge!</strong> You are no longer required to return the hotspot to the library and may continue to use it to support ongoing needs. Service for the hotspot will continue as long as you are enrolled at Los Rios. This loan and any related charges will be removed from your student record in the library system. </p>
											<p>If you are no longer in need of the hotspot and do not wish to keep it for any reason, you may return it to the library and we will offer it to another student.</p>
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