//
//  CoinManager.swift
//  SwiftCoin
//
//  Created by Yelena Gorelova on 27.04.2023.
//

import Foundation

struct CoinManager {

    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=D756A0F9-5E0E-431D-A64C-54B252186B3E"

    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]


  func getCoinPrice(for currency: String) {


    //Use String concatenation to add the selected currency at the end of the baseURL along with the API key.
          let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"

          //Use optional binding to unwrap the URL that's created from the urlString
          if let url = URL(string: urlString) {

              //Create a new URLSession object with default configuration.
              let session = URLSession(configuration: .default)

              //Create a new data task for the URLSession
              let task = session.dataTask(with: url) { (data, response, error) in
                  if error != nil {
                      print(error!)
                      return
                  }
                  //Format the data we got back as a string to be able to print it.
                  let dataAsString = String(data: data!, encoding: .utf8)
                  print(dataAsString)

              }
              //Start task to fetch data from bitcoin average's servers.
              task.resume()
          }
      }
  }

