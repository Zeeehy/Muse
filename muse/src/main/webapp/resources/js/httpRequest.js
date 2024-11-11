var XHR=null;

function getXHR(){
   
   if(window.ActiveXObject){
      return new ActiveXObject('Msxml2.XMLHTTP');
   }else if(window.XMLHttpRequest){
      return new XMLHttpRequest();
   } else {
      return null;
   }
}

function sendRequest(url,params,callback,method){
   
   XHR=getXHR();
   
   var newMethod = method?method:'GET'; //1차검증
   
   if(newMethod !='GET' && newMethod!='POST'){ //2차검증
      newMethod = 'GET';
   }
   
   var newParams=(params==null||params=='')?null:params;
   
   if(newMethod=='GET' && newParams!=null){
      url=url+'?'+newParams;
   }
   XHR.onreadystatechange=callback;
   XHR.open(newMethod,url,true);
   XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
   XHR.setRequestHeader('Accept', 'application/json');
   XHR.send(newMethod=='POST'?newParams:null);
   
      
}