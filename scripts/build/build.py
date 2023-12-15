import subprocess
import os
import subprocess


# prepare installation : node.js python

def check_create_dmg():
    try:
        # 检查 create-dmg 是否可用
        subprocess.run(["create-dmg", "--version"], check=True)
        print("create-dmg 已安装")
    except FileNotFoundError:
        # 如果 create-dmg 不可用，则安装它
        print("create-dmg 未安装，开始安装...")
        try:
            # 使用 sudo 权限安装 create-dmg
            subprocess.run(["sudo", "npm", "install",
                           "--global", "create-dmg"])
            print("create-dmg 安装完成")
        except subprocess.CalledProcessError:
            print("安装 create-dmg 时出现错误")


def build_and_package():
    app_name = "karl-app"
    qt_path = "/Users/karl/Qt/6.6.1/macos"
    build_dir = "installer"
    # developer_id = "Developer ID Application: Your Name"

    # 检查create-dmg是否安装
    check_create_dmg()
    # 获取当前工作目录
    current_dir = os.getcwd()

    # 构建目标目录的路径
    target_dir = os.path.join(current_dir, build_dir)

    # 如果目标目录不存在则创建
    if os.path.exists(target_dir):
        subprocess.run(["rm", "-rf", target_dir])  # 清理之前的构建， 文件夹也会删掉

    os.makedirs(target_dir)

    # 切换到目标目录
    os.chdir(target_dir)

    # 执行CMake
    subprocess.run(["cmake", "-G", "Unix Makefiles",
                   "-DQTDIR=" + qt_path,
                    "-DK_MACOS_UNIVERSAL=ON",
                    "-DFRAMELESSHELPER_BUILD_STATIC=ON",
                    "-DCMAKE_BUILD_TYPE=Release",
                    ".."])

    # 编译应用程序
    subprocess.run("make")

    # 创建安装包
    os.chdir(target_dir + "/bin/")
    subprocess.run([f"{qt_path}/bin/macdeployqt", f"{app_name}.app"])
    subprocess.run([f"create-dmg", f"{app_name}.app", "./"])

    os.chdir("..")
    # # 签名应用程序
    # subprocess.run(["codesign", "--deep", "--force", "--verbose",
    #                "--sign", f"{developer_id}", f"{app_name}.app"])

    # # 公证应用程序
    # subprocess.run(["xcrun", "stapler", "staple", f"{app_name}.app"])

    os.chdir(current_dir)


if __name__ == "__main__":
    build_and_package()
