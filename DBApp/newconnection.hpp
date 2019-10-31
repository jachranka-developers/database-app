#ifndef NEWCONNECTION_HPP
#define NEWCONNECTION_HPP

#include <QObject>

class NewConnection : public QObject
{
    Q_OBJECT
public:
    explicit NewConnection(QObject *parent = nullptr);

signals:

public slots:
};

#endif // NEWCONNECTION_HPP
