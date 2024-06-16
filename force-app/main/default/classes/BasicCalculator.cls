public class BasicCalculator {
    public integer firstnumber {set;get;}
    public integer secondnumber {set;get;}
    public integer operationResult {set;get;}
    
    public void Addition()
    {
       operationResult=firstnumber + secondnumber;
    }
    public void substraction()
    {
        operationResult=firstnumber - secondnumber;
    }
    
    public void multiplication()
    {
        operationResult=firstnumber * secondnumber;
    }
    public void division()
    {
        operationResult=firstnumber / secondnumber;
    }

}