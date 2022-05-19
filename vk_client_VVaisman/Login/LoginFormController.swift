//
//  LoginFormController.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 06/11/2021.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var enterButton: UIButton!
    
    let loginToTabBarSegue = "loginToTabBarSegue"
    
    
    /// Урок  сетью 2.
    let service = ServiceVK()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterButton.layer.cornerRadius = 5
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        /// Урок  сетью 2.
       // service.loadJsonAF()
        service.loadJson()
        
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        
        //ДОБАВИЛИ НАБЛЮДЕНИЕ
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWasShown),
                                            name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //УБРАЛИ НАБЛЮДЕНИЕ
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    
    
    @IBAction func enterButton(_ sender: Any) {
        guard  let login =  loginTextField.text,
               let password = passwordTextField.text
        else {
            print ("Empty Fields")
            return
        }
        if login == "a",
           password == "1" {
            print("OK")
            enterButton.backgroundColor = UIColor.systemGreen
            performSegue(withIdentifier: loginToTabBarSegue, sender: self)
            
        }
        else {
            print ("Error")
            enterButton.backgroundColor = UIColor.systemRed
        }
    }
    
    
    
    // Когда появляется клавиатура
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    

}

//MARK: - UIScrollViewDelegate
// Метод который отменяет скролл экрана по оси X
extension LoginFormController: UIScrollViewDelegate {
    func scrollViewDidScroll(_scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
    }
}
