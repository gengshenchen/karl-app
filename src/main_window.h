#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QMainWindow>

// #include "framelesswindow/framelesswindow.h"

class QtMaterialFlatButton;
class QtMaterialAppBar;
class QtMaterialAvatar;
class QtMaterialIconButton;
class QtMaterialDrawer;

namespace Ui {
class MainWindow;
}

#include <FramelessHelper/Widgets/framelessmainwindow.h>
#include <FramelessHelper/Widgets/framelesswidget.h>

FRAMELESSHELPER_REQUIRE_CONFIG(window)

#if FRAMELESSHELPER_CONFIG(titlebar)
FRAMELESSHELPER_BEGIN_NAMESPACE
class StandardTitleBar;
FRAMELESSHELPER_END_NAMESPACE
#endif

class MainWindow : public FRAMELESSHELPER_PREPEND_NAMESPACE(FramelessMainWindow) {
    Q_OBJECT
    Q_DISABLE_COPY_MOVE(MainWindow)
public:
    explicit MainWindow(QWidget *parent = nullptr, const Qt::WindowFlags flags = {});
    ~MainWindow();

    void waitReady();

protected:
    void closeEvent(QCloseEvent *event) override;

private:
    void initAppBar();
    void initDrawer();
    void initialize();

private:
    Ui::MainWindow *ui;
    QtMaterialFlatButton *const m_button;
    QtMaterialAppBar *const m_appBar;
    QtMaterialAvatar *const m_avatar;
    QtMaterialDrawer *const m_drawer;
    QWidget *m_canvas;
    FRAMELESSHELPER_PREPEND_NAMESPACE(StandardTitleBar) *m_titleBar = nullptr;
};

#endif  // MAINWINDOW_H
