@RestResource(urlMapping='/api/Webhooks/pushDetailsDemo/*')
global with sharing class WebhookDemo {
	@HttpPost
    global static void handleNotification(){
        try{
            RestRequest request = RestContext.request;
            RestResponse response = RestContext.response;
            
            system.debug('###'+request);
            system.debug('###'+request.requestBody.toString());
            system.debug('###'+response);

            Account objAccount = new Account();
            objAccount.Name = 'Webhook';
            objAccount.CurrencyIsoCode = 'USD';
            insert objAccount;
        }catch(Exception e){
            
        }
    }
}