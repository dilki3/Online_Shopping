//
//  AddDeliveryAddressView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-20.
//

import SwiftUI

struct AddDeliveryAddressView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isEdit: Bool = false
    @State var editObj: AddressModel?
    
    var body: some View {
        ZStack {
            
            ScrollView{
                VStack(spacing: 15){
                    
                    LineTextField(title: "Name", placholder: "Enter your name" , txt: $addressVM.txtName)
                    
                    LineTextField(title: "Mobile", placholder: "Enter your mobile number", txt: $addressVM.txtMobile, keyboardType: .numberPad)
                    
                    LineTextField(title: "Address Line", placholder: "Enter your address" , txt: $addressVM.txtAddress)
                    
                    HStack{
                        LineTextField(title: "City", placholder: "Enter your city" , txt: $addressVM.txtCity)
                        LineTextField(title: "State", placholder: "Enter your state" , txt: $addressVM.txtState)
                    }
                   
                    
                    LineTextField(title: "Postal Code", placholder: "Enter your postal code" , txt: $addressVM.txtPostalCode)
                    
                    RoundButton(title: isEdit ? "Update Address" : "Add Address") {
                        if(isEdit) {
                            addressVM.serviceCallUpdateAddress(aObj: editObj) {
                                self.mode.wrappedValue.dismiss()
                            }
                        }else{
                            addressVM.serviceCallAddAddress {
                                self.mode.wrappedValue.dismiss()
                            }
                        }
                    }
                    .padding(.top,20)
                    
                   
                    
                }
                .padding(30)
                .padding(.top, .topInsets + 46)

            }
            
            VStack {
                    
                HStack{
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
                   
                    Spacer()
                    
                    Text( isEdit ? "Edit Delivery Address" : "Add Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    

                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 25)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                Spacer()
                
            }
            .padding(.bottom,10)
        }
        .onAppear{
            if(isEdit) {
                if let aObj = editObj {
                    addressVM.setData(aObj: aObj)
                }
            }
        }
        .alert(isPresented: $addressVM.showError) {
            Alert(title: Text(Links.AppName), message: Text(addressVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        AddDeliveryAddressView()
    }
   
}
