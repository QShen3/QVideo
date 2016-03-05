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
        case 1:return "古装|";
        case 2:return "武侠|";
        case 3:return "警匪|";
        case 4:return "军事|";
        case 5:return "神话|";
        case 6:return "科幻|";
        case 7:return "悬疑|";
        case 8:return "历史|";
        case 9:return "儿童|";
        case 10:return "农村|";
        case 11:return "都市|";
        case 12:return "家庭|";
        case 13:return "搞笑|";
        case 14:return "偶像|";
        case 15:return "言情|";
        case 16:return "时装|";
        case 17:return "优酷出品|";
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
        case 5:return "美国|";
        case 6:return "英国|";
        case 7:return "法国|";
        case 8:return "泰国|";
        case 9:return "新加坡|";
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
            value:"古装";
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
            value:"军事";
        }
        ListElement
        {
            value:"神话";
        }
        ListElement
        {
            value:"科幻";
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
            value:"家庭";
        }
        ListElement
        {
            value:"搞笑";
        }
        ListElement
        {
            value:"偶像";
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
            value:"台湾";
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
            value:"英国";
        }
        ListElement
        {
            value:"法国";
        }
        ListElement
        {
            value:"泰国";
        }
        ListElement
        {
            value:"新加坡"
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
