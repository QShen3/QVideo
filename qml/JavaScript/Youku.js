.pragma library
Qt.include("Base64.js");
Qt.include("Request.js");

function Youku(){



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
}
