//
//  ViewController.swift
//  MacroNeedsCalc
//
//  Created by RYAN CHRISTENSEN on 3/15/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var sexSelector: UISegmentedControl!
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var weightTextField: UITextField!
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var heightPicker: UIPickerView!
  let numberFormatter = NSNumberFormatter()
  var heightView : UIView!
  var activityView : UIView!

  let heigthFeet = ["4","5","6","7"]
  let feet = ["Feet"]
  let inches = ["Inches"]
  let heightInches = ["0","1","2","3","4","5","6","7","8","9","10","11"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var heightViews = NSBundle.mainBundle().loadNibNamed("HeightPicker", owner: self, options: nil)
    var activityViews = NSBundle.mainBundle().loadNibNamed("ActivityFactorPicker", owner: self, options: nil)
    self.activityView = activityViews.first as UIView
    self.heightView = heightViews.first as UIView
    self.view.addSubview(heightView)
    
    self.heightView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
    self.activityView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
    
    self.heightPicker.dataSource = self
    self.heightPicker.delegate = self
//    self.heightPicker.alpha = 0
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func segmentedSexSelector(sender: AnyObject) {
    switch sexSelector.selectedSegmentIndex{
    case 0:
      println("female")
    case 1:
      println("male")
    default:
      println("select female or male")
      break;
    }
  }
  
  @IBAction func getHeightPickerPressed(sender: AnyObject) {
    UIView.animateWithDuration(0.6, animations: { () -> Void in
      self.heightView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
      //self.heightPicker.alpha = 1
    }) { (finished) -> Void in
      
    }
  }
  
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 4
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0 {
      return self.heigthFeet.count
    } else if component == 1 {
      return self.feet.count
    } else if component == 2{
      return self.heightInches.count
    } else {
      return self.inches.count
    }
  }
  
  func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
    
    let heightFeetPickerLabel = UILabel()
    let heightInchespickerLabel = UILabel()
    let feetPickerLabel = UILabel()
    let inchesPickerLabel = UILabel()
    let titleFeetData = feet.first
    let titleInchesData = inches.first
    let titleHeightFeet = heigthFeet[row]
    let titleHeightInches = heightInches[row]
    
    var feetTitle = NSAttributedString(string: titleFeetData!, attributes: [NSFontAttributeName: UIFont(name: "Cochin", size: 10.0)!, NSForegroundColorAttributeName:UIColor.brownColor()])
    var inchesTitle = NSAttributedString(string: titleInchesData!, attributes: [NSFontAttributeName: UIFont(name: "Cochin", size: 10.0)!, NSForegroundColorAttributeName:UIColor.brownColor()])
    var heightFeetTitle = NSAttributedString(string: titleHeightFeet, attributes: [NSFontAttributeName: UIFont(name: "Cochin", size: 18.0)!, NSForegroundColorAttributeName:UIColor.brownColor()])
    var heightInchesTitle = NSAttributedString(string: titleHeightInches, attributes: [NSFontAttributeName: UIFont(name: "Cochin", size: 18.0)!, NSForegroundColorAttributeName:UIColor.brownColor()])
    
    heightFeetPickerLabel.attributedText = heightFeetTitle
    heightInchespickerLabel.attributedText = heightInchesTitle
    feetPickerLabel.attributedText = feetTitle
    inchesPickerLabel.attributedText = inchesTitle
    
    if component == 0 {
      pickerView.numberOfRowsInComponent(self.heigthFeet.count)
      return heightFeetPickerLabel
    } else if component == 1 {
      pickerView.numberOfRowsInComponent(self.feet.count)
      return feetPickerLabel
    } else if component == 2 {
      pickerView.numberOfRowsInComponent(self.heightInches.count)
      return heightInchespickerLabel
    } else {
      pickerView.numberOfRowsInComponent(self.inches.count)
      return inchesPickerLabel
    }
  }
  
//  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
//    if component == 0 {
//      return self.heigthFeet[row]
//    } else if component == 1 {
//      return self.feet[row]
//    } else if component == 2{
//      return self.heightInches[row]
//    } else {
//      return self.inches[row]
//    }
//  }
  
  func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 36.0
  }
  
  func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    return 60
  }
  
}

