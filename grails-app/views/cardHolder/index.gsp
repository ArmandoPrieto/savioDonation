
<%@ page import="saviodonation.CardHolder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cardHolder.label', default: 'CardHolder')}" />
		<title><g:message code="donor.list" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cardHolder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="home" action="index"><g:message code="default.home.label"/></g:link></li>
				<!-- <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li> -->
			</ul>
		</div>
		<div id="list-cardHolder" class="content scaffold-list" role="main">
			<h1><g:message code="donor.list" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${flash.error}">
				<div class="errors" role="status">${flash.error}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'cardHolder.name.label', default: 'Name')}" />
						<g:sortableColumn property="email" title="${message(code: 'cardHolder.email.label', default: 'Email')}" />
						<g:sortableColumn property="phone" title="${message(code: 'cardHolder.phone.label', default: 'Phone')}" />
						<th><g:message code="cardHolder.address.label" default="Address" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${cardHolderInstanceList}" status="i" var="cardHolderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cardHolderInstance.id}">${fieldValue(bean: cardHolderInstance, field: "name")}</g:link></td> 
						<td>${fieldValue(bean: cardHolderInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: cardHolderInstance, field: "phone")}</td>
						<td><g:link controller="address" action="show" id="${cardHolderInstance.address.id}"><g:message code="donor.address" /></g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cardHolderInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
