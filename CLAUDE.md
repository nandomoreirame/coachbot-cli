# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

CoachBot is a Bash CLI tool that displays random sarcastic "motivational" quotes (anti-coach humor) in an ASCII speech bubble. Repository: `nandomoreirame/coachbot-cli`.

## Running

```bash
bash coachbot              # English (default)
bash coachbot --lang pt-br # Portuguese (Brazil)
bash coachbot --list-langs # Show available languages
bash coachbot --help       # Usage info
```

Language can also be set via `COACHBOT_LANG` env var.

## Architecture

The project is a single Bash script with JSON data files:

- `coachbot` - Main executable. Parses `--lang`/`COACHBOT_LANG`, selects the phrases file, picks a random quote via `grep`/`sed`, word-wraps at 50 chars, renders Unicode box-drawing speech bubble with ASCII art.
- `phrases.json` - English quotes (default language). Array of `{"phrase": "..."}` objects.
- `phrases-pt-br.json` - Portuguese (Brazil) quotes. Same format.
- `install.sh` - curl-pipe-bash installer. Downloads all files from GitHub raw to `~/.local/bin/`.

## Multi-language system

- Default language is English (`phrases.json`)
- Additional languages use `phrases-{lang-code}.json` naming convention
- The script auto-discovers available languages by globbing `phrases*.json` in its directory
- To add a new language: create `phrases-{code}.json` with the same `{"phrase": "..."}` format

## Known constraints

- Quote parsing uses `sed` regex matching `"phrase": "..."` on a single line. Multi-line phrase values will be truncated at the first closing `"`.
- `$RANDOM` provides 15-bit randomness (0-32767), sufficient for the current quote count but biased for very large sets.
- No build system, linter, or tests.

## Adding quotes

Add entries to the appropriate `phrases*.json` file. The script counts quotes dynamically via `grep -c`, so no index maintenance is needed. Keep each phrase as a single-line string value.

## Installer

When updating `install.sh`, keep the `FILES` array in sync with any new phrase files added to the project.
