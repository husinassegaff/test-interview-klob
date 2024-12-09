import Foundation

class JobVacancyService {

    private let baseURL = JobVacancyConfig.baseURL
    

    func fetchJobs(completion: @escaping (Result<[JobVacancy], Error>) -> Void) {
  
        let endpoint = "/fakeJob/apple/academy"
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
 
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check response and data
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let error = NSError(domain: "HTTPError", code: (response as? HTTPURLResponse)?.statusCode ?? -1, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -1, userInfo: nil)))
                return
            }
            
            // Decode the data
            do {
                let jobs = try JSONDecoder().decode([JobVacancy].self, from: data)
                completion(.success(jobs))
            } catch {
                completion(.failure(error))
            }
        }
        
        // Start the task
        task.resume()
    }
}
