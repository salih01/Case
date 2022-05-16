//
//  CardDetail.swift
//  Case
//
//  Created by Salih Çakmak on 15.05.2022.
//

import SwiftUI

struct CardDetail: View {
    //courselist
    var row : ROW
    @State var show = false
    @State var show2 = false
    @State var courses = courseData
     
    
    var body: some View {
        
          ScrollView {
              
              VStack (spacing:100){
                  Text("For me ")
                      .font(.largeTitle).bold()
                      .frame(maxWidth: .infinity, alignment: .leading)
                      .padding(.leading, 30)
                      .padding(.top, 30)
                     
                      
                  ForEach(courses.indices, id:\.self) { index in
                      GeometryReader { geometry in
                          CourseView(show: self.$courses[index].show, course: self.courses[index])
                              .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY: 0)
                          }
                          .frame(height: self.courses[index].show ? screen.height :280)
                          .frame(maxWidth: self.courses[index].show ? .infinity : screen.width-60)
                          .zIndex(self.courses[index].show ? 1 : 0)
                  }

                  }
                  .padding(.top, show ? 0: 60)// padding bıraktın unutma
                  .padding(.bottom, show ? 0: 60)
                  .frame(width: screen.width)
                  .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
          }
          .statusBar(hidden: true)
        
         }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(row: rowData[0])
           // .preferredColorScheme(.dark)
    }
}



struct CourseView: View {
    @Binding  var show : Bool
    var course :Course
    
    var body: some View {

        ZStack (alignment: .top){
            
            VStack(alignment: .leading, spacing: 30) {
                Text(course.title)
                    .font(.system(size: 27, weight: .bold))
                    .foregroundColor(Color.black)
                
                HStack (){
                    Text(course.subtitle)
                        .font(.system(size: 24,weight: .bold))
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                        .font(.system(size: 24,weight: .bold))
                        .frame(width: 36, height: 36)
                        //.background(Color.yellow)
                        .foregroundColor(.black).opacity(0.6)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x:0, y: 1)
                        .shadow(color: Color.black.opacity(0.6), radius: 10, x:0, y: 10)
                    Spacer()
                }
                .frame(width: 200 , height: 30, alignment: .center)
                Text(course.description)
              
            }
            .padding(30)
            
            .frame(maxWidth : show ? .infinity :screen.width - 60, maxHeight: show ? .infinity : 0)
            .offset(y: show ? 200 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black, radius: 30, x: 0, y: 20)
            .opacity(show ? 1:0)

           
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(course.title)
                                    .font(.system(size: 27, weight: .bold))
                                    .foregroundColor(Color.white)
                                
                        HStack {
                            Text(course.subtitle)
                                .foregroundColor(Color.white)
                                .font(.system(size: 24,weight: .bold))
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                                .font(.system(size: 18,weight: .bold))

                            
                        }
                        Spacer()
                                
                    }
                    Spacer()
                    
                    VStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .frame(width: 44, height: 44)
                    .background(Color.black)
                    .clipShape(Circle())
                    .opacity(show ? 0.6 : 0)
                }
                .padding()
                
                //Spacer()

            }
            .padding(show ? 30 : 20)
            .padding(.top,show ? 30 : 10)
            .frame(maxWidth : show ? .infinity :screen.width - 60, maxHeight: show ? 220 : 280)
            .background(
                
                course.images
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width :show ? 400:350 ,height: show ? 400:330)
                    .frame(maxWidth:.infinity)
                    .cornerRadius(show ? 55 : 30)
                    
            )
            
            .onTapGesture {
                self.show.toggle()
            }
            

            
        }
        
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
        
            
    
    }
}


struct Course : Identifiable {
   var id = UUID()
   var title : String
   var subtitle : String
   var images : Image
   var show : Bool
   var description : String
}
var courseData = [
   
    Course(title: "The Lord Of the Rings", subtitle: "9.5/ 10", images: Image("lotr"), show: false, description: "Lord of the rings gelmiş geçmiş dünyanın en iyi film serisidir . Konu tartışmaya kapalı,Lord of the rings gelmiş geçmiş dünyanın en iyi film serisidir . Konu tartışmaya kapalı,Lord of the rings gelmiş geçmiş dünyanın en iyi film serisidir . Konu tartışmaya kapalı,Lord of the rings gelmiş geçmiş dünyanın en iyi film serisidir . Konu tartışmaya kapalı,Lord of the rings gelmiş geçmiş dünyanın en iyi film serisidir . Konu tartışmaya kapalı,Lord of the rings gelmiş geçmiş dünyanın en iyi film serisidir . Konu tartışmaya kapalıLord of the rings gelmiş geçmiş dünyanın en iyi film serisidir . Konu tartışmaya kapalı,Lord of the rings gelmiş geçmiş dünyanın en iyi film serisidir . Konu tartışmaya kapalı"),
    Course(title: "How I met Your Mother", subtitle: "9.2/10", images: Image( "hımym"), show: false, description: "How i met your mother dizisi 2030 yılında, Ted Mosby adlı başrol karakterin çocuklarına anneleri ile nasıl tanıştığını anlatması ile başlamaktadır. Dizide genellikle Ted Mosby’nin geçmişinde arkadaşları ile yaşadığı hayatı anlatılmaktadır.How i met your mother dizisi 2030 yılında, Ted Mosby adlı başrol karakterin çocuklarına anneleri ile nasıl tanıştığını anlatması ile başlamaktadır. Dizide genellikle Ted Mosby’nin geçmişinde arkadaşları ile yaşadığı hayatı anlatılmaktadır."),
    Course(title: "70 show", subtitle: "8.6/10", images: Image( "70show"), show: false, description: "That ’70s Show; 1998-2006 yılları arasında 8 Sezon boyunca FOX kanalında 17 Mayıs 1976 – 31 Aralık 1979 yılları arasında Wisconsin’deki hayali kasaba Point Place’de Eric ve yakın arkadaşları Donna, Hyde, Fez, Kelso ve Jackie ile ailelerinin başından geçen olayları, 70’li yılların sosyo-politik durumunu arka plana alarak komik bir şekilde anlatıyor bize. Yayınlandığı dönemde Friends ve Seinfeld kadar büyük izleyici kitlesine sahip olmuş bu başarılı sit-com, her ne kadar son sezona gelene dek oyuncularının bir kısmını kaybetmiş olsa da bizi güldürmeye devam etti, ayrıca ünlü oyuncular yetiştirdi."),
    Course(title: "Ezel", subtitle: "9.9/10", images: Image( "ezel"), show: false, description: "Ezel dizisinin konusu Ömer adlı karakterden geçmektedir. Dizide ana karakter Ömer'dir. Ömer hiç beklemediği ve ummadığı bir ihanet ile karşı karşıya kalmak zorunda kalmıştır. Henüz askerlik görevini yeni yerine getiren Ömer, hayatında en sevdiği insan olan Eyşan ile evlenmek üzere hayaller kurar. Ömer'in Eyşan ile beklenen evliliğinin en bbüyük destekçisi de Cengiz adlı kardeşi ve mahallede yer alan bir diğer elemanlardan olan Kertepen Ali'dir.Ömer hayatında herkese sonsuz bir güven duyan birisiydi. Bundan dolayı ihanete uğrayacağı aklının ucundan dahi geçmiyordu. Hayatının büyük aşkı olan Eyşan'a tam evlilik teklifi yapacağı esnasında polisler tarafından gözaltına alınmaktadır. "),

   

]
