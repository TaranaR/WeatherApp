import UIKit

class ViewController: UIViewController {
  
  private let myTableView = UITableView()
  
  private var weather1 = [Weather]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Weather"
    
    self.weather1 = ApiHandler.shared.getStockPrices()
        
   
    view.addSubview(myTableView)
    setupTableView()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    myTableView.frame = view.frame
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  private func setupTableView() {
    myTableView.dataSource = self
    myTableView.delegate = self
    myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weather1.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let data = weather1[indexPath.row]
    cell.textLabel?.text = "\(data.location.name) || \(data.current.temp_c) "
    return cell
  }
}
