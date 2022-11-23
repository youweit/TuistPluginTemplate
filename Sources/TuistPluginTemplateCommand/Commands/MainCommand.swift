import ArgumentParser

/// The entry point of the plugin. Main command that must be invoked in `main.swift` file.
struct MainCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "plugin-lint",
        abstract: "A plugin that extends Tuist with linting code using SwiftLint.",
        subcommands: [
            TemplateCommand.self,
        ],
        defaultSubcommand: TemplateCommand.self
    )
}
