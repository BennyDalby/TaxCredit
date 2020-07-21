//
//  GasViewController.swift
//  TaxCredit
//
//  Created by Test on 7/20/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit
import CDAlertView

class GasViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
    
   fileprivate var imagePicker = UIImagePickerController()

    @IBOutlet weak var totalTextField: customTextField!
    @IBOutlet weak var gallonsTextField: customTextField!
    @IBOutlet weak var dateTextField: customTextField!
    @IBOutlet weak var vehicleTextField: customTextField!
    @IBOutlet weak var receiptImageView: UIImageView!
    
    @IBOutlet weak var goButton: UIButton!
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(updateTextField), for: .valueChanged)
        dateTextField.inputView = datePicker
        dateTextField.text = formatDateForDisplay(date: datePicker.date)
        dateTextField.delegate = self
        vehicleTextField.delegate = self
        totalTextField.delegate = self
        gallonsTextField.delegate = self
        goButton.isUserInteractionEnabled = false
        
         self.hideKeyboardWhenTappedAround()
        
    }
    
    
    
    func toggleButtonImage(data:String) {
        
        if dateTextField.text!.count >= 1 &&
            gallonsTextField.text!.count >= 1 &&
            totalTextField.text!.count >= 1 &&
            vehicleTextField.text!.count >= 1   {
            
            goButton.setBackgroundImage(UIImage (named: "speed-2"), for: .normal)
            goButton.isUserInteractionEnabled = true
        }
        
        else {
            
            goButton.setBackgroundImage(UIImage (named: "speed"), for: .normal)
            goButton.isUserInteractionEnabled = false

        }
        
        
    }
    
    
    
    
    
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//        toggleButtonImage()
//
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//
//
//    }
//
    
    
    
    @IBAction func goTapped(_ sender: Any) {
        
        
//        let alert = UIAlertController(title: "Saved", message: "Form Saved", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//              switch action.style{
//              case .default:
//                 self.dismiss(animated: true, completion: { () -> Void in
//
//                        })
//                break
//              default:
//                break
//            }}))
//        self.present(alert, animated: true, completion: nil)
        
        
        
       let alert = CDAlertView(title: "Awesome", message: "Your form is saved succesfully!", type: .notification)
        let doneAction = CDAlertViewAction(title: "Thanks! 💪",handler: {(action) -> Bool in
            
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
               
            self.dismiss(animated: true, completion: { () -> Void in})
            }
         
            
            return true
        })
        alert.add(action: doneAction)
        
        alert.show()
        
    }
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("String is",string)
        
        toggleButtonImage(data:string)
           
           return true
           
           }
    
   
    
    
    func formatDateForDisplay(date: Date) -> String {
       let formatter = DateFormatter()
       formatter.dateFormat = "dd MMM yyyy"
       return formatter.string(from: date)
       
       }
    
    
    @objc func updateTextField() {
        
        let df = DateFormatter()
        df.dateFormat = "MMM dd, yyyy"
        let now = df.string(from: datePicker.date)
        vehicleTextField.text = now
    }
    
    @IBAction func uploadTapped(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                
                   imagePicker.delegate = self
                   imagePicker.sourceType = .savedPhotosAlbum
                   imagePicker.allowsEditing = true

                   present(imagePicker, animated: true, completion: nil)
               }
        
    }
    
    
    
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
//        self.dismiss(animated: true, completion: { () -> Void in
//
//        })
//
//    }
    
    
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage {
                   receiptImageView.isHidden = false
                   receiptImageView.image = image
               }
            picker.dismiss(animated: true, completion: nil);
    }
    
    
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


