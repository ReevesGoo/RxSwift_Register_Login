//
//  RGLoginViewController.swift
//  RxSwift_Login
//
//  Created by Reeves Goo on 2018/2/3.
//  Copyright © 2018年 ReevesGoo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class RGLoginViewController: UIViewController {

    let disposebag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupFunction()
      
    }
    
    private func setupFunction(){
        
        let viewModel = LoginViewModel(input: (username: usernameTextField.rx.text .orEmpty.asDriver(), password: passwordTextField.rx.text .orEmpty.asDriver(), loginTap:loginButton.rx.tap.asDriver()), service: ValidationService.instance)
        
        viewModel.usernameUsable.drive(usernameLabel.rx.validationResult).disposed(by: disposebag)
        viewModel.usernameUsable.drive(passwordTextField.rx.inputEnable).disposed(by: disposebag)
        
        viewModel.passwordUsable.drive(passwordLabel.rx.validationResult).disposed(by: disposebag)
        viewModel.loginButtonEnable.drive(loginButton.rx.btnValidState).disposed(by: disposebag)
        
        viewModel.loginResult.drive(onNext: {[weak self] (result) in
            switch result{
            case .ok(let message):
                self?.showAlert(message: message)
            case .failed(let message):
                self?.showAlert(message: message)
            default:
                self?.showAlert(message: "登录出错")
            }
        }).disposed(by: disposebag)
        
    }
    
    private func setupUI(){
        title = "登录"
        view.backgroundColor = UIColor.white
       
        let user = UILabel(textColor: UIColor.black, fontSize: 18)
        user.text = "用户名"
        view.addSubview(user)
        
        user.snp.makeConstraints { (make) in
            make.leading.equalTo(view).offset(20)
            make.top.equalTo(view).offset(80)
            make.height.equalTo(18)
            make.width.equalTo(120)
        }
        
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { (make) in
            make.centerY.equalTo(user)
            make.leading.equalTo(user.snp.trailing).offset(15)
            make.trailing.equalTo(view).offset(-50)
            make.height.equalTo(30)
        }
        view.addSubview(usernameLabel)
        usernameLabel.text = ""
        usernameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(usernameTextField)
            make.top.equalTo(usernameTextField.snp.bottom).offset(5)
            make.height.equalTo(12)
        }
        
        let pass = UILabel(textColor: UIColor.black, fontSize: 18)
        pass.text = "密码"
        view.addSubview(pass)
        
        pass.snp.makeConstraints { (make) in
            make.leading.equalTo(user)
            make.top.equalTo(user).offset(60)
            make.height.equalTo(18)
            make.width.equalTo(120)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.centerY.equalTo(pass)
            make.leading.trailing.equalTo(usernameTextField)
            make.height.equalTo(30)
        }
        view.addSubview(passwordLabel)
        passwordLabel.text = ""
        passwordLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(passwordTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
            make.height.equalTo(12)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(200)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
    func showAlert(message: String) {
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertViewController.addAction(action)
        present(alertViewController, animated: true, completion: nil)
    }
    
    
    private lazy var usernameTextField:UITextField = {
        
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private lazy var usernameLabel:UILabel = {
        
        let lab = UILabel(textColor: UIColor.red, fontSize: 11)
        return lab
    
    }()
    
    private lazy var passwordTextField:UITextField = {
        
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.roundedRect
        return tf
    }()
    
    private lazy var passwordLabel:UILabel = {
        
        let lab = UILabel(textColor: UIColor.red, fontSize: 11)
        return lab
        
    }()
    

    
    private lazy var loginButton:UIButton = {
        
        let btn = UIButton.init(type: .custom)
        btn.setTitle("登 录", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.blue
        return btn
        
        
    }()

 
    

 

}
