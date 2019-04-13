//
//  PageViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate,UIPageViewControllerDataSource {
//     Code retrieved from https://www.youtube.com/watch?v=RVAtqQ8CyKM - this has been altered to have users swipe between promtps
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerindex = orderedViewControllers.index(of: viewController) else{
            return nil
        }
        let previousIndex = viewControllerindex  - 1
        
        guard previousIndex >= 0 else {
            //            return orderedViewControllers.last
            return nil
        }
        guard orderedViewControllers.count > previousIndex  else {
            
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerindex = orderedViewControllers.index(of: viewController) else{
            return nil
        }
        let nextIndex = viewControllerindex  + 1
        
        guard orderedViewControllers.count != nextIndex else {
            //            return orderedViewControllers.first
            return nil
        }
        guard orderedViewControllers.count > nextIndex  else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "sbListen"),
                self.newVc(viewController:  "sbLook"),
                self.newVc(viewController: "sbTouch"),
                self.newVc(viewController: "sbSmell")]
    }()

     var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstViewController = orderedViewControllers.first{
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        self.delegate = self
        configurePageControl()

        // Do any additional setup after loading the view.
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect (x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.blue
        pageControl.pageIndicatorTintColor = UIColor(red: 235/255, green: 246/255, blue: 255/255, alpha: 0.5)
        pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }


}
