# Release Audit — CPS 310 ICA08

Release Audit is a Python command-line program that reads a pipe-delimited support-ticket file, displays each ticket in a table, and reports the total number of tickets, the number with `open` status, and the number of tickets meeting the configured high-priority threshold.

## Requirements

- Python 3.12 or newer
- Git
- Python packages listed in `requirements.txt` (`pytest` and `tabulate`)

## Setup (macOS)

Clone the repository from GitHub (replace `YOUR_USERNAME` with your username) and open it:

```bash
git clone https://github.com/YOUR_USERNAME/CPS310-ICA08-DevOps.git
cd CPS310-ICA08-DevOps
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
```

On Windows PowerShell, create and activate the virtual environment with:

```powershell
py -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
```

The `.venv/` directory is local and is not committed to Git.

## Configuration

Edit `config.json` to set the program's behavior without changing the Python code:

- `data_file`: path to the input file containing tickets (`id|status|priority` per line)
- `report_title`: heading printed above the ticket report
- `high_priority_threshold`: minimum numeric priority counted as high-priority

The default values use `tickets.txt`, `Support Ticket Summary`, and a priority threshold of `4`. Run commands from the project directory so relative file paths resolve correctly.

## Run the program

```bash
python3 release_audit.py
```

## Run the tests

```bash
python3 -m pytest -v
```

## Run verification (macOS)

```bash
chmod +x verify.sh
./verify.sh
```

`verify.sh` runs the complete test suite, checks that `requirements.txt` and `config.json` exist, reports their status, and displays `git status --short`. It exits with a failure if tests fail or a required file is missing. On Windows, follow the manual test and file checks above; the unused `verify.ps1` is intentionally not included in this macOS project.

## Release readiness

Compared with the starter, this version declares reproducible dependencies, moves runtime settings into a JSON configuration file, fixes the open-ticket counting defect, tests configuration loading with a temporary file, and automates repeatable checks. The setup and verification commands are documented so another developer can reproduce the same checks from a fresh clone.
