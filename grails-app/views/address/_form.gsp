<%@ page import="saviodonation.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="address.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${addressInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'cardHolder', 'error')} required">
	<label for="cardHolder">
		<g:message code="address.cardHolder.label" default="Card Holder" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cardHolder" name="cardHolder.id" from="${saviodonation.CardHolder.list()}" optionKey="id" required="" value="${addressInstance?.cardHolder?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${addressInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="address.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="country" required="" value="${addressInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="address.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${addressInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zipCode', 'error')} required">
	<label for="zipCode">
		<g:message code="address.zipCode.label" default="Zip Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zipCode" required="" value="${addressInstance?.zipCode}"/>

</div>

