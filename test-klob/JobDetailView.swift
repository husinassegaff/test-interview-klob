import Foundation
import SwiftUI

struct JobDetailView: View {
    let job: JobVacancy
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                
                VStack(alignment: .center, spacing: 8) {
                     AsyncImage(url: URL(string: job.corporateLogo)) { image in
                         image
                             .resizable()
                             .scaledToFit()
                     } placeholder: {
                         ProgressView()
                     }
                     .frame(height: 200)
                     .cornerRadius(12)
                     
                     Text(job.corporateName)
                         .font(.title2)
                         .fontWeight(.semibold)
                         .multilineTextAlignment(.center)
                 }
                 .frame(maxWidth: .infinity)
                
                Text("Posted: \(job.postedDate ?? "")")
                    .font(.body)
                Text("Status: \(job.status)")
                    .font(.body)
                
                Text("Range Salary: \(job.salaryFrom) - \(job.salaryTo)")
                    .font(.body)
                
                Text("Description:")
                    .font(.headline)
                ForEach(cleanHTMLDescription(job.descriptions), id: \.self) { item in
                    HStack(alignment: .top) {
                        Text("•")
                            .bold()
                        Text(item)
                            .font(.body)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(job.positionName)
    }
}
