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
						</tr>
						<tr>
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




