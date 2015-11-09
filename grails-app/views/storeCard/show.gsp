
<%@ page import="saviodonation.StoreCard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'storeCard.label', default: 'StoreCard')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-storeCard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="home" controller="cardHolder" action="index"><g:message code="default.home.label"/></g:link></li>
				<%--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="show-storeCard" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list storeCard">
			
				<g:if test="${storeCardInstance?.cardHolder}">
				<li class="fieldcontain">
					<span id="cardHolder-label" class="property-label"><g:message code="storeCard.donor.label" default="Donor" /></span>
					
						<span class="property-value" aria-labelledby="cardHolder-label"><g:link controller="cardHolder" action="show" id="${storeCardInstance?.cardHolder?.id}">${storeCardInstance?.cardHolder?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${storeCardInstance?.cardType}">
				<li class="fieldcontain">
					<span id="cardType-label" class="property-label"><g:message code="storeCard.cardType.label" default="Card type" /></span>
					
						<span class="property-value" aria-labelledby="cardType-label">${storeCardInstance.cardType}</span>
					
				</li>
				</g:if>
				<g:if test="${storeCardInstance?.cardId}">
				<li class="fieldcontain">
					<span id="cardId-label" class="property-label"><g:message code="storeCard.cardId.label" default="Card Id" /></span>
					
						<span class="property-value" aria-labelledby="cardId-label">****-****-****-${storeCardInstance.cardId.substring(15)}</span>
					
				</li>
				</g:if>
			
				<g:if test="${storeCardInstance?.expDate}">
				<li class="fieldcontain">
					<span id="expDate-label" class="property-label"><g:message code="storeCard.expDate.label" default="Exp Date" /></span>
					
						<span class="property-value" aria-labelledby="expDate-label"><g:fieldValue bean="${storeCardInstance}" field="expDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storeCardInstance?.nameOnCard}">
				<li class="fieldcontain">
					<span id="nameOnCard-label" class="property-label"><g:message code="storeCard.nameOnCard.label" default="Name On Card" /></span>
					
						<span class="property-value" aria-labelledby="nameOnCard-label"><g:fieldValue bean="${storeCardInstance}" field="nameOnCard"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:storeCardInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<%--<g:link class="edit" action="edit" resource="${storeCardInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
