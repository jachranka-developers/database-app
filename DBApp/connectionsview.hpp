#ifndef CONNECTIONSVIEW_HPP
#define CONNECTIONSVIEW_HPP

#include <QObject>
#include <QVector>

#include "connection.hpp"

class ConnectionsView : public QObject
{
    Q_OBJECT
public:
    explicit ConnectionsView(QObject *parent = nullptr);

signals:

public slots:

private:

    QVector<Connection*> _connections;
};

#endif // CONNECTIONSVIEW_HPP
