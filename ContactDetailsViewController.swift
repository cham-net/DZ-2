import UIKit

class ​ContactDetailsViewController: UITableViewController {
    
    var contact: Contact?
  
    var group = "" {
      didSet {
        DetailLabel.text = group
      }
    }
    
    var imagePicker: ImagePicker!
  
  @IBOutlet weak var FirstNameTextField: UITextField!
  @IBOutlet weak var LasttNameTextField: UITextField!
  @IBOutlet weak var PhoneNumberTextField: UITextField!
  @IBOutlet weak var DetailLabel: UILabel!
  @IBOutlet weak var PhotoView: UIImageView!
  @IBAction func PhotoSeletion(_ sender: Any) {
    self.imagePicker.present(from: sender as! UIView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    print("init ContactDetailsViewController")
    super.init(coder: aDecoder)
  }
  deinit {
    print("deinit ContactDetailsViewController")
  }
  
    override func viewDidLoad() {
      group = "Одноклассники"
      FirstNameTextField.becomeFirstResponder()
      self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
    
    if segue.identifier == "SaveGroup",
          let contactFirstName = FirstNameTextField.text,
          let contactLastName = LasttNameTextField.text,
          let contactPhoneNumber = PhoneNumberTextField.text,
          let groupName = DetailLabel.text,
          let photo = PhotoView.image {
      contact = Contact(firstName: contactFirstName, lastName: contactLastName, contactGroup: groupName, phoneNumber: contactPhoneNumber, photo: photo, deleted: false)
       }
    if segue.identifier == "ChooseGroup",
       let groupsViewController = segue.destination as? ​GroupsViewController {
      groupsViewController.groupsDataSource.selectedGroup = group
    }
  }
}

extension ​ContactDetailsViewController {
  @IBAction  func  SelectedGroup (segue: UIStoryboardSegue) {
    if let groupViewController = segue.source as? ​GroupsViewController,
       let selectedGame = groupViewController.groupsDataSource.selectedGroup {
      group = selectedGame
    }
  }
}

extension ​ContactDetailsViewController: ImagePickerDelegate {
  func didSelect(image: UIImage?) {
      self.PhotoView.image = image
  }
}




