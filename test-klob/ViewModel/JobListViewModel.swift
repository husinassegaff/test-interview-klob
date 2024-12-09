import Foundation

@MainActor
class JobListViewModel: ObservableObject {
    @Published var jobs: [JobVacancy] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service = JobVacancyService()

    func fetchJobs() {
        isLoading = true
        errorMessage = nil

        service.fetchJobs { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let jobs):
                    self?.jobs = jobs
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
