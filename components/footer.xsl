<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:template name="salutation">

	</xsl:template>

	<xsl:template name="lrGoToAlma">
		<!-- used in body of staff letters -->
		<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px;">
			<tr>
				<td>
					<table align="center" cellpadding="0" style="width:auto !important;">
						<tr>
							<td>
								<a style="display:block;color:#ffffff;background:#252d65;font-size:13px;font-weight:bold;text-decoration:none;border:12px solid #252d65;border-radius: 4px;" href="https://caccl-lrccd.alma.exlibrisgroup.com/SAML/idpCode/LRCCD">Go to Alma</a>
							</td>
						</tr>
					</table>
					
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lrGoToAccount">
		<!-- used in body of patron letters -->
		<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" style="width:600px; background:#fff; padding: 12px 0 12px 15px;">
			<tr>
				<td>For more details about your library activity, please visit your library account.
				</td>
			</tr>
			<tr>
				<td>
					<table align="center" cellpadding="0" style="width:auto !important;">
						<tr>
							<td>
								<a style="display:block;color:#ffffff;background:#252d65;font-size:13px;font-weight:bold;text-decoration:none;border:12px solid #252d65;border-radius: 4px;" href="https://www.library.losrios.edu/my-account">My Library Account</a>
							</td>
						</tr>
					</table>
					
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lrPatronFooter">
		<table cellspacing="5" cellpadding="0" border="0" align="center" width="600">
			<xsl:attribute name="style">
				<xsl:call-template name="footerTableStyleCss" />
				<!-- style.xsl -->
			</xsl:attribute>
			<tr>
				<td>
					<hr style="border:1px solid #ccc;" />
				</td>
			</tr>
			<tr>

				<td>
					Sent by the <a href="https://www.library.losrios.edu/">Los Rios Libraries</a> on <xsl:value-of select="notification_data/general_data/current_date"/></td>
			</tr>
			<tr>
				<td>
					<a href="https://answers.library.losrios.edu/">Library FAQs</a>
				</td>
			</tr>
			<tr>
				<td style="text-align:center; padding-top:12px;">
					Please do not reply to this email. Instead, <a href="https://www.library.losrios.edu/ask-us">contact your library</a>.
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="lrStaffFooter">
		<table cellspacing="0" cellpadding="0" border="0" align="center" width="600" >
			<xsl:attribute name="style">
				<xsl:call-template name="footerTableStyleCss" />
				<!-- style.xsl -->
			</xsl:attribute>
			<tr>
				<td>
					<hr style="border:1px solid #ccc;" />
				</td>
			</tr>
			<tr>

				<td>
					Sent by the <a href="https://www.library.losrios.edu/">Los Rios Libraries</a> on <xsl:value-of select="notification_data/general_data/current_date"/></td>
			</tr>
			<tr>
				<td>
					Learn together at <a href="https://answers.library.losrios.edu/lrcq">Los Rios Common Questions</a>
				</td>
			</tr>
		</table>
	</xsl:template>


	<xsl:template name="lastFooter">
		<table>
			<xsl:attribute name="style">
				<xsl:call-template name="footerTableStyleCss" />
				<!-- style.xsl -->
			</xsl:attribute>
			<tr>
				<xsl:for-each select="notification_data/organization_unit">

					<xsl:attribute name="style">
						<xsl:call-template name="listStyleCss" />
						<!-- style.xsl -->
					</xsl:attribute>
					<td align="center">
						<xsl:value-of select="name" />&#160;
						<xsl:value-of select="line1" />&#160;
						<xsl:value-of select="line2" />&#160;
						<xsl:value-of select="city" />&#160;
						<xsl:value-of select="postal_code" />&#160;
						<xsl:value-of select="country" />
					</td>

				</xsl:for-each>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="contactUs">
		<table align="left">
			<tr>
				<td align="left">
					<a>
						<xsl:attribute name="href">@@email_contact_us@@</xsl:attribute>
						@@contact_us@@
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="myAccount">
		<table align="right">
			<tr>
				<td align="right">
					<a>
						<xsl:attribute name="href">@@email_my_account@@</xsl:attribute>
						@@my_account@@
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>



</xsl:stylesheet>