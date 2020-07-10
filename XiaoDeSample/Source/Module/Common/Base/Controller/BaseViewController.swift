//
//  BaseViewController.swift
//  XiaoDeSample
//
//  Created by 小唐 on 2020/5/25.
//  Copyright © 2020 XiaoDeStudio. All rights reserved.
//
//  项目中的控制器基类

import UIKit

/// 页面显示状态
typealias PageShowStatus = PageContentType
typealias PageShowContent = PageContentType
/// 页面内容类型 —— 兼容通常情况，即默认为normal
enum PageContentType
{
    /// 什么都不显示，默认显示
    case nothing
    /// 待开放/未上线
    case tobeOpened
    /// 加载中
    case loading
    /// 错误
    case error
    /// 内容为空(加载结果内容为空)
    case empty
    /// 正常显示
    case normal
    /// 自定义
    case custom
}

/// 页面加载视图协议
protocol PageLoadingView: UIView {
    func startLoading() -> Void
    func stopLoading() -> Void
}
/// 错误视图协议 —— 应该是有重新加载的按钮或事件
protocol PageErrorView: UIView {
    var reloadBtn: UIButton { get }
}


class BaseViewController: UIViewController
{

    /// 当前界面是否正在展示
    var isAppearing: Bool = false
    /// 显示次数
    var appearTime: Int = 0
    
    var contentType: PageContentType = PageContentType.normal {
        didSet {
            self.content_Container.isHidden = contentType == .normal
            self.content_nothingView.isHidden = contentType != .nothing
            self.content_tobeOpenedView.isHidden = contentType != .tobeOpened
            self.content_loadingView.isHidden = contentType != .loading
            self.content_emptyView.isHidden = contentType != .empty
            self.content_errorView.isHidden = contentType != .error
            self.content_customView.isHidden = contentType != .custom
            if contentType == .loading {
                self.content_loadingView.startLoading()
            } else {
                self.content_loadingView.stopLoading()
            }
        }
    }
    /// 内容状态容器
    let content_Container: UIView = UIView.init()
    /// 容器子控件，使用var表示子类可更改，全部使用默认视图
    var content_nothingView: UIView = PageDefaultNothingView.init()
    var content_tobeOpenedView: UIView = PageDefaultTobeOpenedView.init()
    var content_loadingView: PageLoadingView = PageDefaultLoadingView.init()
    var content_emptyView: UIView = PageDefaultEmptyView.init()
    var content_errorView: PageErrorView = PageDefaultErrorView.init()
    var content_customView: UIView = UIView.init()
    
    /// 是否选中，默认选中，主要用于多列表时的切换选中处理
    var isSelected: Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColor.pageBg
        // 容器处理
        self.setupContentContainerAsDefault()
        self.contentType = .normal
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isAppearing = true
        self.appearTime += 1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.isAppearing = false
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.bringSubviewToFront(self.content_Container)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    /// 容器默认配置
    fileprivate func setupContentContainerAsDefault() -> Void {
        self.view.addSubview(self.content_Container)
        self.content_Container.isHidden = true
        self.content_Container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        // childs
        let childs: [UIView] = [self.content_nothingView, self.content_tobeOpenedView, self.content_loadingView, self.content_emptyView, self.content_errorView, self.content_customView]
        for childView in childs {
            self.content_Container.addSubview(childView)
            childView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
    }

    // 开始加载，子类可重写
    @objc dynamic func startLoading() -> Void {
        self.showLoading()
    }
    @objc dynamic func stopLoading() -> Void {
        self.hiddenLoading()
    }
    
    func showLoading() -> Void {
        self.contentType = .loading
    }
    func hiddenLoading(for type: PageContentType = .normal) -> Void {
        self.contentType = type
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseViewController
{
    /// navpush子界面
    func enterPageVC(_ pageVC: UIViewController) -> Void {
        self.navigationController?.pushViewController(pageVC, animated: true)
    }
    /// pushi进入子界面
    func pushEnterPage(_ pageVC: UIViewController) -> Void {
        self.navigationController?.pushViewController(pageVC, animated: true)
    }
    
}
