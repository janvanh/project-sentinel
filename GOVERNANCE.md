# Governance

## Current Model: Single Maintainer

For version 1.0, Project Sentinel is governed by a single maintainer who holds final decision authority over the project. This includes:

- architectural and technical decisions
- release approval (what ships, and when)
- moderator appointments for the community company database (see the Project Requirements Specification, Community Database System)
- trust decisions for the plugin author key registry (see the Technical Specification, Plugin Signing and Trust Model)

This applies to decisions about the project's core direction and codebase. It does not apply to the community-facing review processes described below, which already have their own defined rules.

## Why a Single Maintainer

This model matches the project's actual current scale. It avoids introducing governance overhead, voting procedures, maintainer onboarding criteria, and dispute-resolution processes, before there is a team large enough to need any of it. Formalizing structure ahead of an actual team would describe a governance model that does not yet exist, which would work against this project's transparency principle.

## What Is Not Covered by Single-Maintainer Authority

Two processes are already community-governed by design, and are not decided case-by-case by the maintainer:

**Company database submissions.** Additions and corrections to the community company database go through the process defined in the Project Requirements Specification (Community Database System): community voting, reputation-weighted influence, independent verification, and a 70% moderator-approval threshold for high-status changes. The maintainer's role here is limited to appointing and removing moderators, not overriding individual approved or rejected submissions.

**Plugin trust.** Plugin authors are added to a trusted-key registry, and their signed releases do not require re-review from the maintainer on every update, as described in the Technical Specification (Plugin Signing and Trust Model). The maintainer's role is limited to initial trust decisions and revocation, not reviewing every plugin release.

## Future Direction

A path toward a broader maintainer team, with shared decision authority, is acknowledged as a likely future need as the project and its contributor base grow. It is not scoped or formalized as part of v1.0. This section will be revised once that expansion is actually planned, rather than speculatively now.

## Changes to This Document

Changes to the governance model itself are, for now, a maintainer decision like any other, subject to the same transparency principle: any change here will be explained, not just applied silently.
