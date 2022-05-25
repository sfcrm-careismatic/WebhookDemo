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
                    parser.nextToken();
                    ps = (pusher)parser.readValueAs(pusher.class);
                    System.debug(ps);

                }

                if(parser.getText() == 'repository'){
                    parser.nextToken();
                    rp = (repo)parser.readValueAs(repo.class);
                    System.debug(rp);
                }                

                
            }
            
            Github_Config__c objGitHub = new Github_Config__c();
            objGitHub.Git_Url__c = rp.html_url;
            objGitHub.Commit_Url__c = rp.commits_url;
            objGitHub.Pusher__c = ps.name;
            objGitHub.Pusher_Email__c = ps.email;
            insert objGitHub;

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
        public String commits_url;
        public String html_url;
        public repo(String commits_url, String html_url){
            commits_url = commits_url;            
            html_url = html_url;
        }
    }
}