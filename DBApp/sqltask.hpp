#ifndef SQLTASK_HPP
#define SQLTASK_HPP

#include <QObject>

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>

class SqlTask : public QObject
{
    Q_OBJECT
public:
    explicit SqlTask(QObject *parent = nullptr);
    SqlTask(QString driver_name, QString connection_name, QString host, QString user_name,
            QString password, QString database_name, QString schema_name,
            int port, QObject *parent = nullptr);

    bool connect();
    void prepare(const QString& query_text, bool use_transaction = true);
    bool execute();

    void close();

    QString lastError() const;

signals:

public slots:

private:

    QSqlDatabase _db;
    QSqlQuery *_query {nullptr};
    QString _queryText;

    QString _schema;
    bool _verbose {false};
    bool _processStatus {false};
    QString _processName;

    QString _lastError;
};

#endif // SQLTASK_HPP
