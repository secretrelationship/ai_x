Date.prototype.getIntervalDay = function(otherday){
  //this와 otherday 사이의 날짜 수를 return
  //now.getIntervalDay(openday):this가 now, otherday가 openday
  //openday.getIntervalDay(now): now가 openday, otherday가 


var interVAlMilliSec = Math.abs(this.getTime() - otherday.getTime());
let day = interVAlMilliSec / (1000*60*60*24);
return Math.trunc(day); 
};
//var now = new Date();
//var openday = new Date(2025,3,4,9,30,0);
//console.log(now.getIntervalDay(openday));
