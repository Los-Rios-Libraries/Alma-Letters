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
								<xsl:when test="notification_data/notification_type = 'RETURN_DAYS'">
									<tr>
										<td>
											<p>According to our records, you currently have a calculator on loan from Sacramento City College. If you are no longer a student, or you are continuing but no longer need the calculator, please return it.</p>
											<p><em>By returning this device, you will be helping other students during this difficult time.</em></p>
											<p>You may drop the calculator in either of the Book Returns located in front of or behind the Learning Resource Center.</p>
											<p>For more details on returning items during the campus closure, please see our dedicated page, <a href="https://answers.library.losrios.edu/scc/faq/316527">When and how can I return books and other library materials during the COVID-19 closure?</a></p>
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