//
//  AchievementsViewController.swift
//  resumeApp
//
//  Created by Alexandre  Vassinievski on 23/01/2018.
//  Copyright © 2018 Vassini. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {

  @IBOutlet weak var tableview: UITableView!
  @IBOutlet weak var headerImage: UIImageView!
  @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var navBar: UIView!
  
  var headerHeight: CGFloat = 200.0
  var headerMultiplier: CGFloat = 0.2
  var model = AchievementsModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableview.delegate = self
    tableview.dataSource = self
    tableview.register(UINib(nibName: "AchievementTableViewCell", bundle: nil), forCellReuseIdentifier: "AchievementTableViewCell")
    
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    setupParalaxHeader()
    setupNavBar()
  }
  
  func setupParalaxHeader() {
    headerHeight = self.view.frame.height * headerMultiplier
    headerHeightConstraint.constant = headerHeight
    tableview.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
    tableview.contentOffset.y = -(headerHeight)
  }
  
  func setupNavBar() {
    navBar.layer.shadowColor = UIColor.black.cgColor
    navBar.layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
    navBar.layer.shadowRadius = 0.2
    navBar.layer.shadowOpacity = 0.9
    navBar.alpha = 0.0
  }
  
}


extension AchievementsViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.achievements.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementTableViewCell", for: indexPath) as! AchievementTableViewCell
    cell.nameLabel.text = model.achievements[indexPath.row].name
    cell.descriptionLabel.text = model.achievements[indexPath.row].description
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

}

extension AchievementsViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let offset = scrollView.contentOffset.y + headerHeight
    if offset < headerHeight {
      headerHeightConstraint.constant = headerHeight - offset
      navBar.alpha = offset / (headerHeight - navBar.frame.height)
    }
    self.view.layoutIfNeeded()
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    
}
  
}
