#ifndef EXCHANGEHELPER_H
#define EXCHANGEHELPER_H

#include <QObject>
#include <QDebug>

class ExchangeHelper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString fUrl READ fUrl WRITE setFUrl NOTIFY fUrlChanged)
public:
    explicit ExchangeHelper(QObject *parent = nullptr);
    const QString &fUrl() {
        return fUrl_;
    }

    void setFUrl(const QString &v) {
        if(fUrl_!=v){
            fUrl_=v;
            emit fUrlChanged();

            QString msg;
            msg = "set fUrl: ";
            msg += v;
            qDebug() << msg;
        }
    }


signals:
    void fUrlChanged();
private:
    QString fUrl_;
};

#endif // EXCHANGEHELPER_H
