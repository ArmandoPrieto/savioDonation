
<%@ page import="saviodonation.CardHolder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardHolder.label', default: 'CardHolder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cardHolder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<%-- <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> --%>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<%-- <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="show-cardHolder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cardHolder">
			
			<g:if test="${cardHolderInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="cardHolder.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${cardHolderInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardHolderInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="cardHolder.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${cardHolderInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
			
			
				
			
				<g:if test="${cardHolderInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="cardHolder.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${cardHolderInstance}" field="phone"/></span>
					
				</li>
				</g:if>
					<g:if test="${cardHolderInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="cardHolder.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show" id="${cardHolderInstance?.address?.id}"><g:message code="donor.address" default="Show address" /></g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardHolderInstance?.storeCard}">
				<li class="fieldcontain">
					<span id="storeCard-label" class="property-label"><g:message code="cardHolder.storeCard.label" default="Store Card" /></span>
					
						<g:each in="${cardHolderInstance.storeCard}" var="s">
						<span class="property-value" aria-labelledby="storeCard-label"><g:link controller="storeCard" action="show" id="${s.id}"><g:message code="donor.cardDetail" default="Card details" /></g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:cardHolderInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<!--<g:link class="edit" action="edit" resource="${cardHolderInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>-->
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
