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
					<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; text-align:left; background:#fff; padding-left:8px; padding-right:8px;">
						<tr>
							<td>
								The following library material(s) you requested  on <xsl:value-of select="notification_data/request/create_date"/> are now available for pickup from the <!--<xsl:value-of select="notification_data/request/assigned_unit_name"/>-->
								<xsl:value-of select="/notification_data/organization_unit/name" />.
							</td>
						</tr>
						<tr>
							<td style="padding:16px;"><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
						</tr>

						<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
						<tr>
							<td>
							 The item will be held for you until <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
							 </td>
						</tr>
						</xsl:if>
						<!-- pickup schedule -->
						<tr>
							<td>
								<h2>When and where to pick up</h2>
							</td>
						</tr>
						<tr>
							<td>
								<p>You may pick up materials during the following days and times (holidays excluded):</p>
								<xsl:choose>
									<xsl:when test="/notification_data/organization_unit/name = 'American River College Library'">
										<!-- ARC schedule -->
										<p>Monday to Friday, 9:00 am to 2:00 pm</p>
									</xsl:when>
									<xsl:when test="/notification_data/organization_unit/name = 'Cosumnes River College Library'">
										<!-- CRC schedule -->
									<ul>
										<li>Monday to Thursday, 9:00 am to 1:00 pm</li>
										<li>Wednesday, 6:00 pm to 8:00 pm</li>
									</ul>
									<p>The schedule above is valid <strong>through February 11</strong>. After that date it is subject to change.</p>

									</xsl:when>
									<xsl:when test="/notification_data/organization_unit/name = 'Folsom Lake College Library'">
										<!-- FLC schedule -->
										<ul>
											<li>Monday 3:00 to 5:00 pm</li>
											<li>Thursday 4:00 to 6:00 pm</li>
											<li>Saturday 11:00 am to 1:00 pm</li>
										</ul>
									</xsl:when>
									<xsl:when test="/notification_data/organization_unit/name = 'Sacramento City College Library'">
										<!-- SCC schedule -->
										<p>Tuesdays, Wednesdays, and Saturdays, from 11:00 am to 1:00 pm.</p>
									</xsl:when>
									<xsl:otherwise>
										<p>Please choose your college to find available pickup times:</p>
										<ul>
											<li>
												<a href="">ARC</a>
											</li>
											<li>
												<a href="">CRC</a>
											</li>
											<li>
												<a href="">FLC/EDC</a>
											</li>
											<li>
												<a href="">SCC</a>
											</li>
										</ul>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<!-- end pickup schedule -->
						
						<!-- pickup details -->
						<tr>
							<td>
								<xsl:choose>
								<xsl:when test="/notification_data/organization_unit/name = 'American River College Library'">
									<!-- ARC details -->
									<p>Please enter campus from College Oak Drive near the stadium/parking garage. <a href="https://arc.losrios.edu/arc/shared/doc/ARC-CAMPUS-MAP-2019.pdf">View campus map.</a>  Follow the signs indicating <strong>ARC Pick Up</strong> to the Portable Village near Davies Hall and the ARC PD Station. Staff will be available to safely approach your vehicle to assist you. Please be prepared with a mask and your ID.</p>
									<p>For more details on picking up library materials, please <a href="https://answers.library.losrios.edu/arc/faq/336290">see our web page</a>.</p>
								</xsl:when>
								<xsl:when test="/notification_data/organization_unit/name = 'Cosumnes River College Library'">
									<!-- CRC details -->
									<p>Pick up your items in front of the maintenance building next to Lot I. <a href="https://drive.google.com/file/d/1a8PWteG_sYsBPAhWNnMOkFc_sbQYrL9O/view?usp=sharing">See campus map</a>.</p>
									<p>For more details on picking up library materials, please <a href="https://answers.library.losrios.edu/crc/faq/335859">see our web page</a>.</p>

								</xsl:when>
								<xsl:when test="/notification_data/organization_unit/name = 'Folsom Lake College Library'">
									<!-- FLC details -->
									<p>Pick up your items in front of Aspen Hall. When you arrive, call the library at (916) 608-6613 so we can bring your items to the table outside.</p>
									<p>For more details about curbside pickup, please see the <a href="https://answers.library.losrios.edu/flc/faq/334580">curbside pickup FAQ</a>.</p>
									
								</xsl:when>
								<xsl:when test="/notification_data/organization_unit/name = 'Sacramento City College Library'">
									<!-- SCC details -->
									<p>Pick up your items behind the LRC/Library building by the bookdrop near the &quot;C&quot; parking lot on the south side of campus.</p>
									<p><a href="https://goo.gl/maps/A7hFryREWurmaVE27" title="View location on Google Maps"><img src="https://libapps.s3.amazonaws.com/accounts/816/images/Chromebook_spot.png" alt="pickup location" /></a></p>
									<p>When you arrive, please call the library at (916) 558-2301 so we can bring out your items. Please be prepared to tell our staff your student ID number.</p>
									<p>For more details on picking up library materials, please <a href="https://answers.library.losrios.edu/scc/faq/335622">see our pickup web page</a>.</p>

								</xsl:when>
								<xsl:otherwise>
									
								</xsl:otherwise>
							</xsl:choose>
								
							</td>
						</tr>
						
						<!-- end pickup details -->
						<tr>
							<td>
								<h2>Safety Reminder</h2>
								<p>Please do not come to campus if you have a cough or fever or have been in contact with anyone who is sick.</p>

								<p>If driving, please remain in your car until your materials are placed on the table outside. If you used an alternate form of transportation, please follow these safety guidelines:</p>
								<ul>
									<li>Wear a face covering. This is a statewide mandate and a Los Rios requirement.</li>
									<li>If you must sneeze or cough, do so into a cloth or tissue. If those are not available, use your elbow.</li>
									<li>Avoid touching your eyes, nose, and mouth.</li>
								</ul>

							</td>
						</tr>
						<tr>
							<td>
								<p>If you have questions regarding your library request, please 
								<xsl:choose>
								<xsl:when test="/notification_data/organization_unit/name = 'American River College Library'">
									<!-- ARC contact -->
									contact Jane Hoff, Lead Library Technician at <a href="mailto:HoffJ@arc.losrios.edu">HoffJ@arc.losrios.edu</a> or (916) 484-8744. 
								</xsl:when>
								<xsl:when test="/notification_data/organization_unit/name = 'Cosumnes River College Library'">
									<!-- CRC contact -->
									contact us at <a href="mailto:library@crc.losrios.edu">library@crc.losrios.edu</a>
								</xsl:when>
								<xsl:when test="/notification_data/organization_unit/name = 'Folsom Lake College Library'">
									<a href="https://www.library.losrios.edu/ask-us/?flc">submit your question at our website</a>.
									
								</xsl:when>
								<xsl:when test="/notification_data/organization_unit/name = 'Sacramento City College Library'">
									<!-- SCC contact -->
									contact the Circulation Department at (916) 558-2301 or <a href="mailto:circlib@scc.losrios.edu">circlib@scc.losrios.edu</a>

								</xsl:when>
								<xsl:otherwise>
									<a href="https://www.library.losrios.edu/ask-us/">contact your library</a>.
								</xsl:otherwise>
							</xsl:choose>
								
								
								
								</p>
							</td>
						</tr>
						<xsl:if test="notification_data/request/system_notes != ''">
						<tr>
							<td><b>Note: </b><xsl:value-of select="notification_data/request/system_notes"/></td>
						</tr>
						</xsl:if>
					</table>
					<xsl:call-template name="lrGoToAccount" />
        <!-- footer.xsl -->
        <xsl:call-template name="lrPatronFooter" />
				</div>
			</div>
				
			</body>
	</html>
	</xsl:template>



</xsl:stylesheet>




