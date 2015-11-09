
<%@ page import="saviodonation.StoreCard" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'storeCard.label', default: 'StoreCard')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-storeCard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-storeCard" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="storeCard.cardHolder.label" default="Card Holder" /></th>
					
						<g:sortableColumn property="cardId" title="${message(code: 'storeCard.cardId.label', default: 'Card Id')}" />
					
						<g:sortableColumn property="expDate" title="${message(code: 'storeCard.expDate.label', default: 'Exp Date')}" />
					
						<g:sortableColumn property="nameOnCard" title="${message(code: 'storeCard.nameOnCard.label', default: 'Name On Card')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${storeCardInstanceList}" status="i" var="storeCardInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${storeCardInstance.id}">${fieldValue(bean: storeCardInstance, field: "cardHolder")}</g:link></td>
					
						<td>${fieldValue(bean: storeCardInstance, field: "cardId")}</td>
					
						<td>${fieldValue(bean: storeCardInstance, field: "expDate")}</td>
					
						<td>${fieldValue(bean: storeCardInstance, field: "nameOnCard")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${storeCardInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
