# Contributing to Project Sentinel

Thank you for your interest in Project Sentinel. This document is a starting point. It will be expanded as the tooling it references (linting, type checking, CI, testing) is actually set up in the repository, so some sections below are marked as placeholders.

Project Sentinel currently has three different kinds of contribution, and they are reviewed differently. Find your kind below before reading further.

- **Code changes** to the core application, GUI, or plugin SDK: see "Code Contributions" below.
- **Company database additions or corrections** (privacy contacts, request methods, supported laws for a given company): see "Company Database Contributions" below.
- **Plugin submissions**: see "Plugin Contributions" below.

## Project Status

This project is in pre-implementation. External code contributions (pull requests against the application code) are not yet being accepted. Issue reports, discussion, and feedback on the specification are welcome. See `GOVERNANCE.md` for how contribution scope will expand over time.

## Code Contributions

*This section will be filled in once repository tooling exists (Phase 4 of the Technical Specification). It will cover:*

- Code style and formatting: enforced with Ruff.
- Static type checking: enforced with mypy.
- Testing: written with pytest, including GUI tests via pytest-qt.
- Pre-commit hooks: Ruff and mypy run locally before every commit.
- Continuous integration: GitHub Actions runs formatting, linting, type checks, the full test suite, and dependency vulnerability scanning on every pull request, across Windows, Linux, and macOS.
- Branching: this project uses git-flow. Contributions target the `develop` branch, never `main` directly.
- Pull request checklist: to be added once the PR template exists.

## Company Database Contributions

The company database is community maintained and does not require a GitHub account, git knowledge, or a pull request. Submissions are made directly through the application's in-app submission interface, which converts your input into the correct format and handles the review process automatically.

Every submission, regardless of your reputation or the size of the change, must pass independent verification before it becomes usable. This typically means confirming that a submitted privacy contact matches the company's actual domain, and cross-checking the submitted request method against the company's published privacy policy. Submissions that fail this check are held for manual moderator review.

Already-approved company records remain subject to scrutiny after approval. If you notice a company record that looks wrong or has changed unexpectedly (a different privacy contact, a request that behaved differently than described), you can flag it from within the application. Flagged records are automatically suspended from active use once they accumulate enough flags, pending moderator review.

If you are contributing outside the application (for example, reviewing a submission as a moderator), the canonical company records live in a separate repository as individual, per-company YAML files, which is what makes each submission reviewable as a single small diff. Details on that repository will be added here once it exists.

## Plugin Contributions

Plugins must be open source, reviewed, signed, reproducible, and use the project's permission (capability-token) system. Default plugin permissions are no access; every capability a plugin uses must be explicitly declared in its manifest and explicitly granted by the user at install time.

To have your plugin distributed through the in-app plugin directory, your signing key needs to be added to the project's trusted-author key registry. This is a one-time trust decision, after which subsequent signed releases from you do not require individual re-review. See `GOVERNANCE.md` for how trust decisions are made.

Manual installation from a local file is also available for testing your own plugin, and is still subject to the same signature verification as directory installs.

Full plugin API documentation and submission steps will be added here once the plugin SDK exists (Phase 12 of the Technical Specification).

## Reporting Bugs and Security Issues

Regular bugs: please use the bug report issue template once it is available (see `.github/`).

Security vulnerabilities: do **not** open a public issue. A formal vulnerability disclosure process will be published in `SECURITY.md` before v1.0. Until then, please hold off on public disclosure and check the repository for updated reporting instructions.

## Code of Conduct

To be added.
