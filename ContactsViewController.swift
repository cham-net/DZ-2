import UIKit

class ContactsViewController: UITableViewController {
	var contactsDataSource = ContactsDataSource()
	var items = [Contact]()
}

extension ContactsViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		contactsDataSource.numberOfContacts()
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactsCell
		cell.contact = contactsDataSource.contact(at: indexPath)
		return cell
	}
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if (editingStyle == .delete) {
			contactsDataSource.contacts.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
}

extension ContactsViewController {
	@IBAction func CancelViewController(_ segue: UIStoryboardSegue) {
	}
	@IBAction func SaveDetail(_ segue: UIStoryboardSegue) {
		guard
			let contactDetailsViewController = segue.source as? ​ContactDetailsViewController,
			let contact = contactDetailsViewController.contact
			else {
				return
		}
		contactsDataSource.append(contact: contact, to: tableView)
	}
}
