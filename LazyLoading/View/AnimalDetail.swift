
import UIKit

class AnimalDetail: UIViewController,UICollectionViewDelegate {
  
    

    

    var imageFile : UIImage!
    var customView: UICollectionView!
    var titlePage : String!
    var image : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
       detailViewSetup()
  
    }
 

    func detailViewSetup(){
        
        let imageView = UIImageView(image: imageFile)
        imageView.frame = CGRect(x: 20, y: 20, width: 200, height: 250)
        let frame = self.view.frame
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        flowLayout.itemSize = CGSize(width: 60, height: 60)
       
        customView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        customView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "AnimalDetailView")
       
        
/*
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let backImage = UIImage(named: "backbtn")
        //backImage?.size = CGSize(width: 20, height: 40)
        
        
        //backButton.setImage(backImage, for: .normal)
        backButton.titleEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 0)
        backButton.setTitle("Photos", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.addTarget(self, action: #selector (goBack), for: .touchUpInside)
        var backButtonBar = UIBarButtonItem(customView: backButton)
        var space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = -15
        self.navigationItem.leftBarButtonItems = [space,backButtonBar]
        */
        //Adding main Image
        let label = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        label.center = CGPoint(x: frame.width/2 , y: frame.height/1.4)
        label.textAlignment = .center
        label.text = titlePage
        
        //Adding image
       
        let detailImage = UIImageView(image: image!)
        detailImage.frame = CGRect(x: 0, y: 100, width: frame.width, height: frame.height/2)
        
        //Adding Subtitle
        let subLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 300, height: 50))
        subLabel.center = CGPoint(x: frame.width * 0.5 , y: frame.height/1.1)
        subLabel.textAlignment = .center
        subLabel.text = "Image of \(titlePage!)"
        
        self.view.addSubview(customView ?? UICollectionView())
        self.view.addSubview(detailImage)
       // self.view.addSubview(backButton)
        self.view.addSubview(label)
        self.view.addSubview(subLabel)
   
        //customView.delegate = self
        //customView.dataSource = self
        
        customView.translatesAutoresizingMaskIntoConstraints = false
         customView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         customView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         customView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         customView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
   /*
    @objc func goBack(_ sender : UIButton){
        dismiss(animated: true, completion: nil)
    }
    */
}
