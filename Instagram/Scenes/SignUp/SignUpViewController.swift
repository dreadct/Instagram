//
//  SignUpViewController.swift
//  Instagram
//
//  Created by CruzDiary on 25/12/2016.
//  Copyright © 2016 cruz. All rights reserved.
//

import UIKit

import SkyFloatingLabelTextField
import RxCocoa
import RxSwift

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var userNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var viewModel: SignUpViewModelType!
    
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = SignUpViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.selectedTitleColor = .black
        userNameTextField.selectedTitleColor = .black
        passwordTextField.selectedTitleColor = .black
        
        signUpButton.rx.tap
            .bind(to: viewModel.signUpButtonDidTap)
            .disposed(by: disposeBag)
        
        emailTextField.rx
            .text
            .bind(to: viewModel.emailChanged)
            .disposed(by: disposeBag)
        
        userNameTextField.rx.text
            .bind(to: viewModel.userNameChanged)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text
            .bind(to: viewModel.passwordChanged)
            .disposed(by: disposeBag)
        
        viewModel.presentButtonViewModel
            .drive(onNext: { [weak self] viewModel in
                guard let `self` = self else { return }
                self.signUpButton.backgroundColor = viewModel.backgroundColor
            })
            .disposed(by: disposeBag)
        
        viewModel.signedUp
            .drive(onNext: { [weak self] signedUp in
                guard let `self` = self else { return }
                self.performSegue(withIdentifier: ListFeedsScene.segue, sender: nil)
            })
            .disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
}
