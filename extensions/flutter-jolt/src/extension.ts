// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from "vscode";
import * as childProcess from "child_process";

// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {
  let init = vscode.commands.registerCommand(
    "flutter-jolt.initialiseJolt",
    async () => {
      try {
        let terminal = await getTerminal();
        terminal.show(true);
        terminal.sendText("jolt init");
      } catch (e) {}
    }
  );

  context.subscriptions.push(init);

  //   // Register a CompletionItemProvider for Dart files
  //   let completionItems = vscode.languages.registerCompletionItemProvider("dart", {
  //     provideCompletionItems(document, position, token, context) {
  //       // Get the original completion items
  //     const originalItems = vscode.commands.executeCommand(
  //       'vscode.executeCompletionItemProvider',
  //       document.uri,
  //       position
  //     );

  //       if (originalItems) {
  //         return originalItems.then((items) => {
  //           // Filter out the 'package:flutter/material.dart' import suggestion
  //           const filteredItems = items.filter((item) => {
  //             return item.label !== "package:flutter/material.dart";
  //           });
  //           return filteredItems;
  //         });
  //       }

  //       // If no original completion items, return null
  //       return null;
  //     },
  //   });

  //   context.subscriptions.push(completionItems);
}

// This method is called when your extension is deactivated
export function deactivate() {}

// Get the terminal to run Jolt commands
async function getTerminal(): Promise<vscode.Terminal> {
  const terminalName = "Jolt";
  let existingTerminal = vscode.window.terminals.find(
    (t) => t.name === terminalName
  );
  if (existingTerminal) {
    return existingTerminal;
  }

  // Check if Jolt command exists
  let installed = await isJoltAvailable();
  if (!installed) {
    const joltInstallUrl = vscode.Uri.parse(
      "https://flutterjolt.dev/docs/getting-started"
    );

    vscode.window
      .showErrorMessage("Jolt is not installed", "Install Jolt")
      .then((selection) => {
        if (selection === "Install Jolt") {
          vscode.env.openExternal(joltInstallUrl).then((success) => {
            if (!success) {
              vscode.window.showErrorMessage(
                "Failed to open Jolt installation page."
              );
            }
          });
        }
      });

    throw new Error("Jolt is not installed");
  }

  return vscode.window.createTerminal({
    name: terminalName,
    hideFromUser: false,
    env: {},
  });
}

function isJoltAvailable(): Promise<boolean> {
  return new Promise<boolean>((resolve) => {
    childProcess.exec(`which jolt`, (error, stdout, stderr) => {
      resolve(!!stdout && !stderr && !error);
    });
  });
}
