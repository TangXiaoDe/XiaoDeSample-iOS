#  BasicModuleTemplate
* 基本模块划分模板 

```
README.md
Assets.xcassets
Resource
    Document
    Picture
    Audio
    Video
SupportingFile
    Info.plist
    xxxPrefixHeader.pch
    xxx-Bridging-Header.h
    LaunchScreen.storyboard
    Main.storyboard
    InfoPlist.strings    
    Localizable.strings
Source
    Library
    Config
    Util
    Module
        ---CommonProjectModule---
        Common
            Root
            Base
            Launch
            Advert
        ---ProjectModule---
        Main
        Mine
        Setting
        Test

```

* 部分配置
```
xxx.strings配置
1. Project -> xxx -> Info -> Localizations -> Add Language；
2. xxx.strings右侧Localize，添加需要实现的多语言；

xxxPrefixHeader.pch配置
1. Target -> xxx -> Build Settings -> Prefix Header ->
2.  

xxx-Bridging-Header.h配置


```


