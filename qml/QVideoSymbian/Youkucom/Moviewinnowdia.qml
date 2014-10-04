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
                     case 0:return "|";
                     case 1:return "武侠|";
                     case 2:return "警匪|";
                     case 3:return "犯罪|";
                     case 4:return "科幻|";
                     case 5:return "战争|";
                     case 6:return "恐怖|";
                     case 7:return "惊悚|";
                     case 8:return "纪录片|";
                     case 9:return "西部|";
                     case 10:return "戏曲|";
                     case 11:return "歌舞|";
                     case 12:return "奇幻|";
                     case 13:return "冒险|";
                     case 14:return "悬疑|";
                     case 15:return "历史|";
                     case 16:return "动作|";
                     case 17:return "传记|";
                     case 18:return "动画|";
                     case 19:return "儿童|";
                     case 20:return "喜剧|";
                     case 21:return "爱情|";
                     case 22:return "剧情|";
                     case 23:return "优酷出品|";
                    }
             }
     function getarea()
             {
              switch(areacolumn.selectedIndex)
                    {
                     case 0:return "|";
                     case 1:return "大陆|";
                     case 2:return "香港|";
                     case 3:return "台湾|";
                     case 4:return "韩国|";
                     case 5:return "日本|";
                     case 6:return "美国|";
                     case 7:return "法国|";
                     case 8:return "英国|";
                     case 9:return "德国|";
                     case 10:return "意大利|";
                     case 11:return "加拿大|";
                     case 12:return "印度|";
                     case 13:return "俄罗斯|";
                     case 14:return "泰国|";
                     case 15:return "其它|";
                    }
             }
     function getyear()
             {
              switch(yearcolumn.selectedIndex)
                    {
                     case 0:return "|";
                     case 1:return "2014|";
                     case 2:return "2013|";
                     case 3:return "2012|";
                     case 4:return "2011|";
                     case 5:return "2010|";
                     case 6:return "2009|";
                     case 7:return "2008|";
                     case 8:return "2007|";
                     case 9:return "2006|";
                     case 10:return "2005|";
                     case 11:return "2004|";
                     case 12:return "2003|";
                     case 13:return "2002|";
                     case 14:return "2001|";
                     case 15:return "2000|";
                     case 16:return "1990-1999|";
                     case 17:return "1980-1989|";
                     case 18:return "1970-1979|";
                     case 19:return "1960-1969|";
                     case 20:return "1950-1959|";
                     case 21:return "-1950|";
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
                              value:"武侠";
                             }
                  ListElement
                             {
                              value:"警匪";
                             }
                  ListElement
                             {
                              value:"犯罪";
                             }
                  ListElement
                             {
                              value:"科幻";
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
                              value:"动作";
                             }
                  ListElement
                             {
                              value:"传记";
                             }
                  ListElement
                             {
                              value:"动画";
                             }
                  ListElement
                             {
                              value:"儿童";
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
                              value:"剧情";
                             }
                  ListElement
                             {
                              value:"优酷出品";
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
                              value:"台湾";
                             }
                  ListElement
                             {
                              value:"韩国";
                             }
                  ListElement
                             {
                              value:"日本";
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
                              value:"英国";
                             }
                  ListElement
                             {
                              value:"德国"
                             }
                  ListElement
                             {
                              value:"意大利"
                             }
                  ListElement
                             {
                              value:"加拿大"
                             }
                  ListElement
                             {
                              value:"印度"
                             }
                  ListElement
                             {
                              value:"俄罗斯"
                             }
                  ListElement
                             {
                              value:"泰国"
                             }
                  ListElement
                             {
                              value:"其它"
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
                  ListElement
                             {
                              value:"60年代";
                             }
                  ListElement
                             {
                              value:"50年代";
                             }
                  ListElement
                             {
                              value:"50年代以前";
                             }
                 }
    }
