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
          <xsl:call-template name="slipStyleCss" />
          <!-- style.xsl -->
        </xsl:attribute>
								
									<h1>@@letterName@@</h1>
	
		


				<!--<xsl:call-template name="head" />--> <!-- header.xsl -->



			<div class="messageArea">
				<div class="messageBody">
					<p>
				@@requested_for@@ :
							<xsl:value-of select="notification_data/user_for_printing/name"/>
				

			</p>
					<p>
						<xsl:for-each select="notification_data/user_for_printing/identifiers/code_value">
							<xsl:if test="code='Primary Identifier'">
								<xsl:value-of select="value" />
							</xsl:if>
							
						</xsl:for-each>
					</p>
					<xsl:if test="notification_data/request/system_notes != ''">
						<p style="display:inline-block; padding:8px; border: 2px solid #000; font-size:12pt;">
							<b>@@system_notes@@:</b>&#160;<xsl:value-of select="notification_data/request/system_notes"/>
						</p>
						</xsl:if>

						<xsl:if test="notification_data/request/note != ''">
							<p style="display:inline-block; padding:8px; border: 2px solid #000; font-size:12pt;">
							<b>@@request_note@@:</b>&#160;<xsl:value-of select="notification_data/request/note"/>
						</p>
						</xsl:if>
					 <table cellspacing="0" cellpadding="5" border="0">
						<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
						<tr>
							<td><b>@@note_item_specified_request@@.</b></td>
						</tr>
						</xsl:if>
						<xsl:if  test="notification_data/request/manual_description != ''" >
						<tr>
							<td><b>@@please_note@@: </b>@@manual_description_note@@ - <xsl:value-of select="notification_data/request/manual_description"/></td>
						</tr>
						</xsl:if>
						<tr>
							<td><b>@@request_id@@: </b><img src="cid:request_id_barcode.png" alt="Request Barcode"/></td>
						</tr>
						<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
						<tr>
							<td><b>@@item_barcode@@: </b><img src="cid:item_id_barcode.png" alt="Item Barcode"/></td>
						</tr>
						</xsl:if>
						<xsl:if  test="notification_data/external_id != ''" >
							<tr>
								<td><b>@@external_id@@: </b><xsl:value-of select="notification_data/external_id"/></td>
							</tr>
						</xsl:if>

						<xsl:if test="notification_data/user_for_printing/name">

						<tr>
							<td>
						<b>@@requested_for@@: </b>
							<xsl:value-of select="notification_data/user_for_printing/name"/></td>
						</tr>

						</xsl:if>

						<tr>
							<td><xsl:call-template name="recordTitle" />
							</td>
						</tr>

							<xsl:if test="notification_data/phys_item_display/isbn != ''">
								<tr>
								<td>@@isbn@@: <xsl:value-of select="notification_data/phys_item_display/isbn"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/issn != ''">
								<tr>
								<td>@@issn@@: <xsl:value-of select="notification_data/phys_item_display/issn"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/edition != ''">
								<tr>
								<td>@@edition@@: <xsl:value-of select="notification_data/phys_item_display/edition"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/imprint != ''">
								<tr>
								<td>@@imprint@@: <xsl:value-of select="notification_data/phys_item_display/imprint"/></td>
								</tr>
							</xsl:if>

						<b></b>
						<tr>
							<td><b>@@location@@: </b><xsl:value-of select="notification_data/phys_item_display/location_name"/></td>
							<xsl:if test="notification_data/phys_item_display/call_number != ''">
								<td><b>@@call_number@@: </b><xsl:value-of select="notification_data/phys_item_display/call_number"/></td>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/accession_number != ''">
								<td><b>@@accession_number@@: </b><xsl:value-of select="notification_data/phys_item_display/accession_number"/></td>
							</xsl:if>
						</tr>
						<xsl:if  test="notification_data/phys_item_display/shelving_location/string" >
							<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
							<tr>
								<td><b>@@shelving_location_for_item@@: </b>
								 <xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
									<xsl:value-of select="."/>
								 &#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
							<xsl:if  test="notification_data/request/selected_inventory_type='HOLDING'" >
							<tr>
								<td><b>@@shelving_locations_for_holding@@: </b>
								<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
									<xsl:value-of select="."/>
								&#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
							<xsl:if  test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
							<tr>
								<td><b>@@shelving_locations_for_holding@@: </b>
								<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
									<xsl:value-of select="."/>
								&#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
						</xsl:if>
						<xsl:if  test="notification_data/phys_item_display/display_alt_call_numbers/string" >
							<xsl:if  test="notification_data/request/selected_inventory_type='ITEM'" >
							<tr>
								<td><b>@@alt_call_number@@: </b>
								 <xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
									<xsl:value-of select="."/>
								 &#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
							<xsl:if  test="notification_data/request/selected_inventory_type='HOLDING'" >
							<tr>
								<td><b>@@alt_call_number@@: </b>
								<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
									<xsl:value-of select="."/>
								&#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
							<xsl:if  test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'" >
							<tr>
								<td><b>@@alt_call_number@@: </b>
								<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
									<xsl:value-of select="."/>
								&#160;
								 </xsl:for-each>
								</td>
							</tr>
							</xsl:if>
						</xsl:if>

						<b></b>

						<tr>
						<xsl:choose>
							<xsl:when test="notification_data/destination = 'Rancho Cordova Center Lockers'">
								<td><b>@@move_to_library@@: </b>Folsom Lake College Library (RCC Lockers)</td>
							</xsl:when>
							<xsl:otherwise>
								<td><b>@@move_to_library@@: </b><xsl:value-of select="notification_data/destination"/></td>	
							</xsl:otherwise>
						</xsl:choose>
							
						</tr>
						<tr>
							<td><b>@@request_type@@: </b><xsl:value-of select="notification_data/request_type"/></td>
						</tr>
						<tr>
							<td><b>Request date: </b><xsl:value-of select="notification_data/request/create_date"/></td>
						</tr>
					</table>
				</div>
			</div>



<!--
	<xsl:call-template name="lastFooter" />--> <!-- footer.xsl -->



								

</body>
</html>


	</xsl:template>
</xsl:stylesheet>