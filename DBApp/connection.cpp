#include "connection.hpp"
#include <QDebug>

Connection::Connection(QObject *parent) : QObject(parent)
{

}

Connection::Connection(const QString &connectionName, const QString &host, int port,
                       const QString &dataBaseName, const QString &userName,
                       const QString &password, const QString &driver,
                       const QString &schema, QObject *parent) : QObject(parent),
    _connectionName(connectionName), _host(host), _port(port),_database_name(dataBaseName),
    _userName(userName), _password(password), _driver(driver), _schema_name(schema)
{

}

void Connection::close()
{
    _task->close();
}

void Connection::connect(bool &status)
{
    _task = new SqlTask(_driver,_connectionName,_host,
                        _userName,_password,_database_name,
                        _schema_name,_port);

    if(_task->connect())
    {
        status = true;
    }
    else
    {
        qDebug() << _task->lastError();
        status = false;
    }
}
