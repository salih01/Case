//
//  LoginView.swift
//  Case
//
//  Created by Salih Çakmak on 14.05.2022.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isFocuced = false
    @State var showAllert = false


    @State var allertMessage = "Yanlış şeyler yapıyorsun .Düzgün gir. "

    
    //MARK: AMACIM TEXTFİELD VE SECURE FİELD A TIKLANDIKTAN SONRA KLAVYEYİ GİZLEMEK

    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }

    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
      
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)

            ZStack(alignment: .top){
                
                //MARK: üst image ve text dahil
                CoverView(movie: Movie.stubbedMovie)
                //MARK: TextField . Email ve password

                VStack {
                    HStack {
                        
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        TextField("Your email adress", text: $email)
                            .autocapitalization(.none )
                            .keyboardType(.emailAddress)
                            .font(.subheadline)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height:50)
                            
                    }
                    
                    Divider().padding(.leading,80)
                    
                    HStack {
                        
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        SecureField("Your email adress", text: $password)
                            .autocapitalization(.none )
                            .keyboardType(.default)
                            .font(.subheadline)
                            //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height:44)
                            
                    }
                }
                .frame(height :isFocuced ? 300 :150)
                .animation(.easeInOut)

                .onTapGesture {
                    self.isFocuced = true
                }
               
               // .frame(maxWidth: .infinity)
                
                .background(BlurView(style: .systemMaterial)) //Blur efektini burada kullanıyoruz. Dark mode olduğu zaman textfieldlar siyah white mode da beyaz tonlarında renk yakalamamızı sağlıyor
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.7), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y:460)
                
                
                HStack {
                    Text("Şifreni unutma.Ben sorumlu değilim ")
                        .font(.subheadline)
                    
                    Spacer()
                    Button(action: {
                        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
                            
                            //Kullanıcı girişi doğru olup olmadığını kontrol ediyoruz .
                            if error != nil {
                                print("giriş başarılı")
                            }
                        }
                        
                        Text("LOGİN başarılı")
                       // self.login()
                      //  self.showAllert = true
                        self.hideKeyboard() 
                        self.isFocuced = false
                        
                        
                    }){
                        Text("Log in")
                            .foregroundColor(.white)
                    }
                    .padding(12)
                    .padding(.horizontal,30)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color.red.opacity(0.3), radius: 20, x: 0, y: 20)
                    .alert(isPresented: $showAllert){
                        Alert(title: Text("ERROR"), message: Text(self.allertMessage), dismissButton: .default(Text("ok")))
                    }
                    
                }
                .frame(maxWidth:800, maxHeight:.infinity,alignment: .bottom)
                .offset(y: isFocuced ?  250 : 0)

                .padding(30)
                
                
            }
            .offset(y: isFocuced ?  -300 : -100)
            .animation(.easeInOut)
            .onTapGesture {
                self.hideKeyboard()
                self.isFocuced = false
            }


        }

    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView( movie: Movie.stubbedMovie)
            
    }
}

struct CoverView: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    var body: some View {
        VStack {
            GeometryReader { geometry in
                
                Text("Merhaba Salihin Case çalışmasına \nhoş geldiniz ")
                    .font(.system(size: geometry.size.width/10,weight: .bold))
                    .foregroundColor(.white)
                
                
            }
            .frame(maxWidth:385,maxHeight: 150)
            .padding(.horizontal,16)
            
            Text("Firebase ile kullanıcı girişi ")
                .font(.subheadline)
                .foregroundColor(.white)
                .frame(width: 250)
            
            // MARK: amacım Textleri yukarıya hizalamak
            Spacer()
            
        }
        .padding(.top,100)
        .frame(height :500)
        .frame(maxWidth:.infinity)
        .background(
            Image("imdb2")
            
                .resizable()
                .aspectRatio( contentMode: .fill)
            
            
            
        )
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}
