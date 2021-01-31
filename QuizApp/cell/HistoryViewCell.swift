import UIKit

class HistoryViewCell: UITableViewCell {

    @IBOutlet weak var resIdLabel: UILabel!
    @IBOutlet weak var resLabel: UILabel!
    
    var delegate:HistoryViewController?
    var id=0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
