#include "qmlsignaldispatcher.hpp"
#include <QDebug>

bool QMLSignalDispatcher::resultStatus() const
{
    return m_resultStatus;
}

QMLSignalDispatcher::QMLSignalDispatcher(QObject *parent) : QObject(parent)
{

}

void QMLSignalDispatcher::testConnection(const QString &connectionName, const QString &host, int port,
                                         const QString &dataBaseName, const QString &userName, const QString &password,
                                         const QString &driver, const QString &schema)
{
    qDebug() << connectionName << host << port << dataBaseName << userName << password << driver << schema;
    Connection *connection = new Connection(connectionName,host,port,dataBaseName,userName,password,driver,schema);
    bool status {false};
    connection->connect(status);
    connection->close();
    qDebug() << status;
    m_resultStatus = status;
    emit resultStatusChanged();
}
