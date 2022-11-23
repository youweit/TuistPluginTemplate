import Foundation
import StencilSwiftKit

public final class TemplateService {
    public init() {}

    /// The entry point of the service.
    public func run(destinationFilePath: String, templateFilePath: String, with jsonString: String?) throws {

        let path = URL(fileURLWithPath: templateFilePath)
        let templateString = try String(contentsOf: path)
        let template = StencilSwiftTemplate(templateString: templateString)

        var dictionary: [String: Any]?
        if let jsonString = jsonString {
            dictionary = try convertStringToDictionary(text: jsonString)
        }
        let results = try template.render(dictionary)

        let resultFilePath = URL(fileURLWithPath: destinationFilePath)
        try results.write(to: resultFilePath, atomically: true, encoding: String.Encoding.utf8)
        print("✅ Template successfully generated! \ntemplateFilePath = \(templateFilePath)\nGenerate to: \(destinationFilePath)\njsonString = \(String(describing: dictionary))")
    }

    private func convertStringToDictionary(text: String) throws -> [String: Any]? {
       if let data = text.data(using: .utf8) {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
            return json
       }
       return nil
   }
}
