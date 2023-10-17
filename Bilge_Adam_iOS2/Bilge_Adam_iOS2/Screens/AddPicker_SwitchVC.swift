//
//  AddPickerVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 16.10.2023.
//

import UIKit
import TinyConstraints

class AddPickerVC: UIViewController {
    
    
    var isCityText:Bool!
    var currentArray = [String]()
    
    let cityArray:[String] = ["İstanbul","Ankara","İzmir","Antalya", "Trabzon", "Gaziantep", "Malatya"]
    
    let states:[[String]] = [["Kadıköy","Sarıyer","Beykoz"],
                             ["Mamak","Kızılay","Çankaya"],
                             ["Karşıyaka", "Urla","Konak"],
                             [""],
                             ["Ortahisar","Sürmene","Maçka"],[""],[""]]
    
    
    
    private lazy var toggleSwitch:UISwitch = {
        let s = UISwitch()
        s.onTintColor = .red
        s.thumbTintColor = .systemBlue
        s.addTarget(self, action: #selector(toggleSwitchChanged), for: .valueChanged)
        return s
    }()
    
    private lazy var txtPicker :UITextField = {
        let tf = UITextField()
        tf.placeholder = "Şehir seçiniz"
        tf.layer.borderWidth = 1
        tf.inputView = pickerView
        tf.inputAccessoryView = addToolBar()
        tf.delegate = self
        return tf
    }()
    
    private lazy var txtState :UITextField = {
        let tf = UITextField()
        tf.placeholder = "İlçe seçiniz."
        tf.inputView = pickerView
        tf.inputAccessoryView = addToolBar()
        tf.delegate = self
        return tf
    }()
    
    private lazy var pickerView:UIPickerView = {
        let pv = UIPickerView()
        pv.delegate = self
        pv.dataSource = self
        return pv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        toggleSwitch.setOn(true, animated: true)
        setupViews()
    }
    
    @objc func toggleSwitchChanged(sender:UISwitch){
        print(sender.isOn)
        
        if sender.isOn {
            self.view.backgroundColor = .black
        }else {
            self.view.backgroundColor = .white
        }
    }
    
    
    func createDataSource(for textfield:UITextField){
        if textfield == txtPicker {
            self.isCityText = true
            self.currentArray = cityArray
            
        }else {
            self.isCityText = false
            cityArray.enumerated().forEach({ index,item in
                if item == txtPicker.text {
                    currentArray = states[index]
                }
            })
    
        }
        
        pickerView.reloadComponent(0)
    }
    
    @objc func btnDonePressed(){
        let row = pickerView.selectedRow(inComponent: 0)
        let text = currentArray[row]
        if isCityText {
            txtPicker.text = text
        }else {
            txtState.text = text
        }
        self.view.endEditing(true)
    }
    
    private func addToolBar()->UIToolbar{
        
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(btnDonePressed))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([spacer,btnDone], animated: false)
        return toolbar
    }
    
    
    private func setupViews(){
        self.view.backgroundColor = .white
        self.view.addSubviews(txtPicker,txtState,toggleSwitch)
        setupLayout()
    }
    
    private func setupLayout(){
        txtPicker.topToSuperview(offset:24, usingSafeArea: true)
        txtPicker.horizontalToSuperview(insets: .left(16) + .right(16))
        txtPicker.height(52)
        
        txtState.topToBottom(of: txtPicker,offset: 12)
        txtState.horizontalToSuperview(insets: .left(16) + .right(16))
        txtState.height(52)
        
        toggleSwitch.topToBottom(of: txtState, offset: 24)
        toggleSwitch.leading(to: txtState)
    }
}


extension AddPickerVC:UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let title = currentArray.isEmpty ? "İlçe buluanmadı."  : currentArray[row]
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let text = currentArray[row]
        if isCityText {
            txtPicker.text = text
        }else {
            txtState.text = text
        }
    }
    
}

extension AddPickerVC:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currentArray.count
    }
    
    
}


extension AddPickerVC:UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        createDataSource(for: textField)
        
    }
}



#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct AddPickerVC_Preview: PreviewProvider {
    static var previews: some View{
         
        AddPickerVC().showPreview()
    }
}
#endif
