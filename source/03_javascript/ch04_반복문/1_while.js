var now = new Date();
var startTime = now.getTime();
//console.log(startTime);//
cnt = 0;
while(new Date().getTime() < startTime + 1000){
    cnt++; //cnt 1 증가
}
console.log('while문반복횟수:',cnt);
startTime = new Date.getTime();
cnt=0;
do{
    ++cnt;
}while(new Date().getTime() < startTime + 1000);
console.log('Do~while문 반복횟수:', cnt);