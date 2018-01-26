//
//  BioViewController.swift
//  resumeApp
//
//  Created by Alexandre  Vassinievski on 23/01/2018.
//  Copyright © 2018 Vassini. All rights reserved.
//

import UIKit

class BioViewController: UIViewController {
  
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBar: UIView!
    
    var headerHeight: CGFloat = 200.0
    var headerMultiplier: CGFloat = 0.4
  
    override func viewDidLoad() {
      super.viewDidLoad()
      scrollView.delegate = self
      // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      setupParalaxHeader()
      setupNavBar()
    }
    
    func setupParalaxHeader() {
      headerHeight = self.view.frame.height * headerMultiplier
      headerHeightConstraint.constant = headerHeight
      scrollView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
      scrollView.contentOffset.y = -(headerHeight)
    }
    
    func setupNavBar() {
      navBar.layer.shadowColor = UIColor.black.cgColor
      navBar.layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
      navBar.layer.shadowRadius = 0.2
      navBar.layer.shadowOpacity = 0.9
      navBar.alpha = 0.0
    }
    
  }
  
  extension BioViewController: UIScrollViewDelegate {
    
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

