#ifndef CONNECTION_HPP
#define CONNECTION_HPP

#include <QObject>
#include "sqltask.hpp"

class Connection : public QObject
{
    Q_OBJECT
public:
    explicit Connection(QObject *parent = nullptr);
    Connection(const QString & connectionName, const QString & host, int port, const QString & dataBaseName,
               const QString & userName, const QString & password, const QString & driver, const QString & schema,
               QObject *parent = nullptr);

    void close();

signals:

public slots:

    void connect(bool &status);

private:

    QString _connectionName {"SQL"};
    QString _host;
    int _port;

    QString _database_name;
    QString _userName;
    QString _password;
    QString _driver;
    QString _schema_name;

    SqlTask *_task {nullptr};

};

#endif // CONNECTION_HPP
