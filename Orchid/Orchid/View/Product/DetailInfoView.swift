//
//  DetailInfoView.swift
//  Orchid
//
//  Created by Danh Truong on 3/16/21.
//

import SwiftUI

struct DetailInfoView: View {
    @EnvironmentObject var modelData: CategoryModelView
    @Environment(\.presentationMode) var presentationMode
    
    var orchid: OrchidVar
    var orchidIndex: Int {
        modelData.orchidVars.firstIndex(where: { $0.id == orchid.id })!
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                bannerImage
                Spacer()
            }
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    Spacer(minLength: 300)
                    nameSection
                    gallerySection
                    descriptionSection
                }
            }
            .navigationBarHidden(true)
            
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image.init("back")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .rotationEffect(.degrees(180))
                })
                Spacer()
            }.zIndex(Constants.highestIndexLayer)
        }
    }
    
    private var bannerImage: some View {
        orchid.image
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width, height: 300)
            .ignoresSafeArea(edges: .top)
            .scaledToFill()
    }
    
    private var nameSection: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            
            VStack(alignment: .leading, spacing: Constants.margin / 2) {
                Text(orchid.name)
                    .bold()
                    .font(.system(size: CGFloat(18.0)))
                
                HStack {
                    Text("Chi:")
                        .font(.body)
                        .frame(width: 120, alignment: .leading)
                    Text("Dendrobium Superbum Reich")
                        .font(.body)
                        .multiline()
                }
                HStack {
                    Text("Tên khoa học:")
                        .font(.body)
                        .frame(width: 120, alignment: .leading)
                    Text("Den. Superbum Reich.")
                        .font(.body)
                        .multiline()
                }
                HStack {
                    Text("Tên thường gọi:")
                        .font(.body)
                        .frame(width: 120, alignment: .leading)
                    Text("Phi điệp 5 cánh trắng Phú Thọ Thọ")
                        .font(.body)
                        .multiline()
                }
            }
            .padding(.horizontal, Constants.margin / 2)
            .padding(.vertical, Constants.margin)
        }
        .padding(Constants.margin)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var gallerySection: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            VStack(alignment: .leading, spacing: Constants.margin / 2) {
                Text("Bộ sưu tập")
                    .bold()
                    .font(.system(size: CGFloat(18.0)))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Constants.margin) {
                        orchid.image
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 250, height: 250)
                            .cornerRadius(10)
                        orchid.image
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 250, height: 250)
                            .cornerRadius(10)
                        orchid.image
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 250, height: 250)
                            .cornerRadius(10)
                    }
                }
            }.padding(.horizontal, Constants.margin / 2)
            .padding(.vertical, Constants.margin)
        }
        .padding(Constants.margin)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var descriptionSection: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            
            VStack(alignment: .leading, spacing: Constants.margin / 2) {
                Text("Mô tả")
                    .bold()
                    .font(.system(size: CGFloat(18.0)))
                
                Text(orchid.description)
                    .multiline()
            }.padding(.horizontal, Constants.margin / 2)
            .padding(.vertical, Constants.margin)
        }
        .padding(Constants.margin)
        .fixedSize(horizontal: false, vertical: true)
    }
    
}

struct DetailInfoView_Previews: PreviewProvider {
    static let modelData = CategoryModelView()
    
    static var previews: some View {
        DetailInfoView(orchid: CategoryModelView().orchidVars[0])
            .environmentObject(modelData)
    }
}
