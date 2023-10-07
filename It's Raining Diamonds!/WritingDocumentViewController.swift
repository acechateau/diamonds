   import UIKit

   class WritingDocumentViewController: UIViewController {
       @IBOutlet weak var Text: UITextView!
       @IBOutlet weak var Name: UITextField!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           // Add logic for text editor and movable annotations
       }
       
       @IBAction func Save(_ sender: Any) {
           myText = Text.text
           myName = Name.text!
       }
   }