//
//  RGRegisterViewController.swift
//  RxSwift_Login
//
//  Created by Reeves Goo on 2018/2/3.
//  Copyright © 2018年 ReevesGoo. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

class RGRegisterViewController: UIViewController {

    let disposebag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupFunction()
    }
    
    private func setupFunction(){
        
        let viewModel = RegisterViewModel()
        
        usernameTextField.rx.text .orEmpty.bind(to: viewModel.username).disposed(by: disposebag)
        passwordTextField.rx.text .orEmpty.bind(to: viewModel.password).disposed(by: disposebag)
        repeatPasswordTextField.rx.text .orEmpty.bind(to: viewModel.repeatPassword).disposed(by: disposebag)
        registerButton.rx.tap .bind(to: viewModel.registerTaps).disposed(by: disposebag)
        
        viewModel.usernameUsable.bind(to: usernameLabel.rx.validationResult).disposed(by: disposebag)
        viewModel.usernameUsable.bind(to: passwordTextField.rx.inputEnable).disposed(by: disposebag)
        
        viewModel.passwordUsable.bind(to: passwordLabel.rx.validationResult).disposed(by: disposebag)
        viewModel.passwordUsable.bind(to: repeatPasswordTextField.rx.inputEnable).disposed(by: disposebag)
        
        viewModel.repeatPasswordUsable.bind(to: repeatPasswordLabel.rx.validationResult).disposed(by: disposebag)
        
        viewModel.registerButtonEnabel.bind(to: registerButton.rx.btnValidState).disposed(by: disposebag)
        
        viewModel.registerResult.subscribe(onNext: {[weak self] result in
            
            switch result{
            case .ok(let message):
                self?.showAlert(message: message)
            case .failed(let message):
                self?.showAlert(message: message)
            default:
                self?.showAlert(message: "注册出错")
            }
            
        }).disposed(by: disposebag)
        
        
        
        loginButton.rx.tap.share(replay: 1).subscribe(onNext: {[weak self] (_) in
            let loginVC = RGLoginViewController()
            self?.navigationController?.pushViewController(loginVC, animated: true)
            
        }).disposed(by: disposebag)
        
        
    }
    
    
    private func setupUI(){
        title = "注册"
        view.backgroundColor = UIColor.white
        let barbutton = UIBarButtonItem.init(customView: loginButton)
        navigationItem.rightBarButtonItem = barbutton
        
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
        usernameLabel.text = "用户名最少5个字符"
        usernameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(usernameTextField)
            make.top.equalTo(usernameTextField.snp.bottom).offset(5)
            make.height.equalTo(12)
        }
        
        let pass = UILabel(textColor: UIColor.black, fontSize: 18)
        pass.text = "输入密码"
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
        passwordLabel.text = "密码最少5个字符"
        passwordLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(passwordTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
            make.height.equalTo(12)
        }
        
        let repass = UILabel(textColor: UIColor.black, fontSize: 18)
        repass.text = "重复密码"
        view.addSubview(repass)
        
        repass.snp.makeConstraints { (make) in
            make.leading.equalTo(user)
            make.top.equalTo(pass).offset(60)
            make.height.equalTo(18)
            make.width.equalTo(120)
        }
        
        view.addSubview(repeatPasswordTextField)
        repeatPasswordTextField.snp.makeConstraints { (make) in
            make.centerY.equalTo(repass)
            make.leading.trailing.equalTo(usernameTextField)
            make.height.equalTo(30)
        }
        view.addSubview(repeatPasswordLabel)
        repeatPasswordLabel.text = "两次密码不同"
        repeatPasswordLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(repeatPasswordTextField)
            make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(5)
            make.height.equalTo(12)
        }
        
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(270)
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
    
    private lazy var repeatPasswordTextField:UITextField = {
        
        let tf = UITextField()
        tf.borderStyle = UITextBorderStyle.roundedRect
        return tf
    }()
    
    private lazy var repeatPasswordLabel:UILabel = {
        
        let lab = UILabel(textColor: UIColor.red, fontSize: 11)
        return lab
        
    }()
    
    private lazy var loginButton:UIButton = {
        
        let btn = UIButton.init(type: .custom)
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        
        return btn
        
        
    }()
    
    private lazy var registerButton:UIButton = {
        
        let btn = UIButton.init(type: .custom)
        btn.setTitle("注 册", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.blue
//        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        
        return btn
        
        
    }()
}
