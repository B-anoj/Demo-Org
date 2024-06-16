public class Futuremethodexample {
    public Futuremethodexample(){
        takeshower();
        havebreakfast();
        carservicing();
        Moviewithfriend();
    }
    public  void takeshower(){
        System.debug('i am Doing work');
    } 
    public void havebreakfast(){
        System.debug('BreakFast Done');
    }
    @future
    public static void carservicing(){
        System.debug('car is being repaired');
    }
    @future
    public static void Moviewithfriend(){
        System.debug('We are going for movie');
        
    }
    
}