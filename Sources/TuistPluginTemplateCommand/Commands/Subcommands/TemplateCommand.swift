import ArgumentParser
import TuistPluginTemplate

extension MainCommand {
    /// A command to lint the code using SwiftLint.
    struct TemplateCommand: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "template",
            abstract: "Take a .stencil template and dictionary to render a template."
        )

        @Option(
            name: .shortAndLong,
            help: "The path to generated file.",
            completion: .directory
        )

        var des: String

        @Option(
            name: .shortAndLong,
            help: "The path to the .stencil file.",
            completion: .directory
        )

        var path: String

        @Option(
            name: .shortAndLong,
            help: "The serialize json of the parameter."
        )
        var json: String?


        func run() throws {
            try TemplateService().run(destinationFilePath: des ,templateFilePath: path, with: json)
        }
    }
}
