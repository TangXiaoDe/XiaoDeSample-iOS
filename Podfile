platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

# 通过pod 使用三方库时,必须指定明确的版本号!方便同期开发的用户使用相同的三方,方便后续更新!
# 编辑该文件时,必须使用专业的编辑器.不允许使用记事本编辑,避免导致的乱码错误引发的问题.

target 'XiaoDeSample' do

source 'https://github.com/CocoaPods/Specs.git'
  
# Swift 
pod 'SnapKit', '5.0.1'                    # UI布局组件, 5.0.0的不支持iOS9；
pod 'Alamofire'                    # 网络请求；'5.2'
pod 'Kingfisher'                # 图片下载缓存转码等，5.0.0及以上的不支持iOS9；'5.14.0'

pod 'ObjectMapper'                # 数据转模型 '4.2.0'
pod 'RealmSwift'                # 本地数据库
pod 'ReachabilitySwift'          # 网络连接性检查
pod 'MarkdownView'               # markdown 渲染器基于 webview
pod 'SwiftLint'                 # SwiftLint 代码规范

# 公司私有组件库
#pod 'ChainOneKit-Swift', :git => 'https://github.com/CommunityChain/ChainOneKit-Swift.git', :tag => '0.0.9.1'

# 个人公开组件库
pod 'XiaoDeKit-Swift', :git => 'https://github.com/TangXiaoDe/XiaoDeKit-Swift.git', :tag => '0.0.11.1'

# Objective-C
pod 'YYKit', '1.0.9'                      # iOS 组件
pod 'MJRefresh', '3.2.0'                  # 上下拉刷新


  target 'XiaoDeSampleTests' do            # 测试相关三方库
    inherit! :search_paths
    pod 'Nimble', '8.0.1'                   # 断言
    pod 'Mockingjay', '2.0.1'               # 网络请求模拟
    
  end

end
