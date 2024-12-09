import Foundation

struct JobVacancy: Codable, Identifiable {
    let id: String
    let positionName: String
    let corporateId: String
    let corporateName: String
    let status: String
    let descriptions: String
    let corporateLogo: String
    let applied: Bool?
    let salaryFrom: Int
    let salaryTo: Int
    let postedDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "jobVacancyCode"
        case positionName
        case corporateId
        case corporateName
        case status
        case descriptions
        case corporateLogo
        case applied
        case salaryFrom
        case salaryTo
        case postedDate
    }
}
