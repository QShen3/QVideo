// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
Item
    {
     signal diaaccepted;
     property alias type :typecolumn.selectedIndex;
     function open()
             {
              winnowdia.open();
             }
     function gettype()
             {
              switch(typecolumn.selectedIndex)
                    {
                     case 0:return "";
                     case 1:return "91";
                     case 2:return "92";
                     case 3:return "93";
                     case 4:return "94";
                     case 5:return "95";
                     case 6:return "96";
                     case 7:return "97";
                     case 8:return "98";
                     case 9:return "99";
                     case 10:return "100";
                     case 11:return "101";
                     case 12:return "102";
                     case 13:return "103";
                     case 14:return "104";
                     case 15:return "105";
                     case 16:return "106";
                     case 17:return "107";
                     case 18:return "108";
                     case 19:return "109";
                     case 20:return "110";
                     case 21:return "111";
                     case 22:return "112";
                     case 23:return "113";
                     case 24:return "114";
                     case 25:return "115";
                     case 26:return "116";
                     case 27:return "117";
                     case 28:return "118";
                     case 29:return "119";
                     case 30:return "1009";
                     case 31:return "130";
                    }
             }
     function getarea()
             {
              switch(areacolumn.selectedIndex)
                    {
                     case 0:return "|";
                     case 1:return "77";
                     case 2:return "78";
                     case 3:return "79";
                     case 4:return "80";
                     case 5:return "81";
                     case 6:return "82";
                     case 7:return "83";
                     case 8:return "84";
                     case 10:return "85";
                     case 11:return "86";
                     case 12:return "87";
                     case 13:return "88";
                     case 14:return "89";
                     case 15:return "90";
                    }
             }
     function getyear()
             {
              switch(yearcolumn.selectedIndex)
                    {
                     case 0:return "|";
                     case 1:return "1309";
                     case 2:return "376";
                     case 3:return "377";
                     case 4:return "378";
                     case 5:return "379";
                     case 6:return "380";
                     case 7:return "381";
                     case 8:return "382";
                     case 9:return "383";
                     case 10:return "384";
                     case 11:return "385";
                     case 12:return "386";
                     case 13:return "387";
                     case 14:return "388";
                     case 15:return "389";
                     case 16:return "390";
                     case 17:return "391";
                     case 18:return "392";
                    }
             }
     TumblerDialog
                  {
                   id:winnowdia;
                   titleText: "筛选";
                   acceptButtonText: "确定";
                   rejectButtonText: "取消";
                   platformInverted: true;
                   columns:
                          [
                           typecolumn,areacolumn,yearcolumn
                          ]
                   onAccepted:
                             {
                              diaaccepted();
                             }
                  }
     TumblerColumn
                  {
                   id:typecolumn;
                   label: "类型";
                   selectedIndex: 0;
                   items: typelist;
                  }
     TumblerColumn
                  {
                      id:areacolumn;
                      label:"地区";
                      selectedIndex: 0;
                      items: arealist;
                     }
     TumblerColumn
                  {
                      id:yearcolumn;
                      label: "年份";
                      selectedIndex: 0;
                      items: yearlist;
                     }
     ListModel
              {
                  id:typelist;
                  ListElement
                             {
                              value:"全部类型";
                             }
                  ListElement
                             {
                              value:"剧情";
                             }
                  ListElement
                             {
                              value:"文艺";
                             }
                  ListElement
                             {
                              value:"喜剧";
                             }
                  ListElement
                             {
                              value:"爱情";
                             }
                  ListElement
                             {
                              value:"犯罪";
                             }
                  ListElement
                             {
                              value:"动画";
                             }
                  ListElement
                             {
                              value:"战争";
                             }
                  ListElement
                             {
                              value:"恐怖";
                             }
                  ListElement
                             {
                              value:"惊悚";
                             }
                  ListElement
                             {
                              value:"动作";
                             }
                  ListElement
                             {
                              value:"冒险";
                             }
                  ListElement
                             {
                              value:"悬疑";
                             }
                  ListElement
                             {
                              value:"历史";
                             }
                  ListElement
                             {
                              value:"搞笑";
                             }
                  ListElement
                             {
                              value:"都市";
                             }
                  ListElement
                             {
                              value:"警匪";
                             }
                  ListElement
                             {
                              value:"传记";
                             }
                  ListElement
                             {
                              value:"儿童";
                             }
                  ListElement
                             {
                              value:"武侠";
                             }
                  ListElement
                             {
                              value:"科幻";
                             }
                  ListElement
                             {
                              value:"纪录片";
                             }
                  ListElement
                             {
                              value:"西部";
                             }
                  ListElement
                             {
                              value:"戏曲";
                             }
                  ListElement
                             {
                              value:"歌舞";
                             }
                  ListElement
                             {
                              value:"奇幻";
                             }
                  ListElement
                             {
                              value:"短片";
                             }
                  ListElement
                             {
                              value:"活动";
                             }
                  ListElement
                             {
                              value:"土豆映像";
                             }
                  ListElement
                             {
                              value:"土豆出品";
                             }
                  ListElement
                             {
                              value:"优酷出品";
                             }
                  ListElement
                             {
                              value:"其它";
                             }
                 }
     ListModel
              {
                  id:arealist;
                  ListElement
                             {
                              value:"全部地区";
                             }
                  ListElement
                             {
                              value:"大陆";
                             }
                  ListElement
                             {
                              value:"香港";
                             }
                  ListElement
                             {
                              value:"韩国";
                             }
                  ListElement
                             {
                              value:"美国";
                             }
                  ListElement
                             {
                              value:"法国";
                             }
                  ListElement
                             {
                              value:"意大利";
                             }
                  ListElement
                             {
                              value:"英国";
                             }
                  ListElement
                             {
                              value:"台湾";
                             }
                  ListElement
                             {
                              value:"泰国"
                             }
                  ListElement
                             {
                              value:"德国"
                             }
                  ListElement
                             {
                              value:"日本"
                             }
                  ListElement
                             {
                              value:"俄罗斯"
                             }
                  ListElement
                             {
                              value:"印度"
                             }
                 }
     ListModel
              {
                  id:yearlist;
                  ListElement
                             {
                              value:"不限";
                             }
                  ListElement
                             {
                              value:"2014";
                             }
                  ListElement
                             {
                              value:"2013";
                             }
                  ListElement
                             {
                              value:"2012";
                             }
                  ListElement
                             {
                              value:"2011";
                             }
                  ListElement
                             {
                              value:"2010";
                             }
                  ListElement
                             {
                              value:"2009";
                             }
                  ListElement
                             {
                              value:"2008";
                             }
                  ListElement
                             {
                              value:"2007";
                             }
                  ListElement
                             {
                              value:"2006";
                             }
                  ListElement
                             {
                              value:"2005";
                             }
                  ListElement
                             {
                              value:"2004";
                             }
                  ListElement
                             {
                              value:"2003";
                             }
                  ListElement
                             {
                              value:"2002";
                             }
                  ListElement
                             {
                              value:"2001";
                             }
                  ListElement
                             {
                              value:"2000";
                             }
                  ListElement
                             {
                              value:"90年代";
                             }
                  ListElement
                             {
                              value:"80年代";
                             }
                  ListElement
                             {
                              value:"70年代";
                             }                  
                 }
    }
