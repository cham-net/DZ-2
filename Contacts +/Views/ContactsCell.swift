import UIKit

class ContactsCell: UITableViewCell {
	
	@IBOutlet weak var FotoImage: UIImageView!
	@IBOutlet weak var FirstNameLabel: UILabel!
	@IBOutlet weak var LastNameLabel: UILabel!
	@IBOutlet weak var PhoneNumber: UILabel!
	@IBOutlet weak var GroupLabel: UILabel!
	
	var contact: Contact? {
		didSet {
			guard let contact = contact else { return }
			FirstNameLabel.text = contact.firstName
			LastNameLabel.text = contact.lastName
			PhoneNumber.text = contact.phoneNumber
			GroupLabel.text = contact.contactGroup
			FotoImage.image = contact.photo
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
	}
	
}
