//
//  CardView.swift
//  Hike
//
//  Created by Ketan Aggarwal on 14/03/24.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
        //MARK: - FUNCTIONS
    func randomImage() {
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
         imageNumber = randomNumber
        
    }
    
    var body: some View {
        
        ZStack {
            CustomBackgroundView()
            VStack {
              // MARK: - HEADER
              
              VStack(alignment: .leading) {
                HStack {
                  Text("Hiking")
                    .fontWeight(.black)
                    .font(.system(size: 52))
                    .foregroundStyle(
                      LinearGradient(
                        colors: [
                          .customGrayLight,
                          .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom)
                    )
                    Spacer()
                    Button {
                      // ACTION: Show a Sheet
                      print("The button was pressed.")
                        isShowingSheet.toggle()
                     
                    } label: {
                     CustomButtonView()
                    }
                    .sheet(isPresented: $isShowingSheet){
                        SettingsView()
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium , .large])
                    }
                   
                  }
                  
                  Text("Fun and enjoyable outdoor activity for friends and families.")
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
                }
                Button {
                   randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [
                            .customGreenLight,.customGreenMedium],
                                                        startPoint: .top,
                                                        endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(gradientButton())
            }
            
        }
        .frame(width: 320,height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
