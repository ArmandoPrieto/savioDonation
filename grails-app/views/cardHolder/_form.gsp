<%@ page import="saviodonation.CardHolder" %>



<div class="fieldcontain ${hasErrors(bean: cardHolderInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="cardHolder.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${cardHolderInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardHolderInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="cardHolder.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="address" name="address.id" from="${saviodonation.Address.list()}" optionKey="id" required="" value="${cardHolderInstance?.address?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardHolderInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="cardHolder.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${cardHolderInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardHolderInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="cardHolder.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${cardHolderInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cardHolderInstance, field: 'storeCard', 'error')} ">
	<label for="storeCard">
		<g:message code="cardHolder.storeCard.label" default="Store Card" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cardHolderInstance?.storeCard?}" var="s">
    <li><g:link controller="storeCard" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="storeCard" action="create" params="['cardHolder.id': cardHolderInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'storeCard.label', default: 'StoreCard')])}</g:link>
</li>
</ul>


</div>

