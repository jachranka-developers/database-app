#ifndef QMLSIGNALDISPATCHER_HPP
#define QMLSIGNALDISPATCHER_HPP

#include <QObject>

#include "connection.hpp"

class QMLSignalDispatcher : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool resultStatus READ resultStatus NOTIFY resultStatusChanged)

public:
    explicit QMLSignalDispatcher(QObject *parent = nullptr);

    bool resultStatus() const;

signals:

    void testConnectionResult();
    void resultStatusChanged();

public slots:

    void testConnection(const QString & connectionName, const QString & host, int port, const QString & dataBaseName,
                        const QString & userName, const QString & password, const QString & driver, const QString & schema);

private:

    bool m_resultStatus {false};
};

#endif // QMLSIGNALDISPATCHER_HPP
