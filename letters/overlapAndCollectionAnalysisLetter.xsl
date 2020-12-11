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
			 <div class="messageArea">
          		<div class="messageBody">
					<xsl:call-template name="head" /> <!-- header.xsl -->
					<xsl:call-template name="toWhomIsConcerned" />
            		
					<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px;">
						<tr><td>@@jobCompletion@@</td></tr>
						
						<xsl:if test="/notification_data/report_type  !=''">
							<tr><td><strong>@@reportType@@</strong>
								<xsl:value-of select="/notification_data/report_type" />
							</td></tr>
						</xsl:if>
						
						<xsl:if test="/notification_data/report_name  !=''">
							<tr><td><strong>@@reportName@@</strong> 
								<xsl:value-of select="/notification_data/report_name" />
							</td></tr>
						</xsl:if>
					
						<xsl:if test="/notification_data/report_description  !=''">
							<tr><td><strong>@@reportDescription@@</strong>
								<xsl:value-of select="/notification_data/report_description" />
							</td></tr>
						</xsl:if>
						
						<tr>
							<td>
								<xsl:choose >
									<xsl:when test="/notification_data/file  !=''">
										@@reportsAttached@@
									</xsl:when>
									<xsl:otherwise>
										@@reportsNotAttached@@
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
          		</div>
      	 	</div>
			
			<xsl:call-template name="lrGoToAlma" />
			
			<xsl:call-template name="lrStaffFooter" /> <!-- footer.xsl -->
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>