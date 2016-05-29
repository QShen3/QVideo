.pragma library
Qt.include("Request.js");

function Utility() {

    this.getVersion = function(onSuccess, onFailure){
             var request = new Request("http://t.zccrs.com/qvideo/version", "GET");
             request.sendRequest(onSuccess, onFailure);
         }

    this.getMessage = function(onSuccess, onFailure){
             var request = new Request("http://t.zccrs.com/qvideo/message", "GET");
             request.sendRequest(onSuccess, onFailure);
         }
}

var utility = new Utility();

function versionStringToInt(version){
    var j = 0,s1;
    var num=new Array;
    for(var i in version){
        if(version[i]==='.'){
            num[j]=i;
            j++;
        }
    }
    var temp = version.substring(0, ++num[0]);
    s1 = parseInt(temp) * 100;
    temp = version.substring(num[0], ++num[1]);
    s1 = s1 + parseInt(temp)*10;
    temp = version.substring(num[1]);
    s1 = s1 + parseInt(temp);

    return s1;
}
