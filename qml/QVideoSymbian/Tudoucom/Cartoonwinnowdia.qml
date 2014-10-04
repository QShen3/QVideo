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
                     case 1:return "132";
                     case 2:return "133";
                     case 3:return "134";
                     case 4:return "135";
                     case 5:return "136";
                     case 6:return "137";
                     case 7:return "138";
                     case 8:return "139";
                     case 9:return "140";
                     case 10:return "141";
                     case 11:return "142";
                     case 12:return "143";
                     case 13:return "144";
                     case 14:return "145";
                     case 15:return "146";
                     case 16:return "147";
                     case 17:return "148";
                     case 18:return "149";
                     case 19:return "150";
                     case 20:return "151";
                     case 21:return "152";
                     case 22:return "153";
                     case 23:return "154";
                     case 24:return "155";
                     case 25:return "156";
                     case 26:return "157";
                     case 27:return "158";
                     case 28:return "159";
                     case 29:return "160";
                     case 30:return "161";
                     case 31:return "162";
                     case 32:return "163";
                     case 33:return "164";
                     case 34:return "165";
                     case 35:return "166";
                     case 36:return "167";
                     case 37:return "168";
                     case 38:return "169";
                    }
             }
     function getarea()
             {
              switch(areacolumn.selectedIndex)
                    {
                     case 0:return "";
                     case 1:return "120";
                     case 2:return "121";
                     case 3:return "122";
                     case 4:return "123";
                     case 5:return "124";
                     case 6:return "125";
                     case 7:return "126";
                     case 8:return "127";
                     case 9:return "128";
                    }
             }
     function getyear()
             {
              switch(yearcolumn.selectedIndex)
                    {
                     case 0:return "";
                     case 1:return "1308";
                     case 2:return "354";
                     case 3:return "355";
                     case 4:return "356";
                     case 5:return "357";
                     case 6:return "358";
                     case 7:return "359";
                     case 8:return "360";
                     case 9:return "361";
                     case 10:return "362";
                     case 11:return "363";
                     case 12:return "364";
                     case 13:return "365";
                     case 14:return "366";
                     case 15:return "367";
                     case 16:return "368";
                     case 17:return "369";
                     case 18:return "370";
                     case 19:return "371";
                     case 20:return "372";
                     case 21:return "1008";
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
                              value:"热血";
                             }
                  ListElement
                             {
                              value:"科幻";
                             }
                  ListElement
                             {
                              value:"神魔";
                             }
                  ListElement
                             {
                              value:"机战";
                             }
                  ListElement
                             {
                              value:"竞技";
                             }
                  ListElement
                             {
                              value:"格斗";
                             }
                  ListElement
                             {
                              value:"恋爱";
                             }
                  ListElement
                             {
                              value:"励志";
                             }
                  ListElement
                             {
                              value:"社会";
                             }
                  ListElement
                             {
                              value:"搞笑";
                             }
                  ListElement
                             {
                              value:"冒险";
                             }
                  ListElement
                             {
                              value:"刑侦";
                             }
                  ListElement
                             {
                              value:"历史";
                             }
                  ListElement
                             {
                              value:"神话";
                             }
                  ListElement
                             {
                              value:"宠物";
                             }
                  ListElement
                             {
                              value:"悬疑";
                             }
                  ListElement
                             {
                              value:"幻想";
                             }
                  ListElement
                             {
                              value:"友情";
                             }
                  ListElement
                             {
                              value:"真人";
                             }
                  ListElement
                             {
                              value:"运动";
                             }
                  ListElement
                             {
                              value:"战争";
                             }
                  ListElement
                             {
                              value:"美少女";
                             }
                  ListElement
                             {
                              value:"LOLI";
                             }
                  ListElement
                             {
                              value:"校园";
                             }
                  ListElement
                             {
                              value:"青春";
                             }
                  ListElement
                             {
                              value:"推理";
                             }
                  ListElement
                             {
                              value:"吸血鬼";
                             }
                  ListElement
                             {
                              value:"忍者";
                             }
                  ListElement
                             {
                              value:"魔法";
                             }
                  ListElement
                             {
                              value:"后宫";
                             }
                  ListElement
                             {
                              value:"穿越";
                             }
                  ListElement
                             {
                              value:"同人";
                             }
                  ListElement
                             {
                              value:"剧情";
                             }
                  ListElement
                             {
                              value:"教育";
                             }
                  ListElement
                             {
                              value:"亲子";
                             }
                  ListElement
                             {
                              value:"益智";
                             }
                  ListElement
                             {
                              value:"童话";
                             }
                  ListElement
                             {
                              value:"其他";
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
                              value:"日本";
                             }
                  ListElement
                             {
                              value:"大陆";
                             }
                  ListElement
                             {
                              value:"美国";
                             }
                  ListElement
                             {
                              value:"韩国";
                             }
                  ListElement
                             {
                              value:"英国";
                             }
                  ListElement
                             {
                              value:"法国";
                             }
                  ListElement
                             {
                              value:"台湾";
                             }
                  ListElement
                             {
                              value:"香港";
                             }
                  ListElement
                             {
                              value:"其它";
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
