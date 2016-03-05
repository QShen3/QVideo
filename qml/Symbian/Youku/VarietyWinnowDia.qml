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
        case 1:return "优酷出品|";
        case 2:return "优酷牛人|";
        case 3:return "脱口秀|";
        case 4:return "真人秀|";
        case 5:return "选秀|";
        case 6:return "美食|";
        case 7:return "旅游|";
        case 8:return "访谈|";
        case 9:return "纪实|";
        case 10:return "搞笑|";
        case 11:return "时尚|";
        case 12:return "晚会|";
        case 13:return "理财|";
        case 14:return "演唱会|";
        case 15:return "曲艺|";
        case 16:return "益智|";
        case 17:return "音乐|";
        case 18:return "舞蹈|";
        case 19:return "体育|";
        case 20:return "娱乐|";
        case 21:return "游戏|";
        case 22:return "生活|";
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
        case 7:return "澳大利亚|";
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
            value:"优酷出品";
        }
        ListElement
        {
            value:"牛人";
        }
        ListElement
        {
            value:"脱口秀";
        }
        ListElement
        {
            value:"真人秀";
        }
        ListElement
        {
            value:"选秀";
        }
        ListElement
        {
            value:"美食";
        }
        ListElement
        {
            value:"旅游";
        }
        ListElement
        {
            value:"访谈";
        }
        ListElement
        {
            value:"纪实";
        }
        ListElement
        {
            value:"搞笑";
        }
        ListElement
        {
            value:"时尚";
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
            value:"演唱会";
        }
        ListElement
        {
            value:"曲艺";
        }
        ListElement
        {
            value:"益智";
        }
        ListElement
        {
            value:"音乐";
        }
        ListElement
        {
            value:"舞蹈";
        }
        ListElement
        {
            value:"体育";
        }
        ListElement
        {
            value:"娱乐";
        }
        ListElement
        {
            value:"游戏";
        }
        ListElement
        {
            value:"生活";
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
            value:"澳大利亚";
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
