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

            // Account objAccount = new Account();
            // objAccount.Name = 'Webhook';
            // objAccount.CurrencyIsoCode = 'USD';
            // insert objAccount;

            String responseVal = request.requestBody.toString();

            JSONParser parser = JSON.createParser(request.requestBody.toString());
            pusher ps;
            repo rp;
            while (parser.nextToken() != null){
                System.debug(parser.getText());
                if(parser.getText() == 'pusher'){
                    ps = (pusher)parser.readValueAs(pusher.class);
                    System.debug(ps);
                }

                if(parser.getText() == 'repository'){
                    rp = (repo)parser.readValueAs(repo.class);
                    System.debug(rp);
                }

                // Github_Config__c objGitHub = new Github_Config__c();
                // objGitHub.Git_Url__c = 
            }            

        }catch(Exception e){
            
        }
    }

    public class pusher{
        public String name;
        public String email;
        public pusher(String name, String email){
            name = name;
            email = email;
        }
    }

    public class repo{
        public String full_name;
        public String id;
        public repo(String full_name, String id){
            full_name = full_name;
            id = id;
        }
    }
}