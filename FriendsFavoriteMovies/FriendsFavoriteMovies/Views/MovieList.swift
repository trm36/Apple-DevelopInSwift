//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/23/24.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(\.modelContext) private var modelContext
    
    // MARK: - QUERY VARIABLES
    @Query private var movies: [Movie]
    
    // MARK: - STATE VARIABLES
    @State private var newMovie: Movie?
    
    // MARK: - INITIALIZERS
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie> { movie in
            return titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        _movies = Query(filter: predicate, sort: \Movie.title)
    }

    // MARK: - BODY
    var body: some View {
        NavigationSplitView {
            Group {
                if movies.isEmpty {
                    ContentUnavailableView {
                        Label("No Movies", systemImage: "film.stack")
                    }
                } else {
                    List {
                        ForEach(movies) { movie in
                            NavigationLink {
                                MovieDetail(movie: movie)
                            } label: {
                                Text(movie.title)
                            }
                        }
                        .onDelete(perform: deleteMovies)
                    }
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addMovie) {
                        Label("Add Movie", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
        }
    }

    // MARK: - MODEL CONTROLLER FUNCTIONS
    private func addMovie() {
        withAnimation {
            let movie = Movie(title: "New Movie", releaseDate: Date())
            modelContext.insert(movie)
            newMovie = movie
        }
    }

    private func deleteMovies(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

// MARK: - PREVIEWS
#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Empty List") {
    MovieList()
        .modelContainer(for: Movie.self, inMemory: true)
}

#Preview("Filtered") {
    MovieList(titleFilter: "the")
        .modelContainer(SampleData.shared.modelContainer)
}
