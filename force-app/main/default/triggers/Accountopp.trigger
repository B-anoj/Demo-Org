//Write a trigger on Account when Account is update check all opportunity inside the account. 
//Update all Opportunities Stage to close lost if an opportunity created date is 
//greater than 30 days from today and stage not equal to close won.


trigger Accountopp on Account (after update) {
/*
//list<opportunity>lsopp=new list<opportunity>();
set<id>setid=new set<id>();

for(account acc:trigger.new){
setid.add(acc.id);
}

list<opportunity> updateopp=[select accountid,stage,rating,closedate from opportunities where accountid in : lsopp];

for(opportunities opp:acc)
for(opportunity )
if(stage!='lost' && createdate >30 )
{

}    


*/
}