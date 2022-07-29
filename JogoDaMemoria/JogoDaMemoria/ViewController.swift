//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Nikolas Cardoso de Oliveira on 20/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var jogoDaMemoria: JogoDaMemoria = .init()
    
    lazy var restartButton: UIButton = {
        var buttonConfig = UIButton.Configuration.borderless()
        buttonConfig.image = UIImage(systemName: "chevron.left")
        buttonConfig.imagePlacement = .trailing
        buttonConfig.imagePadding = 5
        
        let button = UIButton(configuration: buttonConfig)
        button.setTitle("Reiniciar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(restartTouched), for: .touchDown)
        
        return button
    }()
    
    lazy var cardsTopStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        
        return stackView
    }()
    
    lazy var cardsBotStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        
        return stackView
    }()
    
    lazy var cardsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
            
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    func configViews() {
        view.backgroundColor = .white
    }
    
    func buildViews() {
        view.addSubview(restartButton)
        view.addSubview(cardsStackView)
        
        cardsStackView.addArrangedSubview(cardsTopStackView)
        cardsStackView.addArrangedSubview(cardsBotStackView)
        
        for index in 1...5 {
            cardsTopStackView.addArrangedSubview(createButton(with: index))
            cardsBotStackView.addArrangedSubview(createButton(with: index + 5))
        }
        
    }
    
    func buildConstraints() {
        restartButton.snp.makeConstraints{ make in
            make.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        cardsStackView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.top.equalTo(restartButton.snp.bottom)
        }
    }
    
    @objc func restartTouched() {
        reset()
    }
    
    func reset() {
        jogoDaMemoria = .init()
        resetCards()
    }
    
    func createButton(with tagId: Int) -> UIButton {
        var buttonConfig = UIButton.Configuration.borderless()
            
        buttonConfig.image = UIImage(named: "jogo-da-memoria-default")
        buttonConfig.imagePadding = 5
            
        let button = UIButton(configuration: buttonConfig)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35).cgColor
        button.layer.shadowRadius = 1
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowOpacity = 1
        button.tag = tagId
        button.addTarget(self, action: #selector(buttonTouched(_:)), for: .touchDown)
        
        return button
    }
    
    @objc func buttonTouched(_ sender: UIButton) {
        sender.setImage(UIImage(named: jogoDaMemoria.cards[sender.tag] ?? "jogo-da-memoria-default"), for: .normal)
        
        if(!jogoDaMemoria.verifyTry(with: sender.tag)){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.setCardToOriginal(with: self.jogoDaMemoria.lastTryIndex!)
                self.setCardToOriginal(with: sender.tag)
                self.jogoDaMemoria.lastTry = nil
                self.jogoDaMemoria.lastTryIndex = nil
            }
        }
        
        if(jogoDaMemoria.gameSituation == .won){
            alert(title: "Boa, você terminou!", description: "Você precisou de \(jogoDaMemoria.tries) tentativas para finalizar o jogo da memória.")
        }
    }
    
    func alert(title: String, description: String? = nil) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Bacana, bora de novo", style: .default) { _ in
            self.reset()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func setCardToOriginal(with index: Int) {
        let button = view.viewWithTag(index) as? UIButton
        button?.setImage(UIImage(named: "jogo-da-memoria-default") , for: .normal)
    }
    
    func resetCards() {
        for index in 1...10 {
            setCardToOriginal(with: index)
        }
    }
}

