//
//  ViewController.swift
//  9.Hafta
//
//  Created by Sümeyye Kılıçoğlu on 2.09.2022.
//


import UIKit
import Alamofire


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, AViewControllerDelegate {
    
    
    
    private var collectionView: UICollectionView?
    
    private var myButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 270, y:800, width:100, height: 45))
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Website", for: .normal)
        button.tintColor = .yellow
        return button
        
    }()
    
    
    private var myButton1: UIButton = {
        let button1 = UIButton(frame: CGRect(x:50, y:800, width: 100, height: 45))
        button1.backgroundColor = .systemRed
        button1.setTitleColor(.white, for: .normal)
        button1.setTitle("Profile", for: .normal)
        button1.tintColor = .yellow
        return button1
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        String(format: "%@ %@ %d yaşındadır.", "Sümeyye", "Kılıçoğlu", 28)
//        AF.request(String(format: Constants.baseURL, Constants.popularPath, Constants.apiKey),
//                   method: .get).responseDecodable(of: MoviePopular.self) { movie, error in
//            print()
//        }
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                 height: (view.frame.size.width/3)-4)
       
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomollectionViewCell.self, forCellWithReuseIdentifier: CustomollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(didTapped), for: .touchUpInside)
        collectionView.frame = view.bounds
        view.addSubview(myButton1)
        myButton1.addTarget(self, action: #selector(didTappedB), for: .touchUpInside)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            if let AViewController = segue.destination as? AViewController {
                AViewController.delegate = self
            } else if let BViewController = segue.destination as? BViewController {
                BViewController.delegate = self
            }
        }
    }
    @objc func didTapped() {
        performSegue(withIdentifier: "Segue", sender: nil)
    }
    
    @objc func didTappedB() {
        performSegue(withIdentifier: "BSegue", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomollectionViewCell.identifier, for: indexPath) as! CustomollectionViewCell
        
        cell.configure(label: "Custom \(indexPath.row)")
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
}

