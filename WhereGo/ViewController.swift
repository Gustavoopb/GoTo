//
//  ViewController.swift
//  WhereGo
//
//  Created by Gustavo Barbosa on 09/06/16.
//  Copyright © 2016 Gustavoopb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerViewContinent : UIPickerView?
    @IBOutlet weak var labelGoTo : UITextView?
    
    let pickerDataSource = ["América do Norte", "América Central", "América do Sul", "Ásia", "África",
                            "Europa", "Oceania"]
    let countryByContinent : NSDictionary = ["América do Norte" : ["Canadá", "Estado Unidos", "Groenlândia",        "México"], "América Central" : ["Barbados", "Haiti", "Granada", "Salvador", "Jamaica", "Santa Lúcia", "São Vicente e Granadinas", "Porto Rico", "Trindade e Tobago", "República Dominicana", "Ilhas Caimão", "Antígua e Barbuda", "São Cristóvão e Neves", "Guatemala", "Cuba", "Domínica", "Costa Rica", "Honduras", "Panamá", "Nicarágua", "Bahamas"], "América do Sul" : ["Equador", "Colômbia", "Venezuela", "Brasil", "Peru", "Chile", "Uruguai", "Paraguai", "Argentina", "Bolívia", "Suriname", "Guiana", "Ilhas Falkland"], "Ásia" : ["Macau", "Singapura", "Hong Kong", "Barém", "Bangladeche", "Taiwan", "Líbano", "Coreia do Sul", "Israel", "Índia", "Filipinas", "Japão", "Sri Lanca", "Vietname", "Paquistão", "Nepal", "Coreia do Norte", "Catar", "Kuwait", "China", "Indonésia", "Tailândia", "Azerbaijão", "Turquia", "Arménia", "Síria", "Malásia", "Jordânia", "Camboja", "Birmânia", "Timor Leste", "Iraque", "Brunei", "Geórgia", "Emiratos Árabes Unidos", "Usbequistão", "Tajiquistão", "Iémen", "Irã", "Afeganistão", "Laos", "Quirguizistão", "Butão", "Arábia Saudita", "Turquemenistão", "Omã", "Rússia", "Rússia", "Cazaquistão", "Mongólia"], "África" : ["Maurícia", "Ruanda", "Burúndi", "Comores", "Seicheles", "São Tomé e Príncipe", "Nigéria", "Gâmbia", "Uganda", "Malávi", "Cabo Verde", "Togo", "Gana", "Benim", "Etiópia", "Egipto", "Suazilândia", "Serra Leoa", "Quénia", "Marrocos", "Costa do Marfim", "Senegal", "Burquina Faso", "Tunísia", "Lesoto", "Eritreia", "Tanzânia", "Camarões", "Guiné-Bissau", "Guiné", "África do Sul", "Madagáscar", "Libéria", "Zimbabué", "Jibuti", "Congo-Kinshasa", "Moçambique", "Guiné Equatorial", "Zâmbia", "Sudão", "Somália", "Argélia", "Angola", "Níger", "Congo-Brazzaville", "Mali", "Chade", "República Centro-Africana", "Gabão", "Botsuana", "Líbia", "Mauritânia", "Namíbia", "Sara Ocidental"], "Europa" : ["Mónaco", "Vaticano", "Malta", "São Marinho", "Países Baixos", "Bélgica", "Reino Unido", "Listenstaine", "Alemanha", "Itália", "Luxemburgo", "Suíça", "Andorra", "República Checa", "Dinamarca", "Polónia", "Portugal", "Eslováquia", "Hungria", "Moldávia", "Albânia", "Turquia", "França", "Eslovénia", "Áustria", "Espanha", "Sérvia", "Roménia", "Grécia", "Macedónia", "Croácia", "Bósnia e Herzegovina", "Ucrânia", "Irlanda", "Bulgária", "Lituânia", "Montenegro", "Bielorrússia", "Letónia", "Estónia", "Suécia", "Noruega", "Finlândia", "Islândia"], "Oceania" : ["Nauru", "Tuvalu", "Tonga", "Quiribáti", "Samoa", "Fiji", "Palau", "Vanuatu", "Ilhas Salomão", "Nova Zelândia", "Nova Caledónia", "Papua-Nova Guiné", "Austrália"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerViewContinent!.dataSource = self;
        self.pickerViewContinent!.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCountry(){
        let delegate : UIPickerViewDelegate = pickerViewContinent!.delegate!;
        let continentSelected : String = delegate.pickerView!(pickerViewContinent!, titleForRow:(pickerViewContinent?.selectedRowInComponent(0))!, forComponent:0)!
        let countries : [AnyObject] = countryByContinent.objectForKey(continentSelected)! as! [AnyObject]
        let countriesArray : NSArray = NSArray(array: countries)
        let textResult = countriesArray[Int(arc4random_uniform(UInt32(countriesArray.count)))]
        self.labelGoTo?.text = "Nosso próximo destino será: \(textResult)"
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
}

