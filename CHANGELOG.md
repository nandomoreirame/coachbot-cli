# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2026-02-18

### Added

- CoachBot CLI tool (`coachbot`) with Unicode box-drawing speech bubble and ASCII art
- Multi-language support via `--lang` flag and `COACHBOT_LANG` environment variable
- English phrase collection (`phrases.json`) with sarcastic anti-motivational quotes
- Portuguese (Brazil) phrase collection (`phrases-pt-br.json`)
- Language auto-discovery from available `phrases*.json` files
- `--list-langs` flag to show available languages
- `--help` flag with usage information
- Word-wrapping at 50 characters for speech bubble rendering
- curl-pipe-bash installer (`install.sh`) for `~/.local/bin/`
- README with install instructions, usage examples, and shell setup guides
- CLAUDE.md with AI coding context for the project
- MIT LICENSE
