#include <QApplication>
#include <iostream>
#include "main_window.h"
#include "mathdll.h"

FRAMELESSHELPER_USE_NAMESPACE

int main(int argc, char *argv[]) {
    FramelessHelper::Widgets::initialize();
    //test dll function
    power_(10, 2);

    QApplication app(argc, argv);
    FramelessHelperEnableThemeAware();

    Q_INIT_RESOURCE(resources);
    MainWindow mainWindow;
    mainWindow.show();
    std::cout << "in func main" << std::endl;
    return app.exec();
}

//
// #include <QString>
// #include <QStringBuilder>
//
// QString func(QString a) {
//     QString r = ":ccccc/ " % a % "/ nnnn ";
//     return r;
// }
// int main() {
//     QString aa = func(QString("aaaaaaaaaaaaaa"));
//     return 0;
// }