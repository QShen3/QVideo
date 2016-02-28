// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
XmlListModel
            {
             id:pptvlist;
             source: "http://epg.api.pptv.com/list.api?auth=d410fafad87e7bbf6c6dd62434345818&s="+s.toString()+"&c=20&type="+type+"&order="+order;
             query: "/vlist/v" ;
             XmlRole
                    {
                     name: "title" ;
                     query: "title/string()";
                    }
             XmlRole
                    {
                     name: "vid";
                     query: "vid/string()";
                    }
             XmlRole
                    {
                     name:"image";
                     query: "imgurl/string()";
                    }
             XmlRole
                    {
                     name: "state";
                     query: "state/string()";
                    }
             XmlRole
                    {
                     name:"mark";
                     query: "mark/string()"
                    }
            }
