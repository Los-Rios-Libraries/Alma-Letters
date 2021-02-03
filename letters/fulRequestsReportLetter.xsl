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

				<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 12px 12px 15px;table-layout:fixed; word-wrap:break-word;">
					<tr>
						<td>
							<p>@@please_find_below@@</p>
						</td>
					</tr>

					<xsl:if test="notification_data/non_active_requests/ful_request_interpated">
					<tr>
						<td style="padding-top:14px;">
						<h3>@@not_active@@</h3>
						</td>
					</tr>
					<tr>
						<td>
							<table cellspacing="0" cellpadding="0" border="0" align="center" style="background:#fff; padding: 12px 0 12px 15px; ">
								<tr style="text-align:left;">
									<th>@@title@@</th>
									<th>@@place_in_queue@@</th>
									<th>@@pickup_location@@</th>
								</tr>
								<xsl:for-each select="notification_data/non_active_requests/ful_request_interpated">
								<tr>
									<td><xsl:value-of select="title_display"/></td>
									<td><xsl:value-of select="place_in_queue"/></td>
									<td><xsl:value-of select="pickup_location_display"/></td>
								</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					</xsl:if>
					<xsl:if test="notification_data/process_requests/ful_request_interpated">
					<tr>
						<td style="padding-top:14px;">
						<h3>@@in_process@@</h3>
						</td>
					</tr>
					<tr>
						<td>
							<table cellspacing="0" cellpadding="5" border="0" align="center" style="background:#fff; padding: 12px 0 12px 15px;">
								<tr style="text-align:left;">
									<th>@@title@@</th>
									<th>@@status@@</th>
									<th>Processed by</th>
								</tr>

								<xsl:for-each select="notification_data/process_requests/ful_request_interpated">
								<tr>
									<td><xsl:value-of select="title_display"/></td>
									<td>
										<xsl:choose>
											<xsl:when test="request_status_display = 'Pickup From Shelf'">
												Staff have not yet retrieved this item for pickup
											</xsl:when>
											
											<xsl:otherwise>
												<xsl:value-of select="request_status_display"/>
											</xsl:otherwise>
										</xsl:choose>
										
										</td>
									<td>
										<xsl:value-of select="pickup_location_display"/>
									</td>
								</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					<td>Please note that any items listed above are <em>not</em> yet ready be picked up. You will receive an email from the library when they are ready.</td>
					</xsl:if>

					<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">
					<tr>
						<td style="padding-top:14px;">
						<h3>@@on_hold_shelf@@</h3>
						</td>
					</tr>
					<tr>
						<td>
							<table cellspacing="0" cellpadding="5" border="0" align="center" style="background:#fff; padding: 12px 0 12px 15px;">
								<tr style="text-align:left;">
									<th>@@title@@</th>
									<th>@@status@@</th>
									<th>Held until</th>
									<th>@@pickup_location@@</th>
								</tr>
								<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
								<tr>
									<td><xsl:value-of select="title_display"/></td>
									<td><xsl:value-of select="request_status_display"/></td>
									<td><xsl:value-of select="work_flow_entity/expiration_date" /></td>
									<td>
										<!--Some changes for closure situation below - get rid of "circulation desk"-->
										<!--<xsl:value-of select="pickup_location_display"/>-->
										<xsl:choose>
											<xsl:when test="pickup_location_display = 'American River College Library - Circulation Desk'">
												American River College Library
											</xsl:when>
											<xsl:when test="pickup_location_display = 'Cosumnes River College Library - Circulation Desk'">
												Cosumnes River College Library
											</xsl:when>
											<xsl:when test="pickup_location_display = 'Folsom Lake College Library - Circulation Desk'">
												Folsom Lake College Library
											</xsl:when>
											<xsl:when test="pickup_location_display = 'Sacramento City College Library - Circulation Desk'">
												Sacramento City College Library
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="pickup_location_display"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								</xsl:for-each>
							</table>
						</td>
					</tr>
					<tr>
						<td style="padding:12px 12px 12px 15px;">
							<p>Please follow your library&apos;s guidance on picking up library materials during the temporary library closures. See instructions from:</p>
							<ul>
								<li>
									<a href="https://libguides.arc.losrios.edu/closure/library_materials"><abbr title="American River College">ARC</abbr></a>
								</li>
								<li>
									<a href="https://answers.library.losrios.edu/crc/faq/335859"><abbr title="Cosumnes River College">CRC</abbr></a>
								</li>
								<li>
									<a href="https://researchguides.flc.losrios.edu/library_closure/checkout"><abbr title="Folsom Lake College">FLC</abbr></a>
								</li>
								<li>
									<a href="https://answers.library.losrios.edu/scc/faq/335622"><abbr title="Sacramento City College">SCC</abbr></a>
								</li>
							</ul>
						</td>
					</tr>
					</xsl:if>
				</table>

				<!-- footer.xsl -->
				<xsl:call-template name="lrGoToAccount" />
				<xsl:call-template name="lrPatronFooter" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>