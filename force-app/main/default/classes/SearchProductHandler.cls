public class SearchProductHandler {
    @AuraEnabled
    public static list<Product2> getProduct(string pname){
        return[Select Id,Name,ProductCode from Product2 where Name like : pname+'%'];
    }

 @AuraEnabled
      public static list<Product2> getProductDefault(){
          List<Product2> gerprodList = [Select Id,Name,ProductCode from Product2];
        return gerprodList;
    }
}