//
//  ProjectsViewController.swift
//  resumeApp
//
//  Created by Alexandre  Vassinievski on 23/01/2018.
//  Copyright © 2018 Vassini. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
  
  @IBOutlet weak var tableview: UITableView!
  @IBOutlet weak var headerImage: UIImageView!
  @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
  
  var previousYOffset:CGFloat = -20.0
  //var headerHeight:CGFloat = 160
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableview.delegate = self
    tableview.dataSource = self
    tableview.register(UINib(nibName: "ProjectTableViewCell", bundle: nil), forCellReuseIdentifier: "ProjectTableViewCell")
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}


extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell", for: indexPath) as! ProjectTableViewCell
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 226 * UIScreen.main.bounds.size.height / 667
  }
  
}

extension ProjectsViewController: UIScrollViewDelegate {

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let yOffset = scrollView.contentOffset.y
    let diff = yOffset - previousYOffset
    previousYOffset = yOffset
    let headerHeight = headerHeightConstraint.constant - diff
    if scrollView.contentOffset.y < 80 {
      if headerHeight < 60 {
        headerHeightConstraint.constant = 60
      }
      else {headerHeightConstraint.constant = headerHeight}
    }
    
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
   
  }

}
