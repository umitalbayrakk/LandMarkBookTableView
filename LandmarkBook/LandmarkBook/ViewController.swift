import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    var landMarkSecondNames = [String]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Ülke İsimlerini landMarkNames isimli diziden okuyacağız.
       
        landMarkNames.append("Canada")
        landMarkNames.append("Denmark")
        landMarkNames.append("Germany")
        landMarkNames.append("Holland")
        landMarkNames.append("United Kingdom")
        landMarkNames.append("United States")
        landMarkNames.append("Scotland")
        landMarkNames.append("Seul Korea")
        
        // Başkent İsimlerini landMarkSecondsNames isimli diziden okuyacağız.
        
        landMarkSecondNames.append("Toronto")
        landMarkSecondNames.append("Kopenhang")
        landMarkSecondNames.append("Berlin")
        landMarkSecondNames.append("Amsterdam")
        landMarkSecondNames.append("London")
        landMarkSecondNames.append("New York")
        landMarkSecondNames.append("Edinburgh")
        landMarkSecondNames.append("Seul")
        
        
        
        // Resimleri landMarkImages isimli diziden okuyacağız.
       
        landMarkImages.append(UIImage(named: "canada")!)
        landMarkImages.append(UIImage(named: "denmark")!)
        landMarkImages.append(UIImage(named: "germany")!)
        landMarkImages.append(UIImage(named: "holland")!)
        landMarkImages.append(UIImage(named: "london")!)
        landMarkImages.append(UIImage(named: "newyork")!)
        landMarkImages.append(UIImage(named: "scotland")!)
        landMarkImages.append(UIImage(named: "seulkorea")!)
        
        
        
        
    }
    //Kaç tane satır gösterilecek.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    //Hücredeki Veriler.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.text = "Test"
        
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row]
        content.secondaryText = landMarkSecondNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    // Seçildiğinde yapılacak işlemler.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = landMarkNames[indexPath.row]
        chosenLandMarkImage = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandMarkName = chosenLandMarkName
            destinationVC.selectedLandMarkImage = chosenLandMarkImage
            
        }
    }
    // Silme Fonksiyonu
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landMarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

