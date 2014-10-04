import QtQuick 1.1
QtObject
        {
         signal loadStarted;
         signal loadFinished;
         signal loadFailed(string errorstring);

         signal ykinfoloadfinish;
         signal ykurlloadfinish;

         signal tdinfoloadfinish;
         signal tdurlloadfinish;
        }
