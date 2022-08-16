//
//  DetailViewController.swift
//  BasicLayoutAppProgrammatic
//
//  Created by Raul Barranco on 7/13/22.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var progDetailImageView: UIImageView = {
        
        let detailImageView = UIImageView(frame: .zero)
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.contentMode = .scaleAspectFit
        detailImageView.backgroundColor = .systemCyan
        return detailImageView
        
    }()
    
    lazy var progLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    lazy var progButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(self.typeString, for: .normal)
        
        switch self.typeString {
            
        case "grass":
            button.setTitleColor(.systemGreen, for: .normal)
        case "fire":
            button.setTitleColor(.systemRed, for: .normal)
        case "water":
            button.setTitleColor(.systemBlue, for: .normal)
        case "bug":
            button.setTitleColor(.systemGreen, for: .normal)
        case "normal":
            button.setTitleColor(.black, for: .normal)
        case "poison":
            button.setTitleColor(.systemPurple, for: .normal)
        case "electric":
            button.setTitleColor(.systemYellow, for: .normal)
        case "ground":
            button.setTitleColor(.systemBrown, for: .normal)
        case "fairy":
            button.setTitleColor(.systemPink, for: .normal)
        case "fighting":
            button.setTitleColor(.systemOrange, for: .normal)
            
        default:
            button.setTitleColor(.black, for: .normal)
            
        }
        
        
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(self.progButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(self.tapMeAnimatedButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var abilityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .white
        //label.layer.cornerRadius = 12
        return label
    }()

    lazy var moveLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = .white
        //label.layer.cornerRadius = 12
        return label
    }()
    
    let scrollView: UIScrollView = {
            let scrollView = UIScrollView()

            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()

    let scrollViewContainer: UIStackView = {
        let view = UIStackView()

        view.axis = .vertical
        view.spacing = 10

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let text: String
    let imageData: Data
    let typeString: String
    let abilityStringArr: [String]
    let moveStringArr: [String]
    
    init(text: String, imageData: Data, typeString: String, abilityStringArr: [String], moveStringArr: [String]) {
        
        self.text = text
        self.imageData = imageData
        self.typeString = typeString
        self.abilityStringArr = abilityStringArr
        self.moveStringArr = moveStringArr
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        self.setUpUI()
        self.progLabel.text = self.text
        //self.progDetailImageView.image = UIImage(named: self.text)
        self.progDetailImageView.image = UIImage(data: self.imageData)
        
        let stringRepresentation = self.abilityStringArr.joined(separator: ", ")
        self.abilityLabel.text = stringRepresentation
        
        let stringRepresentation2 = self.moveStringArr.joined(separator: ", ")
        self.moveLabel.text = stringRepresentation2
        
    }
    
    private func setUpUI() {
        
        ////// ########################################################################################################################################
        
        let vStackView = UIStackView(frame: .zero)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.spacing = 8
        vStackView.axis = .vertical
        vStackView.distribution = .fill
        
        let vStack1 = UIStackView(axis: .vertical, spacing: 8,distribution: .fill)
        vStack1.addArrangedSubview(self.progDetailImageView)
        
        let vStack2 = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        vStack2.addArrangedSubview(self.progLabel)
        vStack2.addArrangedSubview(self.progButton)
        vStack2.addArrangedSubview(self.abilityLabel)
        vStack2.addArrangedSubview(self.moveLabel)
        
        vStackView.addArrangedSubview(vStack1)
        vStackView.addArrangedSubview(vStack2)
        
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.scrollViewContainer)
        self.scrollViewContainer.addArrangedSubview(vStackView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        vStack1.heightAnchor.constraint(equalTo: vStackView.heightAnchor, multiplier: 0.30).isActive = true
        vStack2.heightAnchor.constraint(equalTo: vStackView.heightAnchor, multiplier: 0.70).isActive = true
        
        ////// ########################################################################################################################################
        
//        self.view.addSubview(self.progDetailImageView)
//        self.view.addSubview(self.progLabel)
//        self.view.addSubview(self.progButton)
//        self.view.addSubview(self.abilityLabel)
//        self.view.addSubview(self.moveLabel)
//
//        self.progDetailImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.progDetailImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.progDetailImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        self.progDetailImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        self.progDetailImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
//        //self.progDetailImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -44).isActive = true
//
//        self.progLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.progLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.progLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        //self.progLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -44).isActive = true
//        self.progLabel.topAnchor.constraint(equalTo: self.progDetailImageView.bottomAnchor, constant: 16).isActive = true
//
//        self.progButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.progButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.progButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        //self.progButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 44).isActive = true
//        self.progButton.topAnchor.constraint(equalTo: self.progLabel.bottomAnchor, constant: 16).isActive = true
//
//        self.abilityLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.abilityLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.abilityLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        self.abilityLabel.topAnchor.constraint(equalTo: self.progButton.bottomAnchor, constant: 16).isActive = true
//
//        self.moveLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.moveLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.moveLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        self.moveLabel.topAnchor.constraint(equalTo: self.abilityLabel.bottomAnchor, constant: 16).isActive = true
        
    }
    
    @objc
    func progButtonPressed() {
        //print("progButton was Tapped!!!")
        print(self.text)
    }
    
    @objc fileprivate func tapMeAnimatedButtonPressed(sender: UIButton) {
        
        print("My name is: \(self.text)")
        self.animateView(sender)
        
    }
    
    fileprivate func animateView(_ viewToAnimate: UIView) {
        
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
        
    }

}
