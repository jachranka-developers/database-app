#include "sqltask.hpp"

SqlTask::SqlTask(QObject *parent) : QObject(parent)
{

}

SqlTask::SqlTask(QString driver_name, QString connection_name,
                 QString host, QString user_name, QString password,
                 QString database_name, QString schema_name, int port,
                 QObject *parent) : QObject(parent)
{
    _db = QSqlDatabase::addDatabase(driver_name,connection_name);

    _db.setHostName(host);
    _db.setPassword(password);
    _db.setDatabaseName(database_name);
    _db.setUserName(user_name);
    _db.setPort(port);

    _schema = schema_name;

    _query = new QSqlQuery(_db);
}

bool SqlTask::connect()
{
    if(_db.open())
    {
        return true;
    }
    else
    {
        _lastError = _db.lastError().text();
        return false;
    }
}

void SqlTask::prepare(const QString &query_text, bool use_transaction)
{
    if(use_transaction)
    {
        _db.transaction();
        _query->prepare(query_text);
    }
    else
    {
        _query->prepare(query_text);
    }
}

bool SqlTask::execute()
{
    if(_query->exec())
    {
        return true;
    }
    else
    {
        _lastError = _query->lastError().text();
        return false;
    }
}

void SqlTask::close()
{
    auto connection_name = _db.connectionName();
    _db.close();
    _db.~QSqlDatabase();

    QSqlDatabase::removeDatabase(connection_name);
}

QString SqlTask::lastError() const
{
    return _lastError;
}
