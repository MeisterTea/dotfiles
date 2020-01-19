package main

import (
    "fmt"
    "log"
    "os"
    "os/exec"
    "github.com/AlecAivazis/survey"
)

func installPackages(selectedPackages []string) {
    for _, item := range selectedPackages {
      scriptMap := map[string]string{
          "yay": "yay",
          "android studio": "android-studio",
      }

      cmd := exec.Command(fmt.Sprintf("./scripts/%s", scriptMap[item]))
      cmd.Stdin = os.Stdin
      cmd.Stderr = os.Stderr
      cmd.Stdout = os.Stdout

      err := cmd.Run()

      if err != nil {
        log.Printf("Command finished with error: %v", err)
      }
    }
}

func packagesPrompt() {
    selectedPackages := []string{}
    packages := []string{"yay", "android studio"}

    prompt := &survey.MultiSelect{
        Message: "Packages to install",
        Options: packages,
    }

    survey.AskOne(prompt, &selectedPackages, survey.WithIcons(func(icons *survey.IconSet) {
          icons.UnmarkedOption.Text = "◯"
          icons.MarkedOption.Text = "◉"
        }))

    installPackages(selectedPackages)
}

func main() {
  packagesPrompt()
}
