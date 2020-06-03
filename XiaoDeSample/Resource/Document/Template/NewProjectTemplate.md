#  NewProjectTemplate
* 新项目配置模板

#### 新建项目模板

1. 基本模块划分；(参考模板Resource/Document/BasicModuleTemplate.md)
2. PrefixHeader创建与配置： ```$(PRODUCT_NAME)/SupportingFile/$(PRODUCT_NAME)PrefixHeader.pch```
3. Bridging-Header创建与配置：```$(PRODUCT_NAME)/SupportingFile/$(PRODUCT_NAME)-Bridging-Header.h```
4. 多语言配置并添加InfoPlist.strings、Localizable.strings：```PROJECT -> XXX -> Info -> Localizations```
4. 添加本项目git忽略配置；(参考模板Resource/Document/GitIgnoreTemplate.md)
5. 添加基本Pod三方库；(参考模板Resource/Document/PodfileTemplate.md)
6. 添加swiftlint及相关配置；(参考模板Resource/Document/SwiftLintTemplate.md)
7. 添加Config模块；
8. 添加AppUtil模块(AppColor、AppFont、AppImage、AppNotification)；
9. 添加版本管理模块、账号管理模块(可实现多账户切换)、网络请求模块、数据库模块等等；
9. 添加Root模块和Main模块；





