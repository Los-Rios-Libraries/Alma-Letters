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
					<table cellspacing="0" cellpadding="5" border="0" align="center">
						<xsl:attribute name="style">
							<xsl:call-template name="headerTableStyleCss" />
							<!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<td>
								<xsl:for-each select="notification_data">
									<xsl:if test="request/delivery_address ='FLC Lockers'">
										<xsl:message terminate="yes">Locker delivery - message not sent</xsl:message>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<xsl:for-each select="notification_data/general_data">
								<td>
									<h1>
										<xsl:choose>
											<xsl:when test="/notification_data/request/delivery_address = 'Cosumnes River College Library'">
												Your library item will be ready soon
											</xsl:when>
											<xsl:when test="/notification_data/request/delivery_address = 'SCC Lockers'">
												Your library item is awaiting an available locker
											</xsl:when>
										
											<xsl:otherwise>
												<xsl:value-of select="letter_name" />
											</xsl:otherwise>
										</xsl:choose>
									</h1>
								</td>
							</xsl:for-each>
						</tr>
					</table>
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

					<div class="messageArea">
				<div class="messageBody">
					<xsl:variable name="pickupLocation" select="/notification_data/request/delivery_address" />
					<table cellspacing="0" cellpadding="5" border="0" align="center" width="600" style="width:600px; text-align:left; background:#fff; padding-left:8px; padding-right:8px;">
						<tr>
							<td>
								The following library material you requested  on <xsl:value-of select="notification_data/request/create_date"/>
								<xsl:choose>
									<xsl:when test="$pickupLocation = 'Cosumnes River College Library'">
										is being processed and will be available for locker pick-up soon.
									</xsl:when>
									<xsl:when test="$pickupLocation = 'SCC Lockers'">
										has been set aside for you and will be placed in a locker when one becomes available.
									</xsl:when>
									<xsl:otherwise>
										is now available for pickup from the <!--<xsl:value-of select="notification_data/request/assigned_unit_name"/>-->
										<xsl:value-of select="$pickupLocation" />.
									</xsl:otherwise>
								</xsl:choose>
								
								
							</td>
						</tr>
						<tr>
							<td style="padding:16px;"><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
						</tr>
						<xsl:if test="$pickupLocation != 'Cosumnes River College Library' and $pickupLocation != 'SCC Lockers'">
							<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
								<tr>
									<td>
										The item will be held for you until <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
									</td>
								</tr>
							</xsl:if>
							
						</xsl:if>
						<xsl:if test="$pickupLocation != 'Cosumnes River College Library' and $pickupLocation != 'SCC Lockers'">
						<!-- pickup schedule -->
						<tr>
							<td>
								<h2>When and where to pick up</h2>
							</td>
						</tr>
						<tr>
							<td>
								
								<p style="display:inline;">To find out when to pick up your materials,</p>
								<xsl:choose>
									<xsl:when test="$pickupLocation = 'American River College Library'">
										<!-- ARC -->
										<a href="https://arc.losrios.edu/student-resources/library/about-the-library/library-hours">view our open and service window hours page</a>.
									</xsl:when>
									<xsl:when test="$pickupLocation = 'Elk Grove Center'">
										<!-- EGC -->
										<a href="https://crc.losrios.edu/student-resources/library/about-the-library/elk-grove-center-library-services">view our open hours and information page</a>. 
									</xsl:when>
									<xsl:when test="$pickupLocation = 'El Dorado Center' or $pickupLocation = 'Folsom Lake College Library'">
										<!-- EDC/FLC -->
										<a href="https://flc.losrios.edu/student-resources/library/about-the-library/library-hours">view our open hours page</a>. 
									</xsl:when>
									<xsl:when test="$pickupLocation = 'Natomas Center'">
										<!-- Natomas Center -->
										<a href="https://www.saclibrary.org/Locations/North-Natomas">view our open hours page</a>.
									</xsl:when>
									<xsl:when test="$pickupLocation = 'Sacramento City College Library'">
										<!-- SCC -->
										<a href="https://scc.losrios.edu/student-resources/library/library-daily-hours">view our open hours page</a>.
									</xsl:when>
									<xsl:otherwise>
										<p style="display:inline;">please choose your college:</p>
										<ul>
											<li>
												<a href="https://answers.library.losrios.edu/arc/faq/336290">ARC</a>
												<p style="margin-left:10px;"><a href="https://www.saclibrary.org/Locations/North-Natomas">ARC Natomas Center</a></p>
											</li>
											<li>
												<a href="https://answers.library.losrios.edu/crc/faq/335859">CRC</a>
											</li>
											<li>
												<a href="https://answers.library.losrios.edu/flc/faq/352822">FLC/EDC</a>
											</li>
											<li>
												<a href="https://answers.library.losrios.edu/scc/faq/335622">SCC</a>
											</li>
										</ul>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
						<!-- end pickup schedule -->
						</xsl:if>
						
						<!-- pickup details -->
						<tr>
							<td>
								<xsl:choose>
								<xsl:when test="$pickupLocation = 'American River College Library'">
									<!-- ARC details -->
									<p>Pick up items at the Library service window (on the north side of the Library). Enter campus from Myrtle Avenue, Parking Lot A/B entrance. Students should park in student/general parking. Parking permits are not required at this time. The ARC Library is located west of the Student Center Building and east of the Welcome and Support Center.</p>
									<p>For more details on picking up library materials, please <a href="https://answers.library.losrios.edu/arc/faq/336290">see our web page</a>.</p>
									<p><img style="width:560px;" width="560" src="https://library.losrios.edu/arc/librarymap.JPG" alt="Map showing route from Myrtle Avenue to Library" /></p>
								</xsl:when>
								<xsl:when test="$pickupLocation = 'Cosumnes River College Library'">
									<!-- CRC details -->
									<p> Once your items have been assigned to a locker, you will receive an email from support@luxerone.com with instructions for picking up your materials.</p>
									<p>If you need an accessible locker, please <a href="mailto:library@crc.losrios.edu">email the library at library@crc.losrios.edu</a></p>
									<p><a href="https://answers.library.losrios.edu/crc/faq/337591">Visit the FAQ for more information</a> on the Library&apos;s Pickup Lockers. </p>
								</xsl:when>
								<xsl:when test="$pickupLocation = 'Elk Grove Center'">
									<!-- EGC details -->
									<p>Pick up your items from the Learning Resource Center (EGA 204) at the Elk Grove Center (10051 Big Horn Road, Elk Grove, CA 95757). </p>
								</xsl:when>
								<xsl:when test="$pickupLocation = 'El Dorado Center'">
									<!-- EDC details -->
									<p>Pick up your requested materials at the Circulation Desk in Building A.</p>
									<p><a href="https://flc.losrios.edu/flc/main/doc/admin/about-us/edc_map.pdf">View campus map</a></p>
									<p>If you no longer need the items, please cancel your request by <a href="https://library.losrios.edu/my-account">visiting your library account online</a> or calling the Circulation Desk at (530) 642-5695.</p>
								</xsl:when>
								<xsl:when test="$pickupLocation = 'Folsom Lake College Library'">
									<!-- FLC details -->
									<p>Pick up your requested materials at the Circulation Desk in Aspen Hall.</p>
									<p><a href="https://flc.losrios.edu/flc/main/doc/admin/about-us/folsom_map.pdf">View campus map</a></p>	
									<p>If you no longer need the items, please cancel your request by <a href="https://library.losrios.edu/my-account">visiting your library account online</a> or calling the Circulation Desk at (916) 608-6613.</p>
								</xsl:when>
								<xsl:when test="$pickupLocation = 'Sacramento City College Library'">
									<!-- SCC details -->
									<p>Pick up your requested materials at the Circulation Desk on the 2nd floor of the Learning Resource Center.</p>
									<p>For more details on picking up library materials, please <a href="https://answers.library.losrios.edu/scc/faq/335622">see our web page</a>.</p>

								</xsl:when>
								<xsl:when test="$pickupLocation = 'SCC Lockers'">
									<p>When the Library is open, you may come in to pick up these items instead of waiting for a locker. Please <a href="https://scc.losrios.edu/student-resources/library/library-daily-hours">check our open hours</a>.</p>
									<p>If you need a wheelchair-accessible locker, please contact us at (916) 558-2301 or circlib@scc.losrios.edu (include your Los Rios student ID number).</p>
									<p>If you no longer need the items, please cancel your request by <a href="https://library.losrios.edu/my-account">visiting your library account online</a> or contacting us via phone or email. Doing so will allow other students get access to the materials more quickly.</p>
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
								<p>Please do not come to campus if you have a cough or fever or have been in contact with anyone who is sick. Masks are strongly recommended but not required in all district facilities, regardless of vaccination status.</p>								

							</td>
						</tr>
						<xsl:if test="$pickupLocation != 'Elk Grove Center'">
							<tr>
								<td>
									<p>If you have questions regarding your library request, please 
										<xsl:choose>
										<xsl:when test="$pickupLocation = 'American River College Library'">
											<!-- ARC contact -->
											contact Jane Hoff, Lead Library Technician at <a href="mailto:HoffJ@arc.losrios.edu">HoffJ@arc.losrios.edu</a> or (916) 484-8744. 
										</xsl:when>
										<xsl:when test="$pickupLocation = 'Cosumnes River College Library'">
											<!-- CRC contact -->
											contact us at <a href="mailto:library@crc.losrios.edu">library@crc.losrios.edu</a>
										</xsl:when>
										<xsl:when test="$pickupLocation = 'Folsom Lake College Library'">
										contact the Circulation Department at (916) 608-6613 or <a href="https://library.losrios.edu/ask-us/?flc">submit your question at our website</a>.
									
										</xsl:when>
										<xsl:when test="$pickupLocation = 'Sacramento City College Library'">
											<!-- SCC contact -->
											contact the Circulation Department at (916) 558-2301 or <a href="mailto:circlib@scc.losrios.edu">circlib@scc.losrios.edu</a>

										</xsl:when>
									<xsl:otherwise>
										<a href="https://library.losrios.edu/ask-us/">contact your library</a>.
									</xsl:otherwise>
								</xsl:choose>
								
								
								
							</p>
						</td>
					</tr>
							
							
						</xsl:if>
						
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




