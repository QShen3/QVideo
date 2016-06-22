.pragma library
//Qt.include("Base64.js");
Qt.include("MD5.js")
Qt.include("Request.js");

function Youku(){

    var skey = "631l1i1x3fv5vs2dxlj5v8x81jqfs2om";
    var pid = "93dbf376783ed31c";
    var guid = "2b53678411eeefc8c9a56960b0896c5d";
    var sdkver = "6";

    //new api
    this.getTag = function(onSuccess, onFailure) {
             var request = new Request("http://api.mobile.youku.com/layout/android5_0/channel/tags", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/layout/android5_0/channel/tags:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getSubTabs = function(cid, onSuccess, onFailure) {
             var request = new Request("http://api.mobile.youku.com/layout/android/channel/subtabs", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/layout/android/channel/subtabs:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  cid: cid
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getFilter = function(cid, onSuccess, onFailure){
             var request = new Request("http://api.mobile.youku.com/layout/android3_0/channel/filter", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/layout/android3_0/channel/filter:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  cid: cid
                              });
             request.sendRequest(onSuccess, onFailure);
         }
    this.getSubPage = function(cid, sub_channel_id, sub_channel_type, filter, ob, pg, onSuccess, onFailure){
             var request = new Request("http://api.mobile.youku.com/layout/android/channel/subpage", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/layout/android/channel/subpage:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  cid: cid,
                                  sub_channel_id: sub_channel_id,
                                  sub_channel_type: sub_channel_type,
                                  filter: filter,
                                  ob: ob,
                                  pg: pg
                              });
             request.sendRequest(onSuccess, onFailure);
         }
    this.getDetail = function(format, id, onSuccess, onFailure){
             var request = new Request("http://api.mobile.youku.com/layout/android5_0/play/detail", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/layout/android5_0/play/detail:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  format: format,
                                  id: id
                              });
             request.sendRequest(onSuccess, onFailure);
         }
    this.getVideos = function(id, fields, order, pg, pz, onSuccess, onFailure){
             var request = new Request("http://api.mobile.youku.com/shows/" + id + "/reverse/videos", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/shows/" + id + "/reverse/videos:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  fields: fields,
                                  order: order,
                                  pg: pg,
                                  pz: pz
                              });
             request.sendRequest(onSuccess, onFailure);
         }
    this.getPlay = function(vid, onSuccess, onFailure){
             var request = new Request("http://play.youku.com/play/get.json", "GET");            
             request.setQuery({
                                  vid: vid,
                                  ct: "10"
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getRelate = function(id, pg, pz, onSuccess, onFailure){
             var request = new Request("http://api.mobile.youku.com/common/shows/relate", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/common/shows/relate:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  id: id,
                                  pg: pg,
                                  pz: pz
                              });
             request.sendRequest(onSuccess, onFailure);
         }
    this.getComments = function(id, pg, pz, onSuccess, onFailure){
             var request = new Request("http://user-mobile.youku.com/videos/" + id + "/comments", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/u/s:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  pg: pg,
                                  pz: pz
                              });
             request.sendRequest(onSuccess, onFailure);
         }
    this.getUserinfo = function(friend, playlist_num, video_num, onSuccess, onFailure){
             var request = new Request("http://user-mobile.youku.com/user/timeline/userinfo", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/u/s:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  friend: friend,
                                  playlist_num: playlist_num,
                                  playlist_order: "published",
                                  video_num: video_num,
                                  video_order: "published"
                              });
             request.sendRequest(onSuccess, onFailure);
         }
    this.getPlayorVideo_list = function(friend, type, pg, pz, onSuccess, onFailure){
             var request = new Request("http://user-mobile.youku.com/user/timeline/playorvideo/list", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/u/s:" + _t_ + ":" + skey);
             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  friend: friend,
                                  type: type,
                                  pg: pg,
                                  pz: pz,
                                  order: "published"
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getUrls = function(command, onSuccess, onFailure){
             var request = new Request("http://q.zccrs.com/", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/u/s:" + _t_ + ":" + skey);
             request.setQuery({
                                  action: "exec",
                                  command: command
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getHot = function(pz, onSuccess, onFailure){
             var request = new Request("http://api.appsdk.soku.com/h/h", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/h/h:" + _t_ + ":" + skey);

             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  pz: pz,
                                  sdkver: sdkver
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getDSearch = function(keyword, onSuccess, onFailure){
             var request = new Request("http://api.appsdk.soku.com/d/s", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/d/s:" + _t_ + ":" + skey);

             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  keyword: keyword,
                                  sdkver: sdkver
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getSearchFilter = function(onSuccess, onFailure){
             var request = new Request("http://api.appsdk.soku.com/u/sf", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/u/sf:" + _t_ + ":" + skey);

             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  sdkver: sdkver
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getSearch = function(keyword, format, cid, seconds, seconds_end, ob, pg, onSuccess, onFailure){
             var request = new Request("http://api.appsdk.soku.com/u/s", "GET");
             var _t_ = Math.round(new Date().getTime()/1000);
             var md5 = new MD5();
             var _s_ = md5.hex_md5("GET:/u/s:" + _t_ + ":" + skey);

             request.setQuery({
                                  pid: pid,
                                  guid: guid,
                                  _t_: _t_,
                                  _s_: _s_,
                                  sdkver: sdkver,
                                  keyword: keyword,
                                  format: format,
                                  cid: cid,
                                  seconds: seconds,
                                  seconds_end: seconds_end,
                                  ob: ob,
                                  pg: pg
                              });
             request.sendRequest(onSuccess, onFailure);
         }


    //old api
/*
    this.getList = function(cid, ob, pg, filter, onSuccess, onFailure){
             var request = new Request("http://api.3g.youku.com/layout/android3_0/item_list", "GET");
             request.setQuery({
                                  pid: "0865e0628a79dfbb",
                                  guid: "19a417c47f4d96b14e735b4a3c71d2bf",
                                  cid: cid,
                                  ob: ob,
                                  pg: pg,
                                  filter: filter
                              });
             request.sendRequest(onSuccess, onFailure);
             //console.log("here")
         }

    this.getDetail = function(id, onSuccess, onFailure){
             var request = new Request("http://api.3g.youku.com/layout/android3_0/play/detail", "GET");
             request.setQuery({
                                  pid: "0865e0628a79dfbb",
                                  guid: "19a417c47f4d96b14e735b4a3c71d2bf",
                                  id: id
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getVideos = function(id, pg, pz, onSuccess, onFailure){
             var request = new Request("http://api.3g.youku.com/shows/" + id + "/reverse/videos", "GET");
             request.setQuery({
                                  pid: "0865e0628a79dfbb",
                                  guid: "19a417c47f4d96b14e735b4a3c71d2bf",
                                  fields: "vid|titl|is_new",
                                  pg: pg,
                                  pz: pz
                              });
             request.sendRequest(onSuccess, onFailure);
         }

    this.getPlayUrl = function(id, format, onSuccess, onFailure){
             var request = new Request("http://qvideo.duapp.com/youku", "GET");
             request.setQuery({
                                  id: id,
                                  format: format
                              });
             request.sendRequest(onSuccess, onFailure);
         }
*/

/*
    var steam_types = {
        mp4hd3: { 'container': 'flv', 'video_profile': '1080P' },
        hd3: { 'container': 'flv', 'video_profile': '1080P' },
        mp4hd2: { 'container': 'flv', 'video_profile': '超清' },
        hd2: { 'container': 'flv', 'video_profile': '超清' },
        mp4hd: { 'container': 'mp4', 'video_profile': '高清' },
        mp4: { 'container': 'mp4', 'video_profile': '高清' },
        flvhd: { 'container': 'flv', 'video_profile': '标清' },
        flv: { 'container': 'flv', 'video_profile': '标清' },
        "3gphd": { 'container': '3gp', 'video_profile': '标清（3GP）' }
    }

    var trans_e = function (a, c) {
        var f = 0,
                h = 0,
                i, result = "",
                temp;
        var b = new Array(256);
        for (i = 0; i < 256; i++) {
            b[i] = i;
        }
        while (h < 256) {
            f = (f + b[h] + (a[h % a.length]).charCodeAt()) % 256;
            temp = b[h];
            b[h] = b[f];
            b[f] = temp;
            h += 1;
        }
        var q = 0;
        f = h = 0;
        while (q < c.length) {
            h = (h + 1) % 256;
            f = (f + b[h]) % 256;
            temp = b[h];
            b[h] = b[f];
            b[f] = temp;
            result += String.fromCharCode((c[q]).charCodeAt() ^ b[(b[h] + b[f]) % 256]);
            q += 1;
        }

        return result;
    }

    var generate_filed = function (no, streamfileds) {
        no = parseInt(no);
        var number = (no.toString(16)).toUpperCase();
        //console.log(number);
        if (number.length === 1) {
            number = "0" + number;
        }
        var filedid = streamfileds.substring(0, 8) + number + streamfileds.substring(10);
        return filedid;
    }

    var generate_ep = function (no, streamfileds, sid, token) {
        var base64 = new Base64();
        var ep = encodeURIComponent(base64.encode(trans_e("bf7e5f01", sid + "_" + generate_filed(no, streamfileds) + "_" + token)));
        return ep;
    }
*/
}

var youku = new Youku();
