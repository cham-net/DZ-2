import UIKit

class ContactsDataSource: NSObject {
	
	var contacts: [Contact]
	
	static func generateContactsData() -> [Contact] {
		
		return [
			Contact(firstName: "Дональд", lastName: "Трамп", contactGroup: "Коллеги", phoneNumber: "+12024793000", photo: UIImage(named: "dt"), deleted: false),
			Contact(firstName: "Владимир", lastName: "Путин", contactGroup: "Коллеги", phoneNumber: "+74956253581", photo: UIImage(named: "vp"), deleted: false),
			Contact(firstName: "Иосиф", lastName: "Сталин", contactGroup: "Друзья", phoneNumber: "+999999999", photo: UIImage(named: "is"), deleted: false)
		]
		
	}
	
	override init() {
		contacts = ContactsDataSource.generateContactsData()
	}
	
	func numberOfContacts() -> Int {
		contacts.count
	}
	
	func append(contact: Contact, to tableView: UITableView) {
		contacts.append(contact)
		tableView.insertRows(at: [IndexPath(row: contacts.count-1, section: 0)], with: .automatic)
	}
	
	func contact(at indexPath: IndexPath) -> Contact {
		contacts[indexPath.row]
	}
}

