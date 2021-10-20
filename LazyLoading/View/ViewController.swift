//
//  ViewController.swift
//  LazyLoading
//
//  Created by New Account on 10/20/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    var myTableView : UITableView = UITableView()
    var animalData : AnimalNetworkManager = AnimalNetworkManager()
    var animal : [Animal]? = nil
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        setupUI()
        loadDataOnView()
    }
    
    func setupUI(){
        self.view.addSubview(myTableView)
        myTableView.dataSource = self
        let customNib = UINib(nibName: "AnimalCell", bundle: nil)
       // myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomTable")
        myTableView.register(customNib, forCellReuseIdentifier: "AnimalCell")
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func loadDataOnView(){
        animalData.getAnimals(completionhandler: {(_animalData) in
            if(_animalData?.animals != nil){
                self.animal = _animalData?.animals
                
                DispatchQueue.main.async{
                    self.myTableView.reloadData()
                }
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animal?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath) as! AnimalCell
        let animal = self.animal?[indexPath.row]
        cell.animalName.text = animal?.name
        let animalImageUrl = URL(string: (animal?.image)!)!
        let animalImageData = try? Data(contentsOf: animalImageUrl)
        cell.animalImage.image = UIImage(data: animalImageData!)
       // cell.textLabel?.text  = itemsToLoad[indexPath.row]
       /* if(indexPath.row % 2 != 0){
            cell.backgroundColor = .gray
        }*/
        return cell
    }
}

