//
//  EarthViewController.swift
//  tryRickandmortyAgain
//
//  Created by Дарина Лисанова on 19.06.2023.
//

import UIKit

class EarthViewController: UIViewController {
    let link = "https://rickandmortyapi.com/api/location/1"

    override func viewDidLoad() {
        super.viewDidLoad()
       makeRequest()
    }

    private func makeRequest(){
        guard let earthUrl = URL(string: link) else {return}
        let request = URLRequest(url: earthUrl)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
            }

            guard let data = data else {
                print("data error")
                return
            }

            do {
                let earthPost = try JSONDecoder().decode(EarthPost.self, from: data)


                do {
                    let data = try Data(contentsOf: earthUrl)
                    

                } catch {
                    print(error)
                }

                print(earthPost)
            }

            catch {
                print(String(describing: error))
            }
        }.resume()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
