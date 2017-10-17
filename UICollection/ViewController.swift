//
//  ViewController.swift
//  UICollection
//
//  Created by Legendary Wicho on 10/15/17.
//  Copyright © 2017 Luis Santiago. All rights reserved.
//

import UIKit

class CustomCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let customId = "cell id";

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor.white;
        
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customId);
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width,height:200);
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customId, for: indexPath);
        return customCell;
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3;
    }
    
}

class CustomCell: UICollectionViewCell{
    override init(frame: CGRect){
        super.init(frame:frame)
        initView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let nameLabel:UILabel = {
        let label = UILabel();
        label.text = "Custom text";
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    func initView(){
        backgroundColor = UIColor.red;
        addSubview(nameLabel);
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]));
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]));
    }
}

