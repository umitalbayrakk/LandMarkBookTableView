import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landMarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landMarkLabel.text = selectedLandMarkName
        imageView.image = selectedLandMarkImage

      
    }
    

   

}
