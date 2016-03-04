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
                     case 1:return "178";
                     case 2:return "179";
                     case 3:return "180";
                     case 4:return "181";
                     case 5:return "182";
                     case 6:return "183";
                     case 7:return "184";
                     case 8:return "185";
                     case 9:return "186";
                     case 10:return "187";
                     case 11:return "188";
                     case 12:return "189";
                     case 13:return "190";
                     case 14:return "191";
                     case 15:return "192";
                     case 16:return "193";
                     case 17:return "194";
                     case 18:return "195";
                     case 19:return "196";
                     case 20:return "197";
                     case 21:return "198";
                     case 22:return "199";
                     case 23:return "200";
                     case 24:return "201";
                     case 25:return "202";
                     case 26:return "203";
                     case 27:return "204";
                     case 28:return "205";
                     case 29:return "207";
                     case 30:return "1013";
                     case 31:return "208";

                    }
             }
     function getarea()
             {
              switch(areacolumn.selectedIndex)
                    {
                     case 0:return "";
                     case 1:return "170";
                     case 2:return "171";
                     case 3:return "172";
                     case 4:return "173";
                     case 5:return "174";
                     case 6:return "176";
                     case 7:return "177";
                    }
             }
     function getyear()
             {
              switch(yearcolumn.selectedIndex)
                    {
                     case 0:return "|";
                     case 1:return "1310";
                     case 2:return "422";
                     case 3:return "423";
                     case 4:return "424";
                     case 5:return "425";
                     case 6:return "426";
                     case 7:return "427";
                     case 8:return "428";
                     case 9:return "429";
                     case 10:return "430";
                     case 11:return "431";
                     case 12:return "432";
                     case 13:return "433";
                     case 14:return "434";
                     case 15:return "435";
                     case 16:return "436";
                     case 17:return "437";
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
                              value:"选秀";
                             }
                  ListElement
                             {
                              value:"音乐";
                             }
                  ListElement
                             {
                              value:"脱口秀";
                             }
                  ListElement
                             {
                              value:"舞蹈";
                             }
                  ListElement
                             {
                              value:"访谈";
                             }
                  ListElement
                             {
                              value:"生活";
                             }
                  ListElement
                             {
                              value:"娱乐";
                             }
                  ListElement
                             {
                              value:"搞笑";
                             }
                  ListElement
                             {
                              value:"益智";
                             }
                  ListElement
                             {
                              value:"演唱会";
                             }
                  ListElement
                             {
                              value:"真人秀";
                             }
                  ListElement
                             {
                              value:"情感";
                             }
                  ListElement
                             {
                              value:"魔术";
                             }
                  ListElement
                             {
                              value:"模仿秀";
                             }
                  ListElement
                             {
                              value:"情景剧";
                             }
                  ListElement
                             {
                              value:"少儿";
                             }
                  ListElement
                             {
                              value:"没事";
                             }
                  ListElement
                             {
                              value:"旅游";
                             }
                  ListElement
                             {
                              value:"纪实";
                             }
                  ListElement
                             {
                              value:"晚会";
                             }
                  ListElement
                             {
                              value:"理财";
                             }
                  ListElement
                             {
                              value:"曲艺";
                             }
                  ListElement
                             {
                              value:"体育";
                             }
                  ListElement
                             {
                              value:"游戏";
                             }
                  ListElement
                             {
                              value:"时尚";
                             }
                  ListElement
                             {
                              value:"汽车";
                             }
                  ListElement
                             {
                              value:"母婴";
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
                              value:"台湾";
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
                              value:"澳大利亚";
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
                 }
    }
