.pragma library

function Request(url, method)
{
    this.url = url;
    this.method = method;
    this.query = "";
    this.postData = "";

    this.setQuery = function(query){
             for (var k in query) {
                 this.query += this.query === "" ? "?" : "&";
                 this.query += k + "=" + encodeURIComponent(query[k]);
             }
         }

    this.setParams = function(Params){
             for (var k in params) {
                 if (this.postData !== "")
                     this.postData += "&";
                 this.postData += k + "=" + encodeURIComponent(params[k]);
             }
         }

    this.sendRequest = function(onSuccess, onFailure) {
             var xhr = new XMLHttpRequest();
             xhr.onreadystatechange = function() {
                         if (xhr.readyState === XMLHttpRequest.DONE) {
                             if (xhr.status == 200) {
                                 try {
                                     onSuccess(xhr.responseText);
                                 }
                                 catch (e) {
                                     onFailure(e.toString());
                                 }
                             }
                             else {
                                 onFailure(xhr.status);
                             }
                         }
                     };
             xhr.open(this.method, this.url + this.query);
             console.log("querying " + this.url + this.query)
             if (this.method === "POST") {
                 xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                 xhr.setRequestHeader("Content-Length", this.postData.length);
                 xhr.send(this.postData);
             }
             else {
                 xhr.send(null);
             }
         }
}
