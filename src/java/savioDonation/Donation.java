package savioDonation;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.mes.sdk.core.Settings;
import com.mes.sdk.exception.MesRuntimeException;
import com.mes.sdk.gateway.CcData;
import com.mes.sdk.gateway.Gateway;
import com.mes.sdk.gateway.GatewayRequest;
import com.mes.sdk.gateway.GatewayResponse;
import com.mes.sdk.gateway.GatewaySettings;
import com.mes.sdk.gateway.GatewayRequest.TransactionType;
import com.mes.sdk.rbs.Rbs;
import com.mes.sdk.rbs.RbsRequest;
import com.mes.sdk.rbs.RbsResponse;
import com.mes.sdk.rbs.RbsSettings;
import com.mes.sdk.rbs.RbsRequest.PaymentFrequency;
import com.mes.sdk.rbs.RbsRequest.PaymentType;
import com.mes.sdk.rbs.RbsRequest.RequestType;
import com.mes.sdk.test.MesTest;


public class Donation extends MesTest{
	
	private Rbs rbs;
	private RbsSettings rbsSettings;
	private Gateway gateway;
	private GatewaySettings settings;
	private final static Logger LOG = Logger.getLogger(Donation.class.getName());
	
	private String profileId = "94100012095600000004";
	private String profileIdRBS = "94100012095600000005";
	private String profileKey = "afqSNFoJJwcBPlbAAMHfnELpHGriJowL";
	
	private String user = "941000120956RBS";
	//private String pass = "JcTaArSavio@2015";
	private String pass = "JcTaArSavio@2015";
	
	
	
	public boolean sale(String firstName, 
			String lastName,
			String address, 
			String zip,
			String email,
			String phone,
			String cardNumber, 
			String expDate, 
			String cvv, 
			String payment, 
			String invoiceNumber, 
			String clientReferenceNumber) {
		settings = new GatewaySettings();
		settings.credentials(profileId, profileKey)
			.hostUrl(GatewaySettings.URL_LIVE)
			.method(Settings.Method.POST)
			.timeout(10000)
			.verbose(true);
		
		gateway = new Gateway(settings);
		
		try {
			GatewayRequest sRequest = new GatewayRequest(TransactionType.SALE)
				.cardData(
					new CcData()
						.setCcNum(cardNumber)
						.setExpDate(expDate)
						.setCvv(cvv)
				)
				.amount(payment)
				.cardholderName(firstName, lastName) 
				.cardholderAddress(address, zip)
				.cardholderEmail(email)
				//.cardholderPhone(phone)
				.setParameter("invoice_number", invoiceNumber)
				.setParameter("client_reference_number", clientReferenceNumber);
			GatewayResponse sResponse = gateway.run(sRequest);
			LOG.log(Level.INFO, sResponse.toString());
			System.out.println(sResponse.toString()+" "+sResponse.getErrorCode()+" "+sResponse.getTransactionId());
			return sResponse.isApproved();
		} catch (MesRuntimeException e) {
			e.printStackTrace();
			return false;
		}
		
	}

	public boolean cardCreateRecord(String custumerId, 
			String cardNumber,
			String expDate, 
			String address, 
			String zipCode, 
			String amount,
			String startDay,
			String startMonth,
			String startYear,
			String paymentCount) {
		rbsSettings = new RbsSettings()
			.credentials(user, pass, profileIdRBS)
			.hostUrl(RbsSettings.URL_LIVE)
			.verbose(true);
		
		rbs = new Rbs(rbsSettings);
		
		try {
			RbsRequest cRequest = new RbsRequest(RequestType.CREATE);
			cRequest.setCustomerId(custumerId)
				.setPaymentType(PaymentType.CC)
				.setFrequency(PaymentFrequency.MONTHLY)
				.setCardData(cardNumber, expDate)
				.setCardCustomerData(address, zipCode)
				.setStartDate(startMonth,startDay , startYear)
				.setAmount(amount)
				.setPaymentCount(paymentCount);
			
			RbsResponse cResponse = rbs.run(cRequest);
			LOG.log(Level.INFO, cResponse.toString());
			System.out.println( cResponse.toString()+" "+cResponse.getErrorCode() + " "+cResponse.getResponseText());
			if(cResponse.requestSuccessful()) {
				// Store Results
				
				return true;
			}
		} catch (MesRuntimeException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean cardDeleteRecord(String custumerId) {
		rbsSettings = new RbsSettings()
			.credentials(user, pass, profileIdRBS)
			.hostUrl(RbsSettings.URL_LIVE)
			.verbose(true);
		
		rbs = new Rbs(rbsSettings);
		
		try {
			RbsRequest cRequest = new RbsRequest(RequestType.DELETE);
			cRequest.setCustomerId(custumerId);
			
			RbsResponse cResponse = rbs.run(cRequest);
			LOG.log(Level.INFO, cResponse.toString());
			if(cResponse.requestSuccessful()) {
				// Store Results
			
				return true;
			}
		} catch (MesRuntimeException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean cardInquireRecord(String custumerId) {
		rbsSettings = new RbsSettings()
			.credentials(user, pass, profileIdRBS)
			.hostUrl(RbsSettings.URL_LIVE)
			.verbose(true);
		
		rbs = new Rbs(rbsSettings);
		
		try {
			RbsRequest cRequest = new RbsRequest(RequestType.INQUIRY);
			cRequest.setCustomerId(custumerId);
			
			RbsResponse cResponse = rbs.run(cRequest);
			LOG.log(Level.INFO, cResponse.toString());
			if(cResponse.requestSuccessful()) {
				// Store Results
				return true;
			}
		} catch (MesRuntimeException e) {
			
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean cardUpdateRecord(String custumerId,
			String cardNumber,
			String expDate, 
			String address, 
			String zipCode, 
			String amount,
			String startDay,
			String startMonth,
			String startYear,
			String paymentCount) {
		rbsSettings = new RbsSettings()
			.credentials(user, pass, profileIdRBS)
			.hostUrl(RbsSettings.URL_LIVE)
			.verbose(true);
		
		rbs = new Rbs(rbsSettings);
		
		try {
			RbsRequest cRequest = new RbsRequest(RequestType.UPDATE);
			cRequest.setCustomerId(custumerId)
				.setCardData(cardNumber, expDate)
				.setCardCustomerData(address, zipCode)
				.setNextDate(startMonth, startDay, startYear)
				.setAmount(amount)
				.setPaymentCount(paymentCount);
			
			RbsResponse cResponse = rbs.run(cRequest);
			LOG.log(Level.INFO, cResponse.toString());
			System.out.println(cResponse.toString() +" "+cResponse.getErrorCode() + " "+cResponse.getResponseText());
			if(cResponse.requestSuccessful()) {
				// Store Results
				return true;
			}
		} catch (MesRuntimeException e) {
			e.printStackTrace();
		}
		return false;
	}
/*
	public String storeCard(){
		
		settings = new GatewaySettings();
		settings.credentials(profileId, profileKey)
			.hostUrl(GatewaySettings.URL_LIVE)
			.method(Settings.Method.POST)
			.timeout(10000)
			.verbose(true);
		
		gateway = new Gateway(settings);
		
		try {
			GatewayRequest sRequest = new GatewayRequest(TransactionType.TOKENIZE)
				.cardData(
					new CcData()
						.setCcNum("4012888812348882")
						.setExpDate("1212")
						
				)
				.setParameter("client_reference_number", "Java SDK Test");
			GatewayResponse sResponse = gateway.run(sRequest);
			LOG.log(Level.INFO, sResponse.toString());
			System.out.println(sResponse.toString()+" "+sResponse.getTransactionId()+" "+sResponse.getErrorCode());
			
			return sResponse.getTransactionId();
		} catch (MesRuntimeException e) {
			e.printStackTrace();
		}
		return "";
	}
	*/
	/*
public void deStoreCard(String cardStoreId){
		
		settings = new GatewaySettings();
		settings.credentials(profileId, profileKey)
			.hostUrl(GatewaySettings.URL_LIVE)
			.method(Settings.Method.POST)
			.timeout(10000)
			.verbose(true);
		
		gateway = new Gateway(settings);
		
		try {
			GatewayRequest dRequest = new GatewayRequest(TransactionType.DETOKENIZE)
			.cardData(
				new CcData()
					.setToken(cardStoreId) //cardToken
			)
			.setParameter("client_reference_number", "Java SDK Test");
		GatewayResponse dResponse = gateway.run(dRequest);
		LOG.log(Level.INFO, dResponse.toString());
		System.out.println("deStoreCard "+dResponse.toString());
			
			
		} catch (MesRuntimeException e) {
			e.printStackTrace();
		}
	}
*/
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
	}
	
}


