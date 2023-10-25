#include "main_window.h"
#include "ui_main_window.h"
#include <iostream>
//QT
#include <QLabel>
#include <QFileIconProvider>
//framelesshelper head
#include <FramelessHelper/Core/framelessmanager.h>
#include <FramelessHelper/Core/utils.h>
#include <FramelessHelper/Widgets/framelesswidgetshelper.h>
#include <FramelessHelper/Widgets/standardsystembutton.h>
#include <FramelessHelper/Widgets/standardtitlebar.h>

#include "main_window_config.h"
#include "qtmaterialappbar.h"
#include "qtmaterialavatar.h"
#include "qtmaterialdrawer.h"
#include "qtmaterialflatbutton.h"
#include "qtmaterialiconbutton.h"

FRAMELESSHELPER_USE_NAMESPACE
using namespace Global;

MainWindow::MainWindow(QWidget *parent, const Qt::WindowFlags flags)
    : FramelessMainWindow(parent, flags)
    , ui(new Ui::MainWindow)
    , m_button(new QtMaterialFlatButton("I'm flat"))
    , m_appBar(new QtMaterialAppBar())
    , m_avatar(new QtMaterialAvatar(QChar('X')))
    , m_drawer(new QtMaterialDrawer) {
    ui->setupUi(this);

    //MainWindow ���Լ��Ĳ��֣�Ҫ�Զ��岼������widget��
    m_canvas            = new QWidget(this);
    QVBoxLayout *layout = new QVBoxLayout(this);
    layout->setContentsMargins(0, 0, 0, 0);
    m_canvas->setLayout(layout);
    this->setCentralWidget(m_canvas);

    initDrawer();
    initAppBar();

    layout->addWidget(m_appBar);
    layout->addWidget(m_button);
    layout->addWidget(m_avatar);

    initialize();
}

MainWindow::~MainWindow() {
    delete ui;
}

void MainWindow::waitReady() {
    FramelessWidgetsHelper *helper = FramelessWidgetsHelper::get(this);
    helper->waitForReady();
}

void MainWindow::closeEvent(QCloseEvent *event) {
    FramelessMainWindow::closeEvent(event);
}

void MainWindow::initialize() {
    m_titleBar = new StandardTitleBar(this);
    m_titleBar->setTitleLabelAlignment(Qt::AlignCenter);

#if SHOW_APP_ICON
    setWindowIcon(QIcon(":icon/icon/app.ico"));
    m_titleBar->setWindowIconVisible(true);
#else
    m_titleBar->setWindowIconVisible(false);
#endif
#if SHOW_MENU
    const auto titleBarLayout = static_cast<QHBoxLayout *>(m_titleBar->layout());
    QMenuBar *const mb        = menuBar();
    mb->setSizePolicy(QSizePolicy::Preferred, QSizePolicy::Maximum);
    mb->setStyleSheet(FRAMELESSHELPER_STRING_LITERAL(R"(
          QMenuBar {
              background-color: transparent;
          }

          QMenuBar::item {
              background: transparent;
          }

          QMenuBar::item:selected {
              background: #a8a8a8;
          }

          QMenuBar::item:pressed {
              background: #888888;
          }
              )"));
    // ��ʱ��titleBarLayout�Ѿ��пؼ��ڲ��������addSpacing������������ӣ�Ҫʹ��insertSpacing��ͼ����ı�TitleLabel �����ڲ��֡�
    // Դ�룺 titleBarLayout->addStretch(); //Ҳ�ǲ�����ģ�indexҲҪ��
    //       titleBarLayout->addLayout(systemButtonsOuterLayout);//�Ŵ���С�ر� һ������
    m_titleBar->setWindowIconSize(QSize(16, 16));
    QSize iconSize = m_titleBar->windowIconSize();
    titleBarLayout->insertSpacing(0, iconSize.width() + 16);
    titleBarLayout->insertWidget(1, mb);
#endif
    // setMenuWidget(): make the menu widget become the first row of the window.
    this->setMenuWidget(m_titleBar);

    FramelessWidgetsHelper *helper = FramelessWidgetsHelper::get(this);
    helper->setTitleBarWidget(m_titleBar);
#if (!defined(Q_OS_MACOS) && FRAMELESSHELPER_CONFIG(system_button))
    helper->setSystemButton(m_titleBar->minimizeButton(), SystemButtonType::Minimize);
    helper->setSystemButton(m_titleBar->maximizeButton(), SystemButtonType::Maximize);
    helper->setSystemButton(m_titleBar->closeButton(), SystemButtonType::Close);
#endif
    helper->setHitTestVisible(mb);  // IMPORTANT!
    setWindowTitle(tr(WINDOW_TITLE));
    resize(WINDOW_WIDTH, WINDOW_HEIGH);
}

void MainWindow::initAppBar() {
    QLabel *label = new QLabel("APP");
    label->setAttribute(Qt::WA_TranslucentBackground);
    label->setForegroundRole(QPalette::Foreground);
    label->setContentsMargins(6, 0, 0, 0);

    QPalette palette = label->palette();
    palette.setColor(label->foregroundRole(), Qt::white);
    label->setPalette(palette);
    label->setFont(QFont("Roboto", 18, QFont::Normal));

    QtMaterialIconButton *button = new QtMaterialIconButton(QtMaterialTheme::icon("navigation", "menu"));
    button->setIconSize(QSize(24, 24));
    button->setColor(Qt::white);
    button->setFixedWidth(42);
    button->setCheckable(true);
    connect(button, &QtMaterialIconButton::clicked, this, [this]() { this->m_drawer->openDrawer(); });
    m_appBar->appBarLayout()->addWidget(button);
    m_appBar->appBarLayout()->addWidget(label);
    m_appBar->appBarLayout()->addStretch();
}

void MainWindow::initDrawer() {
    m_drawer->setParent(m_canvas);
    m_drawer->setClickOutsideToClose(true);
    m_drawer->setOverlayMode(true);

    //
    QVBoxLayout *drawerLayout = new QVBoxLayout;
    m_drawer->setDrawerLayout(drawerLayout);

    QVector<QString> labels = {
        "Motion", "Style", "Layout", "Components", "Patterns", "Growth & communications", "Usability", "Platforms", "Resources"};

    QVector<QString>::iterator it;
    for (it = labels.begin(); it != labels.end(); ++it) {
        QLabel *label = new QLabel(*it);
        label->setMinimumHeight(30);
        label->setFont(QFont("Roboto", 10, QFont::Medium));
        drawerLayout->addWidget(label);
    }

    drawerLayout->addStretch(3);
    m_drawer->setContentsMargins(10, 0, 0, 0);

    drawerLayout->addWidget(new QPushButton(tr("click me")));
}