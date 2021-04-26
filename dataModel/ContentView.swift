//
//  ContentView.swift
//  dataModel
//
//  Created by Rayhan Hidayat on 02/02/21.
//

import SwiftUI

struct ProductModel : Identifiable{
    let id : Int
    let namaProduk : String
    let fotoProduk : String
    let hargaProduk : Int
    let lokasi : String
    let ratingCount : Int
    let jumlahRating : Int
    
    init(id: Int, namaProduk : String,fotoProduk : String,hargaProduk: Int,lokasi : String,ratingCount: Int,jumlahRating: Int){
        
        self.id = id
        self.namaProduk = namaProduk
        self.fotoProduk = fotoProduk
        self.hargaProduk = hargaProduk
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
}


struct ContentView: View {
    
    let data : [ProductModel] = [
        ProductModel(id: 1, namaProduk: "Polygon Xtrada", fotoProduk: "h1", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 2, namaProduk: "Polygon Heist", fotoProduk: "h2", hargaProduk: 3000000, lokasi: "Kab.Bogor", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 3, namaProduk: "Polygon Monarch", fotoProduk: "h3", hargaProduk: 4000000, lokasi: "Kab.Brebes", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 4, namaProduk: "Polygon Xtrada", fotoProduk: "h4", hargaProduk: 3000000, lokasi: "Kab.Banyuwangi", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 5, namaProduk: "United Miami", fotoProduk: "h5", hargaProduk: 2500000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 6, namaProduk: "Exotic M56", fotoProduk: "h6", hargaProduk: 3500000, lokasi: "Kab.Banyuwangi", ratingCount: 5, jumlahRating: 56),
        ProductModel(id: 7, namaProduk: "United Detroid", fotoProduk: "h7", hargaProduk: 4000000, lokasi: "Kab.Banyuwangi", ratingCount: 4, jumlahRating: 56),
        ProductModel(id: 8, namaProduk: "Pacific M898", fotoProduk: "h8", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56)
        
    ]
    
        @State var jumlahKerajang : Int = 0
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(data) { row in
                    VStack(spacing : 10){
                        Product(data : row)
                    }
                    .padding()
                }
            }.navigationBarTitle("Bicycle")
            .navigationBarItems(trailing:
                                    HStack(spacing : 20){
                                        Button(action: {print()}){
                                            Image(systemName: "person.fill")
                                        }
                                        
                                        keranjangView(jumlah: $jumlahKerajang)
                                    })

            
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct keranjangView: View {
    @Binding var jumlah : Int
    var body: some View{
        ZStack{
            Button(action: {print()}){
                Image(systemName: "cart.fill")
        }
        Text("\(jumlah)")
            .foregroundColor(Color.white)
            .frame(width: 10, height: 10)
            .font(.body)
            .padding(5)
            .background(Color.red)
            clipShape(Circle())
            offset(x: 10.0, y: -10)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product : View{
    
    let data : ProductModel
    var body : some View{
        VStack(alignment: .leading){
            ZStack(alignment : .topTrailing){
                Image(self.data.fotoProduk)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                Button(action : {print("OK")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(.red)
                    
                    
                }
            }
            
            Text(self.data.namaProduk)
                .font(.title)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            Text("Rp\(self.data.hargaProduk)")
                .font(.title)
                .foregroundColor(Color.red)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }
            }.padding(.leading)
            .padding(.trailing)
            
            
            
            
        }.background(Color("warnaku"))
        .cornerRadius(15)
    }
}

struct tambahKeranjang: View {
    var body: some View{
        Button(action: {print()}){
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah Keranjang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
    }
    
}
