//
//  ViewController.swift
//  RGB_ColorView
//
//  Created by Cheremisin Andrey on 12.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let viewColors = UIView()
    let labelRed = UILabel()
    let labelGreen = UILabel()
    let labelBlue = UILabel()
    
    let redValueLabel = UILabel()
    let greenValueLabel = UILabel()
    let blueValueLabel = UILabel()
    
    let redSlider = UISlider()
    let greenSlider = UISlider()
    let blueSlider = UISlider()
    
    let buttonClean = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewColors.backgroundColor = .black
        viewColors.layer.cornerRadius = 10
        viewColors.layer.shadowRadius = 10
        viewColors.layer.shadowOffset = CGSize(width: 0, height: 7)
        viewColors.layer.shadowColor = UIColor.black.cgColor
        viewColors.layer.shadowOpacity = 0.4
        
        setupElements()
        setupConstraints()
        setSliderValue()
    }

    func setupElements() {
        labelRed.text = "Red:"
        labelGreen.text = "Green:"
        labelBlue.text = "Blue:"
        
        redSlider.minimumTrackTintColor = .red
        redSlider.addTarget(self, action: #selector(redTapped), for: .valueChanged)

        greenSlider.minimumTrackTintColor = .green
        greenSlider.addTarget(self, action: #selector(greenTapped), for: .valueChanged)
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.addTarget(self, action: #selector(blueTapped), for: .valueChanged)
        
        buttonClean.backgroundColor = UIColor(red: CGFloat(0.85), green: CGFloat(0.80), blue: CGFloat(1.00), alpha: 1)
        buttonClean.setTitle("Reset color", for: .normal)
        buttonClean.setTitleColor(.blue, for: .normal)
        buttonClean.layer.cornerRadius = 10
        buttonClean.layer.shadowRadius = 10
        buttonClean.layer.shadowOffset = CGSize(width: 0, height: 7)
        buttonClean.layer.shadowColor = UIColor.black.cgColor
        buttonClean.layer.shadowOpacity = 0.4
        buttonClean.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        
        
        viewColors.translatesAutoresizingMaskIntoConstraints = false
        labelRed.translatesAutoresizingMaskIntoConstraints = false
        labelGreen.translatesAutoresizingMaskIntoConstraints = false
        labelBlue.translatesAutoresizingMaskIntoConstraints = false
        redValueLabel.translatesAutoresizingMaskIntoConstraints = false
        greenValueLabel.translatesAutoresizingMaskIntoConstraints = false
        blueValueLabel.translatesAutoresizingMaskIntoConstraints = false
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        buttonClean.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewColors)
        view.addSubview(labelRed)
        view.addSubview(labelGreen)
        view.addSubview(labelBlue)
        view.addSubview(redValueLabel)
        view.addSubview(greenValueLabel)
        view.addSubview(blueValueLabel)
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        view.addSubview(buttonClean)
    }
    
    @objc func resetTapped() {
        redSlider.value = 0
        redValueLabel.text = "0.0"
        greenSlider.value = 0
        greenValueLabel.text = "0.0"
        blueSlider.value = 0
        blueValueLabel.text = "0.0"
    }
    @objc func redTapped() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        viewColors.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @objc func greenTapped() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        viewColors.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @objc func blueTapped() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        viewColors.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    func setupConstraints() {
        viewColors.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        viewColors.heightAnchor.constraint(equalToConstant: 170).isActive = true
        viewColors.widthAnchor.constraint(equalToConstant: 350).isActive = true
        viewColors.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        labelRed.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 240).isActive = true
        labelRed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelGreen.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 280).isActive = true
        labelGreen.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelBlue.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 320).isActive = true
        labelBlue.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        redValueLabel.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 240).isActive = true
        redValueLabel.leftAnchor.constraint(equalTo: labelRed.leftAnchor, constant: 60).isActive = true
        greenValueLabel.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 280).isActive = true
        greenValueLabel.leftAnchor.constraint(equalTo: labelGreen.leftAnchor, constant: 60).isActive = true
        blueValueLabel.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 320).isActive = true
        blueValueLabel.leftAnchor.constraint(equalTo: labelBlue.leftAnchor, constant: 60).isActive = true
        
        redSlider.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 240).isActive = true
        redSlider.leftAnchor.constraint(equalTo: redValueLabel.leftAnchor, constant: 45).isActive = true
        redSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        greenSlider.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 280).isActive = true
        greenSlider.leftAnchor.constraint(equalTo: greenValueLabel.leftAnchor, constant: 45).isActive = true
        greenSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        blueSlider.topAnchor.constraint(equalTo: viewColors.topAnchor, constant: 320).isActive = true
        blueSlider.leftAnchor.constraint(equalTo: blueValueLabel.leftAnchor, constant: 45).isActive = true
        blueSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        buttonClean.topAnchor.constraint(equalTo: blueSlider.topAnchor, constant: 60).isActive = true
        buttonClean.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonClean.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonClean.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setSliderValue() {
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
    }
    
}

