This is an unofficial template to write your PhD thesis at the Faculty of Science (MNF) of the University of Zurich using [Typst](https://typst.app/).

To start using this template, clone the entire repo to your local storage place for Typst packages. This should be `{data-dir}/typst/packages/local/uzh-mnf-phd/1.0.0`, where `{data-dir}` is:
- `$XDG_DATA_HOME` or `~/.local/share` on Linux
- `~/Library/Application Support` on macOS
- `%APPDATA%` on Windows

Then navigate to the folder where you want to store your thesis files and create a new project by typing `typst init @local/uzh-mnf-phd` in the terminal. This will create the basic folder structure and the basic files you will need to write your thesis. You can compile the `main.typ` file to see the output as PDF. More instructions are available in the files created when initiating a project. To adapt the template to your needs, simply modify the `lib.typ` file in the locally installed template.

You can preview the temlate [here](src/main.pdf)