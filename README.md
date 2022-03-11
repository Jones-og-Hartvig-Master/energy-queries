# Energy aware CodeQL queries

[CodeQL documentation](https://codeql.github.com/docs/codeql-overview/about-codeql/)
[CodeQL repo](https://github.com/github/codeql)

## CodeQL

CodeQL uses the query language [`.QL`](https://codeql.github.com/docs/ql-language-reference/about-the-ql-language/) to perform queries on a database generated from some projects source code, in order to detect various erroneous code structures.

CodeQL can be used through a [CLI tool](https://codeql.github.com/docs/codeql-cli/) or as an [extension](https://codeql.github.com/docs/codeql-for-visual-studio-code/) for Visual Studio Code.

### CodeQL CLI

#### Setup

To run the CodeQL CLI you will need a few things. To ensure a proper directory structure, first make a root directory for CodeQL, e.g., `codeql-home`. In this directory, clone the [github/codeql](https://github.com/github/codeql) repo and rename it to `codeql-repo`.

Once this is done, download the [CodeQL binary bundle](https://github.com/github/codeql-action/releases) and extract it in `codeql-home`. In this bundle, `codeql` is located as a binary in its' root - symlink this to `/usr/bin` or add its' parent directory to your `PATH`.

Now, clone this repository in `codeql-home` as well. This way, CodeQL will detect this qlpack without any extra effort. Run `codeql resolve qlpacks` and this set of queries should appear in the list under the name defined in `qlpack.yml` - that is, `csharp-energy-aware-queries`.

```bash
$ mkdir codeql-home
$ cd codeql-home

# git clone https://github.com/github/codeql.git
$ git clone git@github.com:github/codeql.git
$ mv codeql codeql-repo

# download the newest codeql bundle from https://github.com/github/codeql-action/releases
# move it to codeql-home and extract, or simply:
$ wget https://github.com/github/codeql-action/releases/download/codeql-bundle-20220224/codeql-bundle-linux64.tar.gz
$ tar -xvf codeql-bundle-linux64.tar.gz

# either add the following line to your $HOME/.bashrc or similar for whatever shell you use:
# export PATH=$PATH:/home/user/path/to/codeql-home/codeql/
# or run the following command:
$ sudo ln -s /home/user/path/to/codeql-home/codeql/codeql /usr/bin/codeql

# now clone this repo
# git clone https://github.com/Jones-og-Hartvig-Master/energy-queries.git
$ git clone git@github.com:Jones-og-Hartvig-Master/energy-queries.git

# run the following command and ensure csharp-energy-aware-queries appears in the list
$ codeql resolve qlpacks

```