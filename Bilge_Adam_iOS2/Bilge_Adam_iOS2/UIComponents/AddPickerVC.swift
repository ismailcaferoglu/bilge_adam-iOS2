//
//  AddPickerVC.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 16.10.2023.
//

import UIKit
import TinyConstraints

class AddPickerVC: UIViewController {
    
    var cityArray:[String] = ["İstanbul","Ankara","İzmir","Antalya", "Trabzon", "Gaziantep", "Malatya"]
    
    let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(btnDonePressed))
    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let btnCancel = UIBarButtonItem(title: "Cancel", style: .done, target: nil, action:nil)
    
    private lazy var txtPicker :UITextField = {
        let tf = UITextField()
        tf.placeholder = "Şehir seçiniz"
        tf.layer.borderWidth = 1
        tf.inputView = pickerView
        tf.inputAccessoryView = addToolBar()
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

        setupViews()
    }
    
    @objc func btnDonePressed(){
        let row = pickerView.selectedRow(inComponent: 0)
        let text = cityArray[row]
        self.txtPicker.text = text
        self.view.endEditing(true)
    }
    
    private func addToolBar()->UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([btnCancel,spacer,btnDone], animated: false)
        return toolbar
    }
    
    private func setupViews(){
        self.view.backgroundColor = .white
        self.view.addSubview(txtPicker)
        setupLayout()
    }
    
    private func setupLayout(){
        txtPicker.topToSuperview(offset:24, usingSafeArea: true)
        txtPicker.horizontalToSuperview(insets: .left(16) + .right(16))
        txtPicker.height(52)
    }
}


extension AddPickerVC:UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = cityArray[row]
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let text = cityArray[row]
        txtPicker.text = text
    }
    
}

extension AddPickerVC:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray.count
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
