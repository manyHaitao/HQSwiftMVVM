//
//  HQAViewController.swift
//  HQSwiftMVVM
//
//  Created by 王红庆 on 2017/7/5.
//  Copyright © 2017年 王红庆. All rights reserved.
//

import UIKit

fileprivate let HQACellId = "HQACellId"

class HQAViewController: HQBaseViewController {
    
    fileprivate lazy var listViewModel = HQStatusListViewModel()

    /// 加载数据
    override func loadData() {
        listViewModel.loadStatus(pullup: self.isPullup) { (isSuccess, shouldRefresh) in
//            print("最后一条微博数据是 \(self.listViewModel.statusList.last?.text ?? "")")
            
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            
            if shouldRefresh {
                self.tableView?.reloadData()
            }
        }
    }
    
    @objc fileprivate func showFriends() {
        
        HQNetWorkManager.shared.userAccount.token = "aaa"
        
//        let vc = HQDemoViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - tableViewDataSource
extension HQAViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.statusList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HQACellId, for: indexPath) as! HQACell
        
        let viewModel = listViewModel.statusList[indexPath.row]
        
        cell.viewModel = viewModel
        
        return cell
    }
}

// MARK: - 设置界面
extension HQAViewController {
    
    /// 重写父类的方法
    override func setupTableView() {
        super.setupTableView()
        
        navItem.leftBarButtonItem = UIBarButtonItem(hq_title: "好友", target: self, action: #selector(showFriends))
        tableView?.register(HQACell.classForCoder(), forCellReuseIdentifier: HQACellId)
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 400
        tableView?.separatorStyle = .none
        
        setupNavTitle()
    }
    
    /// 设置导航栏标题演示
    fileprivate func setupNavTitle() {
        
        let title = HQNetWorkManager.shared.userAccount.screen_name
        
        let btn = HQTitleButton(title: title)
        
        navItem.titleView = btn
        
        btn.addTarget(self, action: #selector(clickTitleButton), for: .touchUpInside)
    }

    @objc fileprivate func clickTitleButton(btn: UIButton) {

        btn.isSelected = !btn.isSelected
    }
}
