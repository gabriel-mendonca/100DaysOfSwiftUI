//
//  ContentView.swift
//  Bookworm
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 20/04/21.
//

import SwiftUI


struct ContentView: View {
    
    @State private var showingAddScreen = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: true), NSSortDescriptor(keyPath: \Book.author, ascending: true)]) var books: FetchedResults<Book>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "")
                                .foregroundColor(book.rating == 1 ? Color.red : .secondary)
                                .font(.headline)
                            Text(book.author ?? "")
                                .foregroundColor(.secondary)
                        }
                    }
                }.onDelete(perform: { indexSet in
                    deleteRows(at: indexSet)
                })
            }
                .navigationBarTitle("Bookworm")
            .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
                    self.showingAddScreen.toggle()
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView().environment(\.managedObjectContext, self.moc)
                })
        }
    }
    
    func deleteRows(at offSets: IndexSet) {
        for offset in offSets {
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}

struct PushButton: View {
    
    let title: String
    @Binding var isOn: Bool
    var onColor = [Color.red, Color.yellow]
    var offColor = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }.padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColor : offColor), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
