// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
XmlListModel
            {
             id:pptvinfomodel;
             //source: "http://epg.api.pptv.com/detail.api?auth=d410fafad87e7bbf6c6dd62434345818&vid="+vid;
             query: "/v";
             XmlRole
                    {
                     name:"imgurl";
                     query: "imgurl/string()";
                    }
             XmlRole
                    {
                     name:"title";
                     query: "title/string()";
                    }
             XmlRole
                    {
                     name:"catalog";
                     query: "catalog/string()";
                    }
             XmlRole
                    {
                     name:"director";
                     query: "director/string()";
                    }
             XmlRole
                    {
                     name:"act";
                     query: "act/string()";
                    }
             XmlRole
                    {
                     name:"content";
                     query: "content/string()";
                    }
           /*Component.onCompleted:
                {
               console.log(source)
           }*/
            }
