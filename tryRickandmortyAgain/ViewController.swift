//
//  ViewController.swift
//  tryRickandmortyAgain
//
//  Created by Дарина Лисанова on 19.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: outlets

    @IBOutlet var RickImageView: UIImageView!

    @IBOutlet var RickNameLabel: UILabel!

    @IBOutlet var RickStatusLabel: UILabel!

    @IBOutlet var RickSpeciesLabel: UILabel!

    @IBOutlet var RickTypeLabel: UILabel!

    @IBOutlet var RickGenderLabel: UILabel!

    @IBOutlet var RickOriginButton: UIButton!
    
    

    @IBOutlet var defaultImageView: UIImageView!
    
    
    
    
    



    let link = "https://rickandmortyapi.com/api/character/1"
    
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
       makeRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultImageView.image = UIImage(named: "default")
        defaultImageView.alpha = 0.3
        RickOriginButton.contentHorizontalAlignment = .left
        showData(post: post)
    }
    
    private func showData (post: Post?){
        guard let post = post else {
            print("noPost")
            return
        }
        guard let url = URL(string: post.image) else {
            return
        }


        do {
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async {
                self.RickImageView.image = UIImage(data: data)
                self.RickNameLabel.text = post.name
                self.RickStatusLabel.text = "Status: \(post.status)"
                self.RickSpeciesLabel.text = "Species: \(post.species)"
                self.RickTypeLabel.text = "Type: \(post.type.isEmpty ? "none" : post.type)"
                self.RickGenderLabel.text = "Gender: \(post.gender)"
                self.RickOriginButton.titleLabel?.text = "Origin: \(post.origin.name)"
            }


        } catch {
            print(error)
        }
    }

    private func makeRequest(){
        guard let url = URL(string: link) else {return}
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
            }

            guard let data = data else {
                print("data error")
                return
            }

            do {
                let post = try JSONDecoder().decode(Post.self, from: data)
                
                self.post = post
                self.showData(post: post)
                print(post)
            }

            catch {
                print(String(describing: error))
            }
        }.resume()
    }
    
    
    @IBAction func originAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EarthViewController") as! EarthViewController
        show(vc, sender: self)
    }
}

