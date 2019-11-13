import Foundation
import UIKit

class Contact {
	var firstName: String?
	var lastName: String?
	var contactGroup: String?
	var phoneNumber: String?
	var photo: UIImage?
	var deleted: Bool
	
	init(firstName: String, lastName: String, contactGroup: String, phoneNumber: String, photo: UIImage?, deleted: Bool){
		self.firstName = firstName
		self.lastName = lastName
		self.contactGroup = contactGroup
		self.phoneNumber = phoneNumber
		self.photo = photo
		self.deleted = deleted
	}
	
}
