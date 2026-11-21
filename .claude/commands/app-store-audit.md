---
description: Run a pre-submission App Store / Google Play compliance audit on this Flutter app (or a passed path) using the vendored app-store-compliance skill.
---

# App Store Audit

Follow `.claude/skills/app-store-compliance/SKILL.md` end to end. Paths below are relative to the repo root.

1. Target: `$ARGUMENTS` if given, otherwise the repo root.
2. Automated guard (Git Bash):
   ```
   bash .claude/skills/app-store-compliance/hooks/app-store-compliance-guard.sh "<target>"
   ```
3. Load `.claude/skills/app-store-compliance/references/guidelines/by-app-type/` files that match Kadro (`universal-every-app.md`, `subscriptions-and-in-app-purchase.md`, plus any other that applies) and the relevant `references/rules/*.md` (privacy, payments, android, metadata).
4. Metadata layer, if a pulled listing exists: `python .claude/skills/app-store-compliance/scripts/metadata-audit.py <metadata-dir> --platform google`.
5. Human checks from `.claude/skills/app-store-compliance/docs/PRE-SUBMISSION-CHECKLIST.md` (demo account, Data Safety vs. real SDKs — AdMob, RevenueCat, Supabase, notifications —, account deletion URL, 12 testers / 14 days closed test, age rating).
6. Output a severity-ranked findings table (pattern id, platform, guideline, severity, fix, file/setting) and a clear verdict. Never report clear while a critical finding stands. Write findings in Turkish.
