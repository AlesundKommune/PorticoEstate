<!-- $Id$ -->

	<xsl:template name="status_filter">
		<xsl:variable name="select_action"><xsl:value-of select="select_action"/></xsl:variable>
		<xsl:variable name="status_name"><xsl:value-of select="status_name"/></xsl:variable>
		<xsl:variable name="lang_submit"><xsl:value-of select="lang_submit"/></xsl:variable>
		<form method="post" action="{$select_action}">
			<select name="{$status_name}" onChange="this.form.submit();" onMouseout="window.status='';return true;">
				<xsl:attribute name="onMouseover">
					<xsl:text>window.status='</xsl:text>
					<xsl:value-of select="lang_status_statustext"/>
					<xsl:text>'; return true;</xsl:text>
				</xsl:attribute>
				<option value=""><xsl:value-of select="lang_no_status"/></option>
				<xsl:apply-templates select="status_list"/>
			</select>
			<noscript>
				<xsl:text> </xsl:text>
				<input type="submit" name="submit" value="{$lang_submit}"/>
			</noscript>
		</form>
	</xsl:template>

	<xsl:template match="status_list">
		<xsl:variable name="id"><xsl:value-of select="id"/></xsl:variable>
		<xsl:choose>
			<xsl:when test="selected">
				<option value="{$id}" selected="selected"><xsl:value-of disable-output-escaping="yes" select="name"/></option>
			</xsl:when>
			<xsl:otherwise>
				<option value="{$id}"><xsl:value-of disable-output-escaping="yes" select="name"/></option>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
