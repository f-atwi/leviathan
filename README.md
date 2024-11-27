# Leviathan

A tool that simplifies access to the leviathan servers (OverTheWire).

DOES NOT CONTAIN THE PASSWORDS.

Work in progress...

## Usage

To access a level (e.g. level 1) run the following command:

```bash
./leviathan.sh 1
```

If you have not stored the password for the level, you can use the `-p` flag to enter the password manually:

```bash
./leviathan.sh 1 -p <password>
```

if the password is saved for the level but you want to change it, you can use the '-p' flag to enter the new password and the '-f' flag to force the update:

```bash
./leviathan.sh 1 -p <new_password> -f
```

## Requirements

The following tools are required to run the script:

- `pass` (password manager)
- `sshpass` (non-interactive ssh password provider)
