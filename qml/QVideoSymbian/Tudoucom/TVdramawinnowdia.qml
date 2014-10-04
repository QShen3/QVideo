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
                     case 1:return "52";
                     case 2:return "53";
                     case 3:return "54";
                     case 4:return "55";
                     case 5:return "56";
                     case 6:return "57";
                     case 7:return "59";
                     case 8:return "60";
                     case 9:return "61";
                     case 10:return "63";
                     case 11:return "64";
                     case 12:return "65";
                     case 13:return "66";
                     case 14:return "67";
                     case 15:return "68";
                     case 16:return "69";
                     case 17:return "71";
                     case 18:return "72";
                     case 19:return "73";
                     case 20:return "74";
                     case 21:return "131";
                    }
             }
     function getarea()
             {
              switch(areacolumn.selectedIndex)
                    {
                     case 0:return "";
                     case 1:return "42";
                     case 2:return "43";
                     case 3:return "44";
                     case 4:return "45";
                     case 5:return "46";
                     case 6:return "47";
                     case 7:return "48";
                     case 8:return "49";
                     case 9:return "50";
                    }
             }
     function getyear()
             {
              switch(yearcolumn.selectedIndex)
                    {
                     case 0:return "";
                     case 1:return "1307";
                     case 2:return "325";
                     case 3:return "326";
                     case 4:return "327";
                     case 5:return "328";
                     case 6:return "329";
                     case 7:return "330";
                     case 8:return "331";
                     case 9:return "332";
                     case 10:return "333";
                     case 11:return "334";
                     case 12:return "335";
                     case 13:return "336";
                     case 14:return "337";
                     case 15:return "338";
                     case 16:return "339";
                     case 17:return "340";
                     case 18:return "341";
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
                              value:"神话";
                             }
                  ListElement
                             {
                              value:"古装";
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
                              value:"偶像";
                             }
                  ListElement
                             {
                              value:"家庭";
                             }
                  ListElement
                             {
                              value:"军事";
                             }
                  ListElement
                             {
                              value:"警匪";
                             }
                  ListElement
                             {
                              value:"喜剧";
                             }
                  ListElement
                             {
                              value:"传记";
                             }
                  ListElement
                             {
                              value:"生活";
                             }
                  ListElement
                             {
                              value:"剧情";
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
                              value:"儿童";
                             }
                  ListElement
                             {
                              value:"农村";
                             }
                  ListElement
                             {
                              value:"都市";
                             }
                  ListElement
                             {
                              value:"搞笑";
                             }
                  ListElement
                             {
                              value:"言情";
                             }
                  ListElement
                             {
                              value:"时装";
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
                              value:"美国";
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
                              value:"泰国";
                             }
                  ListElement
                             {
                              value:"新加坡";
                             }
                  ListElement
                             {
                              value:"法国";
                             }
                  ListElement
                             {
                              value:"英国"
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
