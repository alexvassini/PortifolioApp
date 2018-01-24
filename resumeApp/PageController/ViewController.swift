//
//  ViewController.swift
//  resumeApp
//
//  Created by Alexandre  Vassinievski on 23/01/2018.
//  Copyright © 2018 Vassini. All rights reserved.
//

import UIKit
import CHIPageControl

class ViewController: UIViewController {
  
  private lazy var viewControllersArray: [UIViewController] = {
    return [self.newViewController("Bio"),
            self.newViewController("Skills"),
            self.newViewController("Projects"),
            self.newViewController("Achievements")]
  }()
  
  @IBOutlet weak var pageControl: CHIPageControlJalapeno!
  
  private let numberOfPages = 4
  private var currentView = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let pageView = self.childViewControllers.first as! UIPageViewController
    pageView.dataSource = self
    pageControl.set(progress: 0, animated: false)
    
//    //Get each UIScrollView inside UIPageViewController
    let scrollView = pageView.view.subviews.filter { $0 is UIScrollView }.first as! UIScrollView
    scrollView.delegate = self
    
//    for v in pageView.view.subviews{
//      if v.isKindOfClass(UIScrollView){
//        (v as UIScrollView).delegate = self
//      }
//    }

    if let firstViewController = viewControllersArray.first {
      pageView.setViewControllers([firstViewController],
                         direction: .forward,
                         animated: true,
                         completion: nil)
    }
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
 
  private func newViewController(_ name: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil) .
      instantiateViewController(withIdentifier: "\(name)")
  }
  
}

extension ViewController : UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = viewControllersArray.index(of: viewController) else {
      return nil
    }
    self.currentView = viewControllerIndex
    
    let previousIndex = viewControllerIndex - 1
    
    guard previousIndex >= 0 else {
      return nil
    }
    
    guard viewControllersArray.count > previousIndex else {
      return nil
    }
    return viewControllersArray[previousIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = viewControllersArray.index(of: viewController) else {
      return nil
    }
    self.currentView = viewControllerIndex
    let nextIndex = viewControllerIndex + 1
    let orderedViewControllersCount = viewControllersArray.count
    
    guard orderedViewControllersCount != nextIndex else {
      return nil
    }
    guard orderedViewControllersCount > nextIndex else {
      return nil
    }
    return viewControllersArray[nextIndex]
  }

}

extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let total = scrollView.bounds.width
    let offset = scrollView.contentOffset.x
    let percent = Double(offset / total) - 1
    let progress = percent + Double(self.currentView)
    self.pageControl.progress = progress
  }
}
