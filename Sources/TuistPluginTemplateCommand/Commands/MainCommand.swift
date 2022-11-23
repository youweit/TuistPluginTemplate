import ArgumentParser

/// The entry point of the plugin. Main command that must be invoked in `main.swift` file.
struct MainCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "plugin-template",
        abstract: "A plugin that can help you generate template from stencil template.",
        subcommands: [
            TemplateCommand.self,
        ],
        defaultSubcommand: TemplateCommand.self
    )
}
