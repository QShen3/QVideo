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


/*Qt.include("PPTVxmlana.js");
Qt.include("Youkuurl.js")
var signalcenter;
function setsignalcenter(mycenter)
        {
         signalcenter=mycenter;
        }
function sendWebRequest(url, callback)
        {
         var xmlhttp = new XMLHttpRequest();
         xmlhttp.onreadystatechange = function()
                {
                 switch(xmlhttp.readyState)
                       {
                        case xmlhttp.OPENED:signalcenter.loadStarted();break;
                        case xmlhttp.HEADERS_RECEIVED:if (xmlhttp.status != 200)signalcenter.loadFailed("连接错误,代码:"+xmlhttp.status+"  "+xmlhttp.statusText);break;
                        case xmlhttp.DONE:if (xmlhttp.status == 200)
                                            {
                                             try
                                                {
                                                 callback(xmlhttp.responseText);
                                                 signalcenter.loadFinished();
                                                }
                                             catch(e)
                                                  {
                                                   signalcenter.loadFailed("loading erro...");
                                                 //console.log(url)
                                                  }
                                            }
                                          else
                                              {
                                               signalcenter.loadFailed("");
                                              }
                                          break;
                      }
                }
         xmlhttp.open("GET",url);
         xmlhttp.send();
        }
var youkulist;

var ykplaydir;
var ykplayactor;
var ykplaydet;
var ykplaygen;
var ykplaycomp;
var ykplaystat;

var ykep;
var ykplayurl;
var ykplaydata;
var ykplaydatanum;
function getyoukulist(cid,ob,pg,area,genre,releaseyear)
        {
        switch(cid)
              {
               case "100":var url="http://api.3g.youku.com/layout/android3_0/item_list?pid=0865e0628a79dfbb&guid=19a417c47f4d96b14e735b4a3c71d2bf&cid="+cid+"&ob="+ob+"&pg="+pg+"&filter=area:"+area+"anime_genre:"+genre+"releaseyear:"+releaseyear;break;
               case "97":var url="http://api.3g.youku.com/layout/android3_0/item_list?pid=0865e0628a79dfbb&guid=19a417c47f4d96b14e735b4a3c71d2bf&cid="+cid+"&ob="+ob+"&pg="+pg+"&filter=area:"+area+"tv_genre:"+genre+"releaseyear:"+releaseyear;break;
               case "85":var url="http://api.3g.youku.com/layout/android3_0/item_list?pid=0865e0628a79dfbb&guid=19a417c47f4d96b14e735b4a3c71d2bf&cid="+cid+"&ob="+ob+"&pg="+pg+"&filter=area:"+area+"variety_genre:"+genre+"releaseyear:"+releaseyear;break;
               case "96":var url="http://api.3g.youku.com/layout/android3_0/item_list?pid=0865e0628a79dfbb&guid=19a417c47f4d96b14e735b4a3c71d2bf&cid="+cid+"&ob="+ob+"&pg="+pg+"&filter=area:"+area+"movie_genre:"+genre+"releaseyear:"+releaseyear;break;
              }
         sendWebRequest(url,loadyoukulist);
        }
function loadyoukulist(oritxt)
        {
         var obj=JSON.parse(oritxt);
         if(obj.pg==="1")
           {
            youkulist.clear();
           }
         for(var i in obj.results)
            {
             youkulist.append(obj.results[i]);
            }
        }

function getyoukuvideoinfo(id)
        {
         var url="http://api.3g.youku.com/layout/android3_0/play/detail?pid=0865e0628a79dfbb&guid=19a417c47f4d96b14e735b4a3c71d2bf&id="+id;
         sendWebRequest(url,loadyoukuvideoinfo);
        }
function loadyoukuvideoinfo(oritxt)
        {
         var obj=JSON.parse(oritxt);
         ykplaydet=obj.detail.desc;
         ykplaystat=obj.detail.stripe_bottom;
         if(obj.detail.completed===1)
           ykplaycomp="已完结";
         else ykplaycomp="未完结";
         signalcenter.ykinfoloadfinish();
         ykplayactor.clear();
         ykplaydir.clear();
         ykplaygen.clear();
         if(obj.detail.tag_type==="动漫")
           {
            for(var i in obj.detail.original)
               {
                ykplaydir.append({"dire":obj.detail.original[i]});
               }
            for(i in obj.detail.voice)
               {
                ykplayactor.append({"actor":obj.detail.voice[i]});
               }
           }
         else
             {
              for(var i in obj.detail.director)
                 {
                  ykplaydir.append({"dire":obj.detail.director[i]});
                 }
              for(i in obj.detail.performer)
                 {
                  ykplayactor.append({"actor":obj.detail.performer[i]});
                 }
             }
         for(i in obj.detail.genre)
            {
             ykplaygen.append({"genre":obj.detail.genre[i]});
            }
        }
function getykep(id,page,pagesize,title)
        {
         if(title===1)
           var url="http://api.3g.youku.com/shows/"+id+"/reverse/videos?pid=0865e0628a79dfbb&guid=19a417c47f4d96b14e735b4a3c71d2bf&fields=vid|titl|is_new&pg="+page+"&pz="+pagesize;
         else var url="http://api.3g.youku.com/shows/"+id+"/reverse/videos?pid=0865e0628a79dfbb&guid=19a417c47f4d96b14e735b4a3c71d2bf&fields=vid|is_new&pg="+page+"&pz="+pagesize;
         sendWebRequest(url,loadykep);
        }
function loadykep(oritxt)
        {
         var obj=JSON.parse(oritxt)
         if(obj.pg===1)
           {
            ykep.clear();
           }
         for(var i in obj.results)
            {
             ykep.append(obj.results[i]);
            }
        }
function getykplayurl(id,quality)
        {
         if(quality===1)
           {
            var url="http://v.youku.com/player/getPlaylist/VideoIDS/"+id+"/Pf/4/ctype/12/ev/1?__callback="
            sendWebRequest(url,laodykplayurl1);
           }
         if(quality===2)
           {
            var url="http://v.youku.com/player/getPlaylist/VideoIDS/"+id+"/Pf/4/ctype/12/ev/1?__callback="
            sendWebRequest(url,laodykplayurl2);
            //sendWebRequest(url,loadykplayurltest);
           }
        }
function laodykplayurl1(oritxt)
        {
         var obj=JSON.parse(oritxt);
         var sid, fileid, k, ts, token, oip, ep;
         var a = obj.data[0],c = E(F("b4eto0b4", [19, 1, 4, 7, 30, 14, 28, 8, 24,17, 6, 35, 34, 16, 9, 10, 13, 22, 32, 29, 31, 21, 18, 3, 2, 23, 25, 27, 11, 20, 5, 15, 12, 0, 33, 26]).toString(), na(a.ep));
         sid = c.split("_")[0];
         token = c.split("_")[1];
         fileid = getFileID(obj.data[0].streamfileids["3gphd"], obj["data"][0]["seed"]);
         k = obj["data"][0]["segs"]["3gphd"][0]["k"];
         ts = obj["data"][0]["segs"]["3gphd"][0]["seconds"];
         oip = obj["data"][0]["ip"];
         ep = encodeURIComponent(D(E(F("boa4poz1", [19, 1, 4, 7, 30, 14, 28, 8, 24, 17, 6, 35, 34, 16, 9, 10, 13, 22, 32, 29, 31, 21, 18, 3, 2, 23, 25, 27, 11, 20, 5, 15, 12, 0, 33, 26]).toString(), sid + "_" + fileid + "_" + token)));
         ykplayurl = "http://k.youku.com/player/getFlvPath/sid/" + sid;
         ykplayurl += "_00/st/mp4/fileid/" + fileid;
         ykplayurl += "?K=" + k;
         ykplayurl += "&ts=" + ts;
         ykplayurl += "&ypp=0&ctype=12&ev=1";
         ykplayurl += "&token=" + token;
         ykplayurl += "&oip=" + oip;
         ykplayurl += "&ep=" + ep;
         ykplayurl += "&callback=";
         signalcenter.ykurlloadfinish();
        }
function laodykplayurl2(oritxt)
        {
         ykplayurl="";
         var obj=JSON.parse(oritxt);
         var sid, fileid, k, ts, token, oip, ep;
         var a = obj.data[0],c = E(F("b4eto0b4", [19, 1, 4, 7, 30, 14, 28, 8, 24,17, 6, 35, 34, 16, 9, 10, 13, 22, 32, 29, 31, 21, 18, 3, 2, 23, 25, 27, 11, 20, 5, 15, 12, 0, 33, 26]).toString(), na(a.ep));
         sid = c.split("_")[0];
         token = c.split("_")[1];
         for(var i in obj.data[0].segs.mp4)
            {
             fileid = getFileID(obj.data[0].streamfileids["mp4"], obj["data"][0]["seed"]);
             fileid=fileid.slice(0,9)+i.toString()+fileid.slice(10);
             k = obj["data"][0]["segs"]["mp4"][i]["k"];
             ts = obj["data"][0]["segs"]["mp4"][i]["seconds"];
             oip = obj["data"][0]["ip"];
             ep = encodeURIComponent(D(E(F("boa4poz1", [19, 1, 4, 7, 30, 14, 28, 8, 24, 17, 6, 35, 34, 16, 9, 10, 13, 22, 32, 29, 31, 21, 18, 3, 2, 23, 25, 27, 11, 20, 5, 15, 12, 0, 33, 26]).toString(), sid + "_" + fileid + "_" + token)));
             ykplayurl += "http://k.youku.com/player/getFlvPath/sid/" + sid;
             ykplayurl += "_0"+i.toString()+"/st/mp4/fileid/" + fileid;
             ykplayurl += "?K=" + k;
             ykplayurl += "&ts=" + ts;
             ykplayurl += "&ypp=0&ctype=12&ev=1&hd=1";
             ykplayurl += "&token=" + token;
             ykplayurl += "&oip=" + oip;
             ykplayurl += "&ep=" + ep;
             ykplayurl += "\n";
            }
         console.log(ykplayurl);
         signalcenter.ykurlloadfinish();
        }
var tudoulist;
function gettudoulist(firstTagId,sort,pg,area,genre,releaseyear)
        {
         if(area==="")
           {
            if(genre==="")
              {
               if(releaseyear==="")
                 {
                  var url="http://api.3g.tudou.com/pianku/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&firstTagId="+firstTagId+"&tagType=3&tags=&pg="+pg+"&pz=30&sort="+sort;
                 }
               else var url="http://api.3g.tudou.com/pianku/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&firstTagId="+firstTagId+"&tagType=3&tags="+releaseyear+"&pg="+pg+"&pz=30&sort="+sort;
              }
            else
                {
                 if(releaseyear==="")
                   {
                    var url="http://api.3g.tudou.com/pianku/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&firstTagId="+firstTagId+"&tagType=3&tags="+genre+"&pg="+pg+"&pz=30&sort="+sort;
                   }
                 else var url="http://api.3g.tudou.com/pianku/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&firstTagId="+firstTagId+"&tagType=3&tags="+genre+","+releaseyear+"&pg="+pg+"&pz=30&sort="+sort;
                }
           }
         else
             {
              if(genre==="")
                {
                 if(releaseyear==="")
                   {
                    var url="http://api.3g.tudou.com/pianku/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&firstTagId="+firstTagId+"&tagType=3&tags="+area+"&pg="+pg+"&pz=30&sort="+sort;
                   }
                else var url="http://api.3g.tudou.com/pianku/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&firstTagId="+firstTagId+"&tagType=3&tags="+area+","+releaseyear+"&pg="+pg+"&pz=30&sort="+sort;
               }
             else
                 {
                  if(releaseyear==="")
                    {
                     var url="http://api.3g.tudou.com/pianku/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&firstTagId="+firstTagId+"&tagType=3&tags="+area+","+genre+"&pg="+pg+"&pz=30&sort="+sort;
                    }
                  else var url="http://api.3g.tudou.com/pianku/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&firstTagId="+firstTagId+"&tagType=3&tags="+area+","+genre+","+releaseyear+"&pg="+pg+"&pz=30&sort="+sort;
                 }
             }
         sendWebRequest(url,loadtudoulist);
        }
function loadtudoulist(oritxt)
        {
         var obj=JSON.parse(oritxt)
         for(var i in obj.items)
            {
             //console.log(obj.items[i].aid)
             tudoulist.append(obj.items[i])
            }
        }


var tdplaydir;
var tdplayactor;
var tdplaydet;
var tdplaygen;
//var tdplaycomp;
var tdplaystat;

var tdep;
function gettudouvideoinfo(aid)
        {
         var url="http://api.3g.tudou.com/v4/play/detail?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&show_playlist=1&aid="+aid;
         sendWebRequest(url,loadtudouvideoinfo);
        }
function loadtudouvideoinfo(oritxt)
        {
         var obj=JSON.parse(oritxt);
         tdplaydet=obj.detail.desc;
         tdplaystat=obj.detail.stripe_bottom;
         signalcenter.ykinfoloadfinish();
         tdplaydir.clear();
         tdplayactor.clear();
         tdplaygen.clear();
         if(obj.detail.cats==="动漫")
           {
            for(var i in obj.detail.voiceActors)
               {
                tdplayactor.append({"actor":obj.detail.voiceActors[i]});
               }
           }
         else
             {
              for(var i in obj.detail.actors)
                 {
                  tdplayactor.append({"actor":obj.detail.actors[i]});
                 }
             }
         for(var i in obj.detail.director)
            {
             tdplaydir.append({"dire":obj.detail.director[i]});
            }
         for(var i in obj.detail.categories)
            {
             tdplaygen.append({"genre":obj.detail.categories[i]});
            }
        }
function gettdep(aid)
        {
         var url ="http://api.3g.tudou.com/v4/album/videos?pid=8084620b90d000d0&guid=9b1fe5e237f996632cebc85ee521ff62&aid="+aid;
         sendWebRequest(url,loadtdep);
        }
function loadtdep(oritxt)
        {
         var obj=JSON.parse(oritxt);
         tdep.clear();
         for(var i in obj.items)
            {
             tdep.append(obj.items[i]);
            }
        }
function gettdplayurl(id,quality)
        {
         var url ="http://api.flvxz.com/jsonp/purejson/site/tudou/vid/"+id;

        }
*/
