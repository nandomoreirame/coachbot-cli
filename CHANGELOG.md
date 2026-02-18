# Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

## [1.1.0] - 2026-02-18

### Added

- 20 new sarcastic anti-coach phrases (EN and PT-BR) covering fresh themes: gratitude, fake it till you make it, resilience/LinkedIn, follow your passion, morning routine, think outside the box, networking, vision board, fall and get up, marathon, comfort zone, protagonist, trust the process, universe conspires, regret zone, plan A

### Removed

- 6 low-quality phrases from both language files: Chuck Norris jokes (3), printer pun, `var x=10` pun, hate quote

### Changed

- Reformat JSON phrase files to compact single-line-per-phrase style

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
