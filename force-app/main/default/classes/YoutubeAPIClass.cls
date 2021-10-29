public with sharing class YoutubeAPIClass {
   
    public List<Items> items;

    public class Items{
        public Snippet snippet;
        public Statistics statistics;
    }

    public class Snippet{
        public String title;
        public String description;
        public String publishedAt;
        public Localized localized;

    }

    public class Statistics{
        public String viewCount;
        public String CommentCount;
        public String subscriberCount;
        public Boolean hiddenSubscriberCount;
        public String videoCount;
    }

    public class Localized {
        public String title;
        public String description;
    }

    public static YoutubeAPIClass parse(String json){
        return (YoutubeAPIClass) System.JSON.deserialize(json, YoutubeAPIClass.class);
    }
    /**
     * Http http = new  Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://youtube.googleapis.com/youtube/v3/channels?key=AIzaSyCAzVbLfwFZPzDZaCj_Cl5K06vl9AafaCI&id=UCiEaJQyIrdLtD3w8z6yJ4Vw&part=snippet%2CcontentDetails%2Cstatistics');
request.setMethod('GET');
HttpResponse response = http.send(request);

if(response.getStatusCode() == 200){
	System.debug(response.getBody());
	YoutubeApiClass result = YoutubeApiClass.parse(response.getBody());
	for(YoutubeApiClass.Items itm : result.items){
		System.debug('recieve the following');	
		System.debug(itm.statistics);
	}
	
}

if(response.getStatusCode() == 200) {
	Map<String, Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
	List<Object> items = (List<Object>) results.get('items');
	for(Object item: items){
		Map<String, Object> childItems = (Map<String, Object>)item;
		System.debug('recieve the following statistics');
		System.debug(childItems.get('statistics'));
	}
}
     */
}
