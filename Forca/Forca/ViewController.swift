//
//  ViewController.swift
//  Forca
//
//  Created by Nikolas Cardoso de Oliveira on 19/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var restartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_restart"), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTouched), for: .touchDown)
        return button
    }()

    lazy var forcaImageView: UIImageView = {
        let  imageView =  UIImageView()
        imageView.image = UIImage(named: "forca")
        return imageView
    }()
    
    lazy var stickerImageView: UIImageView = {
        let  imageView =  UIImageView()
        return imageView
    }()
    
    lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        return  stackView
    }()
    
    lazy var hintLabel: UILabel = {
        let  label =  UILabel()
        return label
    }()
    
    lazy var tryLabel: UILabel = {
        let  label =  UILabel()
        return label
    }()
    
    lazy var letterTextView: UITextField = {
        let  textField =  UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.keyboardType = .namePhonePad
        textField.autocapitalizationType = .allCharacters
        textField.delegate = self
        return textField
    }()
    
    lazy var lastTryTitleLabel: UILabel = {
        let  label =  UILabel()
        label.text = "Chutes Anteriores"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var lastTryValueLabel: UILabel = {
        let  label =  UILabel()
        return label
    }()
    
    private var jogoDaForca = JogoDaForca.aleatorio()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
        update()
    }
    
    func update() {
        tryLabel.attributedText = jogoDaForca.maskedWord.spaced
        hintLabel.text = "A dica é: \(jogoDaForca.dica)"
        lastTryValueLabel.attributedText = formatTries()
        
        let image: UIImage?
        
        if jogoDaForca.gameSituation == GameState.lose {
            image = UIImage(named: "bonecao_completo_e_mortinho")
        } else {
            image = UIImage(named: "bonecao_fase_\(jogoDaForca.erros)")
        }
        
        UIView.transition(with: stickerImageView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.stickerImageView.image = image
        }, completion: nil)
    }
    
    func formatTries() -> NSMutableAttributedString {
        jogoDaForca.lastTry.reduce(NSMutableAttributedString()) { partialResult, letter in
            let letterWithColor: NSAttributedString = jogoDaForca.palavra.comparable.contains(letter) ? letter.rightColor : letter.wrongColor
            
            partialResult.append(letterWithColor)
            return partialResult
        }.spaced
    }
    
    @objc func resetButtonTouched() {
        reset()
    }
    
    func reset() {
        jogoDaForca = .aleatorio()
        update()
    }
    
    func alert(title: String, description: String? = nil) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Jogar Novamente", style: .default) { _ in
            self.reset()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        letterTextView.text = string.uppercased()
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            jogoDaForca.tryLetter(letter: text)
        }
        
        if jogoDaForca.gameSituation == GameState.won {
            alert(title: "Voce ganhou")
        } else if jogoDaForca.gameSituation == GameState.lose {
            alert(title: "Voce perdeu")
        }
        
        update()
        return true
    }
}

// MARK:   - setup das views
extension ViewController {

    func configViews(){
        view.backgroundColor  = UIColor(named: "background")
    }
    
    func buildViews() {
        view.addSubview(restartButton)
        view.addSubview(forcaImageView)
        view.addSubview(stickerImageView)
        view.addSubview(textStackView)
        
        textStackView.addArrangedSubview(hintLabel)
        textStackView.addArrangedSubview(tryLabel)
        textStackView.addArrangedSubview(letterTextView)
        textStackView.addArrangedSubview(lastTryTitleLabel)
        textStackView.addArrangedSubview(lastTryValueLabel)
    }
    
    func buildConstraints(){
        restartButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(22)
        }
        
        forcaImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
        }
        
        stickerImageView.snp.makeConstraints { make in
            make.trailing.equalTo(forcaImageView).inset(8)
            make.top.equalTo(forcaImageView.snp.centerY).offset(-18)
        }
        
        textStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forcaImageView.snp.bottom).offset(24)
        }
        
        letterTextView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
    }

}
