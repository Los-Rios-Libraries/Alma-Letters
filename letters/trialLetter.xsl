<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />

  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />

  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head" /><!-- header.xsl -->
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
        
		<div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px;">
				<tr>
					<td>@@introduction_body_thanks@@ <b><xsl:value-of select="notification_data/trial/title" /></b>.</td>
        </tr>
				
				
				<tr>
				<tr>
					<td>@@schedule@@ <xsl:value-of select="notification_data/trial/start_date" />  to <xsl:value-of select="notification_data/trial/end_date" />.</td>
				</tr>
					
				<xsl:choose >
					<xsl:when test="/notification_data/reminder='true'">
						<tr><td>@@reminder_end_thanks@@</td></tr>
						<tr><td>@@reminder_register_opinion@@</td></tr>
					</xsl:when>
          <xsl:otherwise>
            <tr>
              <td>
                <p>Please help us evaluate this resource!</p>
              </td>
            </tr>
          </xsl:otherwise>
				</xsl:choose>
        <tr>
          
          <td>
            <table align="center" cellpadding="0" style="width:auto !important;">
						<tr>
							<td>
								<a style="display:block;color:#ffffff;background:#252d65;font-size:13px;font-weight:bold;text-decoration:none;border:12px solid #252d65;border-radius: 4px;">
                                        <xsl:attribute name="href">
                          <xsl:value-of select="notification_data/participant_url" />
                        </xsl:attribute>
                                        Go to the evaluation survey
                </a>
							</td>
						</tr>
					</table>
          </td>
        </tr>
			</table>

          </div>
        </div>

		
        <xsl:call-template name="lrStaffFooter" /> <!--footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
