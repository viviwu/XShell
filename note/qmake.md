### Qt/C++ 项目的 .pro 文件是一个文本文件，用于描述项目的配置信息和构建规则。下面是一些常用的配置项：

1. `TARGET` ：定义项目的名称，这个名称将用于生成最终的可执行文件名。

2. `TEMPLATE` ：定义项目的类型，可以是应用程序（`app`）、静态库（`lib`）、动态库（`dll`）等。

3. `CONFIG` ：定义项目的编译选项，如 `debug`、`release`、`debug_and_release` 等。

4. `QT` ：定义使用的 Qt 模块和版本号，例如：

   ````
   QT += core gui
   QT += widgets
   QT += 5.15.2
   ```

5. `DEFINES` ：定义预处理宏，例如：

   ````
   DEFINES += MY_DEFINE
   ```

6. `INCLUDEPATH` ：定义头文件搜索路径，例如：

   ````
   INCLUDEPATH += /usr/local/include
   ```

7. `LIBS` ：定义链接的库文件，例如：

   ````
   LIBS += -L/usr/local/lib -lmylib
   ```

8. `SOURCES` ：定义源代码文件，例如：

   ````
   SOURCES += main.cpp myclass.cpp9. `HEADERS` ：定义头文件，例如：

   ```
   HEADERS += myclass.h
   ````

9. `FORMS` ：定义 UI 文件，即 Qt Designer 设计的界面文件，例如：

    ```
    FORMS += mainwindow.ui
    ```

10. `RESOURCES` ：定义资源文件，例如：

    ```
    RESOURCES += myresources.qrc
    ```

11. `DESTDIR` ：定义输出目录（也称为目标目录），即编译结果的存放位置，默认为当前目录下的 release 或 debug 子目录。

12. `QMAKE_CXXFLAGS` ：定义编译选项，例如：

    ```
    QMAKE_CXXFLAGS += -std=c++11
    ```

13. `QMAKE_LFLAGS` ：定义链接选项，例如：

    ```
    QMAKE_LFLAGS += -Wl,-rpath=/usr/local/lib
    ```

14. `QMAKE_AUTOUIC` ：自动将 UI 文件转换为对应的 C++ 代码，例如：

    ```
    QT += widgets
    SOURCES += main.cpp mainwindow.cpp
    HEADERS += mainwindow.h
    FORMS += mainwindow.ui
    QMAKE_AUTOUIC = 1
    ```

15. `QMAKE_AUTOMOC` ：自动将包含 Q_OBJECT 宏的头文件转换为对应的 moc 文件，例如：

    ```
    QT += core
    SOURCES += main.cpp myclass.cpp
    HEADERS += myclass.h
    QMAKE_AUTOMOC = 1
    ```

16. `QMAKE_AUTORCC` ：自动将资源文件转换为对应的 C++ 代码，例如：

    ```
    QT += core
    SOURCES += main.cpp myclass.cpp
    HEADERS += myclass.h
    RESOURCES += myresources.qrc
    QMAKE_AUTORCC = 1
    ```

17. `CONFIG` ：定义项目的配置，如 `debug`、`release`、`static`、`shared` 等。

18. `DEF_FILE` ：在 Windows 平台上，定义生成的动态库的 DEF 文件，例如：

    ```
    win32:DEF_FILE += mylib.def
    ```

19. `QMAKE_CFLAGS` ：定义 C 编译选项，例如：

    ```
    QMAKE_CFLAGS += -Wall
    ```

20. `QMAKE_CXX` ：定义 C++ 编译器，例如：

    ```
    QMAKE_CXX = g++-8
    ```

这些选项可以帮助开发者更好地配置和管理 Qt/C++ 项目，提高开发效率和代码质量。Qt 的官方文档中还有更多关于 .pro 文件的详细介绍和使用方法，建议开发者仔细阅读。
***
***
### Qt 的构建系统 qmake 提供了一些内置的宏，可以用在项目配置文件 *.pro 中，常见的内置宏包括：

1. `$$PWD`：表示当前项目文件所在的路径。

2. `$$OUT_PWD`：表示当前项目输出文件所在的路径。

3. `$$QMAKE_CXX`：表示当前使用的 C++ 编译器。

4. `$$QMAKE_CC`：表示当前使用的 C 编译器。

5. `$$QMAKE_TARGET`：表示当前项目的目标文件名。

6. `$$QMAKE_OBJECTS_DIR`：表示当前项目生成的中间文件所在的目录。

7. `$$QMAKE_MOC`：表示当前使用的 moc 工具的路径。

8. `$$QMAKE_UIC`：表示当前使用的 uic 工具的路径。

9. `$$QMAKE_RCC`：表示当前使用的 rcc 工具的路径。

10. `$$QMAKE_LFLAGS`：表示当前链接器使用的选项。

11. `$$QMAKE_CFLAGS`：表示当前编译器使用的选项。

12. `$$QMAKE_INCDIR`：表示当前项目的头文件搜索路径。

13. `$$QMAKE_LIBDIR`：表示当前项目的库文件搜索路径。

14. `$$QMAKE_VERSION`：表示当前 qmake 的版本号。

### 这些内置宏可以在项目配置文件 *.pro 中使用，以方便在不同的平台和环境下进行项目的配置和编译。
***
***
### QtCreator 配置代码片段 可能用到的系统宏参数：
```
自动获取当前文件名称：%{CurrentDocument:FileName}
自动获取当前时间：%{CurrentDate:yyyy-MM-dd}  %{CurrentTime:hh:mm}
自动获取当前项目名称：%{CurrentProject:Name}
%{#:}
%{Config:DefaultProjectDirectory}
%{Config:LastFileDialogDirectory}
%{Cpp:LicenseTemplate}
%{Cpp:LicenseTemplatePath:FileBaseName}
%{Cpp:LicenseTemplatePath:FileName}
%{Cpp:LicenseTemplatePath:FilePath}
%{Cpp:LicenseTemplatePath:NativeFilePath}
%{Cpp:LicenseTemplatePath:NativePath}
%{Cpp:LicenseTemplatePath:Path}
%{CurrentBuild:Env:}
%{CurrentBuild:Name}
%{CurrentBuild:Type}
%{CurrentDate:}
%{CurrentDate:ISO}
%{CurrentDate:Locale}
%{CurrentDate:RFC}
%{CurrentDevice:HostAddress}
%{CurrentDevice:PrivateKeyFile}
%{CurrentDevice:SshPort}
%{CurrentDevice:UserName}
%{CurrentDocument:Column}
%{CurrentDocument:ColumnCount}
%{CurrentDocument:FileBaseName}
%{CurrentDocument:FileName}
%{CurrentDocument:FilePath}
%{CurrentDocument:FontSize}
%{CurrentDocument:NativeFilePath}
%{CurrentDocument:NativePath}
%{CurrentDocument:Path}
%{CurrentDocument:Row}
%{CurrentDocument:RowCount}
%{CurrentDocument:Selection}
%{CurrentDocument:XPos}
%{CurrentDocument:YPos}
%{CurrentKit:FileSystemName}
%{CurrentKit:Id}
%{CurrentKit:Name}
%{CurrentProject:BuildPath}
%{CurrentProject:FileBaseName}
%{CurrentProject:FileName}
%{CurrentProject:FilePath}
%{CurrentProject:Name}
%{CurrentProject:NativeFilePath}
%{CurrentProject:NativePath}
%{CurrentProject:Path}
%{CurrentProject:QT_HOST_BINS}
%{CurrentProject:VcsName}
%{CurrentProject:VcsTopLevelPath}
%{CurrentProject:VcsTopic}
%{CurrentRun:Executable:FileBaseName}
%{CurrentRun:Executable:FileName}
%{CurrentRun:Executable:FilePath}
%{CurrentRun:Executable:NativeFilePath}
%{CurrentRun:Executable:NativePath}
%{CurrentRun:Executable:Path}
%{CurrentRun:Name}
%{CurrentTime:}
%{CurrentTime:ISO}
%{CurrentTime:Locale}
%{CurrentTime:RFC}
%{Env:}
%{HostOs:ExecutableSuffix}
%{HostOs:PathListSeparator}
%{HostOs:isLinux}
%{HostOs:isOSX}
%{HostOs:isUnix}
%{HostOs:isWindows}
%{IDE:ResourcePath}
%{JS:}
%{Session:FileBaseName}
%{Session:FileName}
%{Session:FilePath}
%{Session:Name}
%{Session:NativeFilePath}
%{Session:NativePath}
%{Session:Path}
%{UUID}
```
***
***
