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
					<td>
						<xsl:choose >
							<xsl:when test="/notification_data/order_now_succed='true'">
								@@order_now_succed@@.
							</xsl:when>
							<xsl:otherwise>
								@@order_now_failed@@ <xsl:value-of select="notification_data/need_review_entity" />.
							</xsl:otherwise>
						</xsl:choose>

					<br />
					<br /><b>@@pol_reference@@: </b><xsl:value-of select="notification_data/line_reference" />
					<br /><b>@@order_number@@: </b><xsl:value-of select="notification_data/number" />
          <br /><b>Title: </b><xsl:value-of select="notification_data/line_title" />
					</td>
				</tr>
					<tr>
					<td>

            <br />
            <xsl:if test="notification_data/vendor_note != ''">
              <b>@@vendor_note@@: </b><xsl:value-of select="notification_data/vendor_note" />
            </xsl:if>
					<xsl:choose >
							<xsl:when test="/notification_data/rush='true'">
								<br /><b>@@rush@@.</b>
							</xsl:when>
							<xsl:otherwise>

							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
          </div>
        </div>
				<table cellspacing="0" cellpadding="5" border="0"  width="600" style="width:600px; background:#fff; padding:12px 8px 0 8px; text-align:center;" align="center">
				<tr>
					<td>Need to check up on it?</td>
				</tr>
			</table>
		<xsl:call-template name="lrGoToAlma" /> <!--staff call to action-->
		
		<xsl:call-template name="lrStaffFooter" /><!-- footer.xsl -->
		
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
