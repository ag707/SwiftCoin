//
//  ViewController.swift
//  SwiftCoin
//
//  Created by Yelena Gorelova on 26.04.2023.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {


  let pickerView = UIPickerView()

  let coinManager = CoinManager()
  override func viewDidLoad() {


    super.viewDidLoad()

    view.backgroundColor = .systemBlue
    byteCoinConstraints()
    stackLabelsConstraints()
    pickerViewConstraints()


    pickerView.delegate = self
    pickerView.dataSource = self


  }






  func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return coinManager.currencyArray.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

    return coinManager.currencyArray[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let selectCurrency = coinManager.currencyArray[row]
    coinManager.getCoinPrice(for: selectCurrency)

  }



  private lazy var byteCoin: UILabel = {

    let label = UILabel()
    label.text = "ByteCoin"
    label.font = UIFont.systemFont(ofSize: 50)
    label.translatesAutoresizingMaskIntoConstraints = false


    return label
  }()


  private lazy var byteImage: UIImageView = {


    let byteImage = UIImageView()
    byteImage.image = UIImage(systemName: "bitcoinsign.circle.fill")
    byteImage.tintColor = .white


    return byteImage
  }()


  private lazy var moneyLabel: UILabel = {

    let label = UILabel()
    label.text = "..."
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 20)


    return label
  }()

  private lazy var currencyLabel: UILabel = {

    let label = UILabel()
    label.text = "USD"
    label.textAlignment = .right
    label.font = UIFont.systemFont(ofSize: 30)


    return label
  }()


  private lazy var stackViewLabels: UIStackView = {
      let stack = UIStackView()
      stack.axis = .horizontal
      stack.spacing = 3.0
      stack.alignment = .fill
    stack.backgroundColor = .tertiaryLabel
      stack.addArrangedSubview(byteImage)
      stack.addArrangedSubview(moneyLabel)
      stack.addArrangedSubview(currencyLabel)
    moneyLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
      stack.translatesAutoresizingMaskIntoConstraints = false
    byteImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
    byteImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
      return stack
  }()









  func byteCoinConstraints() {

    view.addSubview(byteCoin)
    NSLayoutConstraint.activate([

      byteCoin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      byteCoin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 92),
      byteCoin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -92)

    ])


  }



  func stackLabelsConstraints() {

    view.addSubview(stackViewLabels)


    NSLayoutConstraint.activate([

      stackViewLabels.topAnchor.constraint(equalTo: byteCoin.bottomAnchor, constant: 10),
      stackViewLabels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      stackViewLabels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)

    ])

  }

  func pickerViewConstraints() {

    view.addSubview(pickerView)
    pickerView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([

      pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)

    ])


  }


}

