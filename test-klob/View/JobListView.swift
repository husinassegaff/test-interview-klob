import SwiftUI

struct JobListView: View {
    @StateObject private var viewModel = JobListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading jobs...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.jobs) { job in
                        NavigationLink(destination: JobDetailView(job: job)) {
                            HStack {
                                AsyncImage(url: URL(string: job.corporateLogo)) { image in
                                    image.resizable().scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(job.positionName)
                                        .font(.headline)
                                    Text(job.corporateName)
                                        .font(.subheadline)
                                    
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Jobs")
            .toolbar {
                Button(action: viewModel.fetchJobs) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .onAppear {
            viewModel.fetchJobs()
        }
    }
}
