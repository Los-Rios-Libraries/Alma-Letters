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
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

      <head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

        <div class="messageArea">
          <div class="messageBody">

			<table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; table-layout:fixed; word-wrap:break-word;">
				<xsl:variable name="registrationStatus"><xsl:value-of select="notification_data/delivery_registration/status"/></xsl:variable>
				<xsl:choose>
					<xsl:when test="$registrationStatus = 'REGISTERED'">
						<tr>
              <td style="padding-left:12px;">
                <p>
                @@register_successfully@@ &#34;<xsl:value-of select="notification_data/delivery_registration/title"></xsl:value-of>&#34; @@current_queue_position@@ <xsl:value-of select="notification_data/delivery_registration/number_in_queue"/> @@in_queue@@
               </p>
             </td>
            </tr>
						<tr>
              <td style="padding-left:12px;">
                <p>
                  @@notification_sent@@
                </p>
                <p>
                  @@you_will_have@@ <xsl:value-of select="notification_data/delivery_registration/grace_period"></xsl:value-of> @@within_minutes@@
              </p>
            </td>
            </tr>
					</xsl:when>				
					<xsl:when test="$registrationStatus = 'ITEM_AVAILABLE'">						
						<xsl:variable name="deliveryUrl"><xsl:value-of select="notification_data/delivery_registration/delivery_url"/></xsl:variable>
						<tr>
              <td style="padding-left:12px;">
                <p>
                   &#34;<xsl:value-of select="notification_data/delivery_registration/title"></xsl:value-of>&#34; @@item_available@@
                </p>
              </td>
            </tr>
						<tr>
              <td style="padding-left:12px;">
               <p>
                <strong>
                  <a href="{$deliveryUrl}" target="_blank">@@here@@</a></strong>&#160;
               </p>
              </td>
            </tr>
						<tr>
              <td style="padding-left:12px;">
               <p>
                @@you_have@@ <xsl:value-of select="notification_data/delivery_registration/grace_period"></xsl:value-of> @@within_minutes@@
               </p>
              </td>
            </tr>
					</xsl:when>				
					<xsl:when test="$registrationStatus = 'GRACE_PERIOD_EXPIRED'">						
						<xsl:variable name="deliveryUrl"><xsl:value-of select="notification_data/delivery_registration/delivery_url"/></xsl:variable>
						<tr>
              <td  style="padding-left:12px;">
                <p>
                  @@time_accessing@@ &#34;<xsl:value-of select="notification_data/delivery_registration/title"></xsl:value-of>&#34; @@has_expired@@
                </p>
              </td>
            </tr>
						<tr>
              <td  style="padding-left:12px;">
                <p>@@you_can_reregister@@</p>
              </td>
            </tr>
						<tr>
              <td  style="padding-left:12px;">
                <p>
                  <strong>
                    <a href="{$deliveryUrl}" target="_blank">
                      @@register@@
                    </a>
                 </strong>&#160;
                </p>
              </td>
            </tr>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</table>


          </div>
        </div>

        <!-- footer.xsl -->
        <xsl:call-template name="lrPatronFooter" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
