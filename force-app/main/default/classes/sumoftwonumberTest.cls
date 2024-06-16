@isTest
public class sumoftwonumberTest {
    @isTest
    public static void tesrm1(){
        sumoftwonumber st=new sumoftwonumber();
        st.num1=2;
        st.num2=4;
        st.m1();
        system.AssertEquals(6,st.result,'this one is error');
        system.AssertNotEquals(6,st.result,'this one is error');
        
    }

}