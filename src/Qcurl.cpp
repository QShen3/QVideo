#include"Qcurl.h"
double Qcurl::progress;
Qcurl::Qcurl(QObject *parent):QObject(parent)
     {
      last=head=current=(struct Qcurldl *)malloc(sizeof(struct Qcurldl));
      curl_global_init(CURL_GLOBAL_ALL );
      state=0;
     }
Qcurl::~Qcurl()
     {
      if (!thread.isNull())
        {
         thread->terminate();
         thread->wait();
         dl->deleteLater();
        }
     }
void Qcurl::appenddl(QString url,  QString file)
    {
     int n=url.size()+1;
     char urlc[n];
     QChar temp;
     int i;
     for(i=0;i<n-1;i++)
        {
         temp=url.at(i);
         urlc[i]=temp.unicode();
        }
     urlc[n-1]='\0';
     n=file.size()+1;
     char filename[n];
     for(i=0;i<n-1;i++)
        {
         temp=file.at(i);
         filename[i]=temp.unicode();
        }
     filename[n-1]='\0';
     if(state==0)
       {       
        current->url=new char[url.size()+1];
        strcpy(current->url,urlc);
        current->fp=fopen(filename,"w");
        current->next=NULL;
        connect(this,SIGNAL(dlsetted()),this,SLOT(startnextdl()));
        emit dlsetted();
        return;
       }
     if(state==1)
       {
        last->next=(struct Qcurldl*)malloc(sizeof(struct Qcurldl));
        last=last->next;
        last->next=NULL;
        //qDebug(urlc);
        last->url=new char[url.size()+1];
        strcpy(last->url,urlc);
        last->fp=fopen(filename,"w");
       }
    }
double Qcurl::getprogress()
      {
       return progress;
      }
void Qcurl::startnextdl()
    {
     if(current==last&&state==3)
       {
        currenturl[0]='/0';
        state=0;
        return;
       }     
     if(state==3)
       {
        current=current->next;
       }
     curl=curl_easy_init();
     curl_easy_setopt(curl,CURLOPT_NOPROGRESS,0);
     curl_easy_setopt(curl,CURLOPT_FOLLOWLOCATION,1);
     curl_easy_setopt(curl,CURLOPT_VERBOSE,1);
     curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, Qcurl::file_callback);
     curl_easy_setopt(curl,CURLOPT_PROGRESSFUNCTION,Qcurl::progress_callback);
     curl_easy_setopt(curl, CURLOPT_URL,current->url);
     strcpy(currenturl,current->url);
     curl_easy_setopt(curl, CURLOPT_WRITEDATA,current->fp);
     if(thread.isNull())
       {
        thread = new QThread(this);
        dl = new Qcurlperformer;
        dl->moveToThread(thread);
        connect(this,SIGNAL(startdl(CURL*)),dl,SLOT(start(CURL*)));
        connect(dl,SIGNAL(statechanged(int)),this,SLOT(changestate(int)));
        connect(dl,SIGNAL(finished()),this,SLOT(startnextdl()));
        thread->start();
       }
     state=1;
     emit startdl(curl);
    }
void Qcurl::changestate(int dlstate)
    {
     state=dlstate;
    }
bool Qcurl::iscurrenturl(QString url)
    {
     int n=url.size()+1;
     char urlc[n];
     int i;
     for(i=0;i<n-1;i++)
        {
         urlc[i]=url.at(i).unicode();
        }
     urlc[n-1]='\0';
     if(strcmp(urlc,currenturl)==0)
       {
        return true;
       }
     return false;
    }
bool Qcurl::isfileexist(QString file)
    {
     int n=file.size()+1,i;
     char filename[n];
     for(i=0;i<n-1;i++)
        {
         filename[i]=file.at(i).unicode();
        }
     filename[n-1]='\0';
     FILE *fp;
     fp=fopen(filename,"r");
     if(fp==NULL)
       {
        return false;
       }
      fseek(fp,0,SEEK_END);
     if(ftell(fp)==0)
       {
        return false;
       }
     fclose(fp);
     return true;
    }
Qcurlperformer::Qcurlperformer(QObject *parent):QObject(parent)
              {
              }
size_t Qcurl::file_callback(void *ptr, size_t size, size_t nmemb, void *userp)
      {
       FILE *fp = (FILE *)userp;
       ptr=(char *)ptr;
       size_t return_size = fwrite(ptr, size, nmemb, fp);
       return return_size;
      }
int Qcurl::progress_callback(void *clientp, double dltotal, double dlnow, double ultotal, double ulnow)
   {
    if(dltotal==0)
      {
       progress=0;
       return 0;
      }
    progress=dlnow/dltotal;
    return 0;
   }
void Qcurlperformer::start(CURL *curl)
    {
    qDebug("start");
     res=curl_easy_perform(curl);
     if(res==CURLE_OK)
       {
        curl_easy_cleanup(curl);
         qDebug("finished");
        emit statechanged(3);
        emit finished();       
       }
    }
