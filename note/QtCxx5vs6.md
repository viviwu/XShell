
### Qt5vsQt6 Api

'''
#if (QT_VERSION <= QT_VERSION_CHECK(6, 0, 0))
            const QStringList columnStrings = lineData.split('\t', QString::SkipEmptyParts);
#else
            const QStringList columnStrings = lineData.split('\t', Qt::SkipEmptyParts);
#endif
'''

