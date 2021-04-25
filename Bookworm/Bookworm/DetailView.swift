//
//  DetailView.swift
//  Bookworm
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 23/04/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
    let book: Book
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    @State private var dateAndHour = Date()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(self.book.genre ?? "Fantasy")
                    .frame(maxWidth: geometry.size.width)
                Text(self.book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
                
                Text(formattedDate)
                
                Text(self.book.author == "" ? "N/A" :self.book.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)
                Text(self.book.review == "" ? "N/A" : self.book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(self.book.rating)))
                .font(.largeTitle)
            Spacer()
            }
        }.alert(isPresented: $showingDeleteAlert, content: {
            Alert(title: Text("Delete book"), message: Text("Are you sure?"),primaryButton: .destructive(Text("Delete")) {
                self.deleteBook()
            }, secondaryButton: .cancel() )
        })
        .navigationBarTitle(self.book.title == "" ? "Unknown Book" : self.book.title ?? "", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }) {
            Image(systemName: "trash")
        })
    }
    
    var formattedDate: String {
        if let date = self.book.date {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .medium
            return formatter.string(from: date)
        } else {
            return "N/A"
        }
    }
    func deleteBook() {
        moc.delete(book)
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
        return NavigationView {
            DetailView(book: book)
        }
    }
}
