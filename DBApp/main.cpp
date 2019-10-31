#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


#include "qmlsignaldispatcher.hpp"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QMLSignalDispatcher contextAPI;

    QQmlApplicationEngine engine;

    QQmlContext *ctx = engine.rootContext();
    ctx->setContextProperty("contextAPI",&contextAPI);
    qmlRegisterType<QMLSignalDispatcher>("qmldispatcher",1,0,"QMLSignalDispatcher");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
