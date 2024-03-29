//
//  MyOrdersDetailView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-21.
//


import SwiftUI
import SDWebImageSwiftUI

struct MyOrdersDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: MyOrderDetailViewModel = MyOrderDetailViewModel(prodObj: MyOrderModel(dict: [:]) )
    
    var body: some View {
        ZStack{
         
            ScrollView {
              
                VStack{
                 
                    HStack{
                        Text("Order ID: \( detailVM.pObj.id )")
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(Color(hex: "#8349D0"))
                        
                        Spacer()
                        
                        Text( getPaymentStatus(mObj: detailVM.pObj )  )
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor( getPaymentStatusColor(mObj: detailVM.pObj))
                    }
                    
                    
                    HStack{
                        Text(detailVM.pObj.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                        
                        Text( getOrderStatus(mObj: detailVM.pObj )  )
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor( getOrderStatusColor(mObj: detailVM.pObj))
                    }
                    .padding(.bottom, 8)
                  
                    Text("\(detailVM.pObj.address),\(detailVM.pObj.city), \(detailVM.pObj.state), \(detailVM.pObj.postalCode) ")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment( .leading)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    
                    
                }
                .padding(15)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.15), radius: 2)
                .padding(.horizontal, 20)
                .padding(.top, .topInsets + 46)
                
                VStack {
                    ForEach(detailVM.listArr, id: \.id) { pObj in
                        OrderItemRow(pObj: pObj)
                    }
                }
               
                VStack{
                
                    HStack{
                        Text("Amount:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( "$\( detailVM.pObj.totalPrice, specifier: "%.2f" )"  )
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor( .primaryText )
                    }
                    .padding(.bottom, 4)
                    
                    HStack{
                        Text("Delivery Cost:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( "+ $\( detailVM.pObj.deliverPrice ?? 0.0, specifier: "%.2f" )"  )
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor( .primaryText )
                    }
                    .padding(.bottom, 4)
                    
                    HStack{
                        Text("Discount:")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                        
                        Spacer()
                        
                        Text( "- $\( detailVM.pObj.discountPrice ?? 0.0, specifier: "%.2f" )"  )
                            .font(.customfont(.medium, fontSize: 18))
                            .foregroundColor( .red )
                    }
                    .padding(.bottom, 4)
                    
                    Divider()
                    
                    HStack{
                        Text("Total Amount:")
                            .font(.customfont(.bold, fontSize: 21))
                            .foregroundColor(Color(hex: "#8349D0"))
                        
                        Spacer()
                        
                        Text( "$\( detailVM.pObj.userPayPrice ?? 0.0, specifier: "%.2f" )"  )
                            .font(.customfont(.bold, fontSize: 21))
                            .foregroundColor(Color(hex: "#8349D0"))
                    }
                    .padding(.bottom, 4)
                    
                    
                }
                .padding(15)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.15), radius: 2)
                .padding(.horizontal, 20)
                .padding(.vertical, 4)
                
            }
            
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Text("My Order Detail")
                        .font(.customfont(.semibold, fontSize: 19))
                        .foregroundColor(.primaryText)
                    Spacer()
                    
                    
                    
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            .padding(.bottom,20)
            
        }
        .alert(isPresented: $detailVM.showError, content: {
            
            Alert(title: Text(Links.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("Ok"))  )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
    func getOrderStatus(mObj: MyOrderModel) -> String {
        switch mObj.orderStatus {
        case 1:
            return "Placed"
        case 2:
            return "Accepted";
        case 3:
            return "Delivered";
        case 4:
            return "Cancel";
        case 5:
            return "Declined";
        default:
            return "";
        }
    }
    
    func getDeliveryType(mObj: MyOrderModel) -> String {
        switch mObj.deliverType {
        case 1:
              return "Delivery";
            case 2:
              return "Collection";
        default:
            return "";
        }
    }
    
    func getPaymentType(mObj: MyOrderModel) -> String {
        switch mObj.paymentType {
        case 1:
            return "Cash On Delivery";
        case 2:
            return "Online Card Payment";
        default:
            return "";
        }
    }
    
    func getPaymentStatus(mObj: MyOrderModel) -> String {
        switch mObj.paymentStatus {
        case 1:
            return "Processing";
        case 2:
            return "Success";
        case 3:
            return "Fail";
        case 4:
            return "Refunded";
        default:
            return "";
        }
    }
    
    func getPaymentStatusColor(mObj: MyOrderModel) -> Color {
        
        if (mObj.paymentType == 1) {
            return Color.orange;
        }
        
        switch mObj.paymentStatus {
        case 1:
            return Color.blue;
        case 2:
            return Color.green;
        case 3:
            return Color.red;
        case 4:
            return Color.green;
        default:
            return Color.white;
        }
    }
    
    func getOrderStatusColor(mObj: MyOrderModel) -> Color {
        
     
        
        switch mObj.orderStatus {
        case 1:
              return Color.blue;
            case 2:
              return Color.green;
            case 3:
              return Color.green;
            case 4:
              return Color.red;
            case 5:
              return Color.red;
            default:
              return Color.primaryApp;        }
    }
}

#Preview {
    MyOrdersDetailView(detailVM: MyOrderDetailViewModel(prodObj: MyOrderModel(dict: [
        
        "order_id": 12,
                    "cart_id": "90",
                    "total_price": 10,
                    "user_pay_price": 12,
                    "discount_price": 0,
                    "deliver_price": 2,
                    "deliver_type": 1,
                    "payment_type": 2,
                    "payment_status": 1,
                    "order_status": 1,
                    "status": 1,
                    "created_date": "2024-03-21T06:33:18.000Z",
                    "names": "Ladie's Pink T-Shirt",
                    "images": "http://localhost:3001/img/product/20240316000149149pAvUiafNi1.jpeg,http://localhost:3001/img/product/20240316000242242B7iufAePWX.jpeg,http://localhost:3001/img/product/20240316000412412BVgzOQj21h.jpeg",
                    "user_name": "mike",
                    "phone": "072345678",
                    "address": "kalugalla road",
                    "city": "kurunegala",
                    "state": "ganewaththa",
                    "postal_code": "4661"
    
    ])))
}
