package com.mes.sdk.gateway;

import java.util.HashMap;

import com.mes.sdk.core.ResponseObject;

/**
 * The GatewayResponse adds to {@link ResponseObject}, adding methods specific to the Payment Gateway. 
 * @author brice
 *
 */
public class GatewayResponse extends ResponseObject {

	private final boolean isApproved;
	
	public GatewayResponse(HashMap<String, String> response, int httpCode, String httpText, String rawResponse, float duration, boolean isApproved) {
		super(response, httpCode, httpText, rawResponse, duration);
		this.isApproved = isApproved;
	}
	
	/**
	 * Returns true on an approved request (an error code of 000, or 085 in the case of a validation).
	 * @return true on a valid request
	 */
	public boolean isApproved() {
		return isApproved;
	}
	
	/**
	 * Get the Gateway error code. May not be numeric only (such as the 0N7 CVV mismatch result code).<br />
	 * The return cannot be an integer; non numeric codes are possible, such as "0N7" (for cvv mismatch).
	 * @return The Gateway's error code result
	 */
	public String getErrorCode() {
		return super.getResponseValue("error_code");
	}
	
	/**
	 * Get the textual response returned by the Gateway.
	 * @return The Gateway's text description of the result
	 */
	public String getAuthResponse() {
		return super.getResponseValue("auth_response_text");
	}
	
	/**
	 * Gets the transaction ID returned with every request.
	 * @return The transaction ID generated by the Gateway
	 */
	public String getTransactionId() {
		return super.getResponseValue("transaction_id");
	}

	@Override
	public String toString() {
		return "[Approved:"+isApproved+"] " + super.toString();
	}
	
}