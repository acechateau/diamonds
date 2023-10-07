import UIKit

class PlanningDocumentViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var Text: UITextView!
    @IBOutlet weak var Name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add logic for text editor and bullet points
        Text.delegate = self
        Name.delegate = self
    }
    
    @IBAction func Save(_ sender: Any) {
        myText = Text.text
        myName = Name.text!
        // Add logic for user-modifiable title and main text body
    }
    
    // UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
           let updatedText = text.replacingCharacters(in: textRange, with: string)
           myName = updatedText
        }
        return true
    }
    
    // UITextViewDelegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.text += "\n• "
            return false
        }
        return true
    }
}