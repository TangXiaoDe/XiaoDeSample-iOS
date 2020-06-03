# RenameProjectTemplate
* 重命名项目流程模板

```
```

#### 项目重命名流程

项目重命名流程

$(SRCROOT)
$(PRODUCT_NAME)   - Display Name   
$(PRODUCT_BUNDLE_IDENTIFIER)
$(DEVELOPMENT_LANGUAGE)
$(EXECUTABLE_NAME)
$(SWIFT_MODULE_NAME)



0. 包名修改、签名修改并使项目能成功运行；
1. 子文件夹重命名：项目下的XXXProject、XXXProjectTests、XXXProjectUITests更改为NewXXX；
2. 项目重命名：Xcode下左侧项目名XXX修改为NewXXX(直接Enter可修改)；
3. Pod: 移除Pods相关文件 -> Podfile修改 -> 执行pod install；
4. 源码文件索引更新：Xcode左侧的源码文件索引移除并重新引入；
5. Tests/UITests更新：文件名、类名、注释部分更新；
6. Info.plist文件配置：Taret -> Build Settings -> Info.plist File：(参考$(SRCROOT)/$(PRODUCT_NAME)/SupportingFile/Info.plist)
7. Tests/UITests中Info.plist配置：Target -> Tests/UITests -> Build Settings -> Info.plist File：(参考$(PRODUCT_NAME)Tests/Info.plist）
8. Tests/UITests中Product Bundle Identifier配置：待确定
9. PrefixHeader：Taret -> Build Settings -> Prefix Header：(参考$(PRODUCT_NAME)/SupportingFile/$(PRODUCT_NAME)PrefixHeader.pch)
10. BridgingHeader：Taret -> Build Settings -> Objective-C Bridging Header：(参考$(PRODUCT_NAME)/SupportingFile/$(PRODUCT_NAME)-Bridging-Header.h)
11. Scheme更新；
12. Objective-C Generated Interface Header Name: $(SWIFT_MODULE_NAME)-Swift.h
13. OC文件引入的XXXProject-Swift.h更新为NewXXXProject-Swift.h；
14. 项目里搜索XXXProject/XXXTarget，酌情处理；
15. Targets -> AGMTests、AGMUITests、原来的包名、
16. .swiftlint.yml配置文件更新；
17. 其他调整使项目能正常运行；
18. 后续调整：授权文案更新、项目相关配置、服务器配置等等、ReadMe.md、entitlements、 部分命名、










