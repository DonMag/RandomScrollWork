//
//  ScheduleViewController.swift
//  IBScratch
//
//  Created by Don Mag on 11/30/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
	
	let theScrollView: UIScrollView = {
		let v = UIScrollView()
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
		return v
	}()
	
	
	@IBAction func btnTap(_ sender: Any) {
		
		let alertController = UIAlertController(title: "Test", message: "This is a test", preferredStyle: .alert)
		
		let saveAction = UIAlertAction(title: "Save", style: .default, handler: {
			alert -> Void in
			
			let firstTextField = alertController.textFields![0] as UITextField
			let secondTextField = alertController.textFields![1] as UITextField
			
			print("firstName \(firstTextField.text), secondName \(secondTextField.text)")
		})
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
			(action : UIAlertAction!) -> Void in
			
		})
		
		alertController.addTextField { (textField : UITextField!) -> Void in
			textField.placeholder = "Enter First Name"
		}
		alertController.addTextField { (textField : UITextField!) -> Void in
			textField.placeholder = "Enter Second Name"
		}
		
		alertController.addAction(saveAction)
		alertController.addAction(cancelAction)

		self.present(alertController, animated: true, completion: nil)
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		view.addSubview(theScrollView)
		
		theScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120.0).isActive = true
		theScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120.0).isActive = true
		theScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0).isActive = true
		theScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0).isActive = true
		
		var lb = UILabel()
		
		let w = CGFloat(60)
		
		
		for _ in 1...1 {
			
			
			
			var theDays = ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			
			var theDates = Array(1...32)
			
			var vStr = "wkkvvwwwkkvvvwwkkvvwwvkkhvvvvkkh"

			var vDates = Array(vStr.characters)
			
			var theDayLabels = [UILabel]()
			var theDateLabels = [UILabel]()
			var theVacayLabels = [UILabel]()
			
			for i in 0..<theDates.count {
				
				lb = UILabel()
				lb.translatesAutoresizingMaskIntoConstraints = false
				lb.textAlignment = .center
				lb.text = "\(theDays[i])"
				lb.backgroundColor = UIColor(red: 0.9, green: 0.95, blue: 1.0, alpha: 1.0)
				lb.layer.borderWidth = 1.0
				lb.layer.borderColor = UIColor.blue.cgColor
				theScrollView.addSubview(lb)
				lb.widthAnchor.constraint(equalToConstant: w).isActive = true
				lb.heightAnchor.constraint(equalTo: lb.widthAnchor, constant: 0.0).isActive = true
				theDayLabels.append(lb)
				
				lb = UILabel()
				lb.translatesAutoresizingMaskIntoConstraints = false
				lb.textAlignment = .center
				lb.text = "\(theDates[i])"
				
				switch vDates[i] {
				case "w":
					lb.backgroundColor = .white
				case "k":
					lb.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
				case "h":
					lb.backgroundColor = .red
				default:
					lb.backgroundColor = .white
				}
				
				lb.layer.borderWidth = 1.0
				lb.layer.borderColor = UIColor.blue.cgColor
				theScrollView.addSubview(lb)
				lb.widthAnchor.constraint(equalToConstant: w).isActive = true
				lb.heightAnchor.constraint(equalTo: lb.widthAnchor, constant: 0.0).isActive = true
				theDateLabels.append(lb)
				
				lb = UILabel()
				lb.translatesAutoresizingMaskIntoConstraints = false
				lb.textAlignment = .center
				
				switch vDates[i] {
				case "w":
					lb.backgroundColor = .white
				case "k":
					lb.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
				case "v":
					lb.backgroundColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 1.0)
				case "h":
					lb.backgroundColor = .red
				default:
					lb.backgroundColor = .white
				}
				
				lb.text = ""
				lb.layer.borderWidth = 1.0
				lb.layer.borderColor = UIColor.blue.cgColor
				theScrollView.addSubview(lb)
				lb.widthAnchor.constraint(equalToConstant: w).isActive = true
				lb.heightAnchor.constraint(equalTo: lb.widthAnchor, constant: 0.0).isActive = true
				theVacayLabels.append(lb)
				
			}
			
			theDateLabels.last?.text = "1"
			
			var i = 0
			theDayLabels[i].leadingAnchor.constraint(equalTo: theScrollView.leadingAnchor, constant: 8.0).isActive = true
			theDayLabels[i].topAnchor.constraint(equalTo: theScrollView.topAnchor, constant: w).isActive = true
			
			theDateLabels[i].leadingAnchor.constraint(equalTo: theDayLabels[i].leadingAnchor, constant: 0.0).isActive = true
			theDateLabels[i].topAnchor.constraint(equalTo: theDayLabels[i].bottomAnchor, constant: -1.0).isActive = true
			
			theVacayLabels[i].leadingAnchor.constraint(equalTo: theDateLabels[i].leadingAnchor, constant: 0.0).isActive = true
			theVacayLabels[i].topAnchor.constraint(equalTo: theDateLabels[i].bottomAnchor, constant: -1.0).isActive = true
			
			for i in 1..<theDayLabels.count {
				
				theDayLabels[i].leadingAnchor.constraint(equalTo: theDayLabels[i - 1].trailingAnchor, constant: 0.0).isActive = true
				theDayLabels[i].topAnchor.constraint(equalTo: theDayLabels[0].topAnchor, constant: 0.0).isActive = true
				
				theDateLabels[i].leadingAnchor.constraint(equalTo: theDateLabels[i - 1].trailingAnchor, constant: 0.0).isActive = true
				theDateLabels[i].topAnchor.constraint(equalTo: theDateLabels[0].topAnchor, constant: 0.0).isActive = true
				
				theVacayLabels[i].leadingAnchor.constraint(equalTo: theVacayLabels[i - 1].trailingAnchor, constant: 0.0).isActive = true
				theVacayLabels[i].topAnchor.constraint(equalTo: theVacayLabels[0].topAnchor, constant: 0.0).isActive = true
				
			}
			
			i = theDayLabels.count - 1
			
			theDayLabels[i].trailingAnchor.constraint(equalTo: theScrollView.trailingAnchor, constant: -8.0).isActive = true
			theDateLabels[i].trailingAnchor.constraint(equalTo: theScrollView.trailingAnchor, constant: -8.0).isActive = true
			
		}
		
		
		for _ in 1...1 {
			
			
			
			var theDays = ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			theDays += ["F", "S", "S", "M", "T", "W", "T"]
			
			var theDates = Array(1...32)
			
			var vStr = "wkkvwwwwkkvvwwwkkvvvvvkkhvvvvkkh"
			
			var vDates = Array(vStr.characters)
			
			var theDayLabels = [UILabel]()
			var theDateLabels = [UILabel]()
			var theVacayLabels = [UILabel]()
			
			for i in 0..<theDates.count {
				
				lb = UILabel()
				lb.translatesAutoresizingMaskIntoConstraints = false
				lb.textAlignment = .center
				lb.text = "\(theDays[i])"
				lb.backgroundColor = UIColor(red: 0.9, green: 0.95, blue: 1.0, alpha: 1.0)
				lb.layer.borderWidth = 1.0
				lb.layer.borderColor = UIColor.blue.cgColor
				theScrollView.addSubview(lb)
				lb.widthAnchor.constraint(equalToConstant: w).isActive = true
				lb.heightAnchor.constraint(equalTo: lb.widthAnchor, constant: 0.0).isActive = true
				theDayLabels.append(lb)
				
				lb = UILabel()
				lb.translatesAutoresizingMaskIntoConstraints = false
				lb.textAlignment = .center
				lb.text = "\(theDates[i])"
				
				switch vDates[i] {
				case "w":
					lb.backgroundColor = .white
				case "k":
					lb.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
				case "h":
					lb.backgroundColor = .red
				default:
					lb.backgroundColor = .white
				}
				
				lb.layer.borderWidth = 1.0
				lb.layer.borderColor = UIColor.blue.cgColor
				theScrollView.addSubview(lb)
				lb.widthAnchor.constraint(equalToConstant: w).isActive = true
				lb.heightAnchor.constraint(equalTo: lb.widthAnchor, constant: 0.0).isActive = true
				theDateLabels.append(lb)
				
				lb = UILabel()
				lb.translatesAutoresizingMaskIntoConstraints = false
				lb.textAlignment = .center
				
				switch vDates[i] {
				case "w":
					lb.backgroundColor = .white
				case "k":
					lb.backgroundColor = UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
				case "v":
					lb.backgroundColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 1.0)
				case "h":
					lb.backgroundColor = .red
				default:
					lb.backgroundColor = .white
				}
				
				lb.text = ""
				lb.layer.borderWidth = 1.0
				lb.layer.borderColor = UIColor.blue.cgColor
				theScrollView.addSubview(lb)
				lb.widthAnchor.constraint(equalToConstant: w).isActive = true
				lb.heightAnchor.constraint(equalTo: lb.widthAnchor, constant: 0.0).isActive = true
				theVacayLabels.append(lb)
				
			}
			
			theDateLabels.last?.text = "1"
			
			var i = 0
			theDayLabels[i].leadingAnchor.constraint(equalTo: theScrollView.leadingAnchor, constant: 8.0).isActive = true
			theDayLabels[i].topAnchor.constraint(equalTo: theScrollView.topAnchor, constant: w * 5).isActive = true
			
			theDateLabels[i].leadingAnchor.constraint(equalTo: theDayLabels[i].leadingAnchor, constant: 0.0).isActive = true
			theDateLabels[i].topAnchor.constraint(equalTo: theDayLabels[i].bottomAnchor, constant: -1.0).isActive = true
			
			theVacayLabels[i].leadingAnchor.constraint(equalTo: theDateLabels[i].leadingAnchor, constant: 0.0).isActive = true
			theVacayLabels[i].topAnchor.constraint(equalTo: theDateLabels[i].bottomAnchor, constant: -1.0).isActive = true
			
			for i in 1..<theDayLabels.count {
				
				theDayLabels[i].leadingAnchor.constraint(equalTo: theDayLabels[i - 1].trailingAnchor, constant: 0.0).isActive = true
				theDayLabels[i].topAnchor.constraint(equalTo: theDayLabels[0].topAnchor, constant: 0.0).isActive = true
				
				theDateLabels[i].leadingAnchor.constraint(equalTo: theDateLabels[i - 1].trailingAnchor, constant: 0.0).isActive = true
				theDateLabels[i].topAnchor.constraint(equalTo: theDateLabels[0].topAnchor, constant: 0.0).isActive = true
				
				theVacayLabels[i].leadingAnchor.constraint(equalTo: theVacayLabels[i - 1].trailingAnchor, constant: 0.0).isActive = true
				theVacayLabels[i].topAnchor.constraint(equalTo: theVacayLabels[0].topAnchor, constant: 0.0).isActive = true
				
			}
			
			i = theDayLabels.count - 1
			
			theDayLabels[i].trailingAnchor.constraint(equalTo: theScrollView.trailingAnchor, constant: -8.0).isActive = true
			theDateLabels[i].trailingAnchor.constraint(equalTo: theScrollView.trailingAnchor, constant: -8.0).isActive = true
			
		}
		
	}
	
	
}
