import UIKit

class WritingDocumentViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var Text: UITextView!
    @IBOutlet weak var Name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add logic for text editor and movable annotations
        Text.delegate = self
        Name.delegate = self
        // Add movable annotations
        let annotation = UIView()
        annotation.backgroundColor = .red
        annotation.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        Text.addSubview(annotation)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        annotation.addGestureRecognizer(panGesture)
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
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: Text)
        if let view = gesture.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        gesture.setTranslation(CGPoint.zero, in: Text)
    }
}