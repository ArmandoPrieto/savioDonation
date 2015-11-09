<%@ page import="saviodonation.StoreCard" %>



<div class="fieldcontain ${hasErrors(bean: storeCardInstance, field: 'cardHolder', 'error')} required">
	<label for="cardHolder">
		<g:message code="storeCard.cardHolder.label" default="Card Holder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cardHolder" name="cardHolder.id" from="${saviodonation.CardHolder.list()}" optionKey="id" required="" value="${storeCardInstance?.cardHolder?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: storeCardInstance, field: 'cardId', 'error')} required">
	<label for="cardId">
		<g:message code="storeCard.cardId.label" default="Card Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cardId" required="" value="${storeCardInstance?.cardId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: storeCardInstance, field: 'expDate', 'error')} required">
	<label for="expDate">
		<g:message code="storeCard.expDate.label" default="Exp Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="expDate" required="" value="${storeCardInstance?.expDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: storeCardInstance, field: 'nameOnCard', 'error')} required">
	<label for="nameOnCard">
		<g:message code="storeCard.nameOnCard.label" default="Name On Card" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nameOnCard" required="" value="${storeCardInstance?.nameOnCard}"/>

</div>

