//
//  BViewController.swift
//  9.Hafta
//
//  Created by Sümeyye Kılıçoğlu on 5.09.2022.
//

import UIKit
import MapKit
import CoreLocation

protocol BViewControllerDelegate {
     
}

class BViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 10, y:75, width:150, height: 150))
        imageView.backgroundColor = .systemGray
        imageView.image = #imageLiteral(resourceName: "profil")
        imageView.tintColor = .yellow
        return imageView
        
    }()
    
    private var nametextField: UITextField = {
        let nameText = UITextField(frame: CGRect(x: 10, y:300, width:350, height: 40))
        nameText.text = "Name".localized()
        nameText.backgroundColor = .systemGray
        return nameText
        
    }()
    private var surnameText: UITextField = {
        let surnameText = UITextField(frame: CGRect(x: 10, y:340, width:350, height: 40))
        surnameText.text = "Surname".localized()
        surnameText.backgroundColor = .systemGray
        return surnameText
        
    }()
    private var locationText: UITextField = {
        let locationText = UITextField(frame: CGRect(x: 10, y:380, width:350, height: 40))
        locationText.text = "Location".localized()
        locationText.backgroundColor = .systemGray
        return locationText
        
    }()
    private var languageText: UITextField = {
        let languageText = UITextField(frame: CGRect(x: 10, y:420, width:350, height: 40))
        languageText.text = "Language".localized()
        languageText.backgroundColor = .systemGray
        return languageText
        
    }()
    
    var delegate: AViewControllerDelegate?
   let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        
        let nam = UIImage(systemName: "bell")
        addLeftImage(txtfield: nametextField, img: nam!)
        let surn = UIImage(systemName: "bell")
        addLeftImage(txtfield: surnameText, img: surn!)
        let loc = UIImage(systemName: "bell")
        addLeftImage(txtfield: locationText, img: loc!)
        let lan = UIImage(systemName: "bell")
        addLeftImage(txtfield: languageText, img: lan!)
        
        
        
        view.addSubview(imageView)
        view.addSubview(nametextField)
        view.addSubview(surnameText)
        view.addSubview(locationText)
        view.addSubview(languageText)
        
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    @objc func selectImage() {
    let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
     
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func addLeftImage(txtfield: UITextField, img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20))
        leftImageView.image = img
        txtfield.leftView = leftImageView
        txtfield.leftViewMode = .always
    }
}
extension String {
    func localized() -> String{
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
