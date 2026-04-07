# I18N Risk Patterns Template

Keep this file neutral in public templates.
In your private project, replace placeholders with your real baseline locale, key naming rules, and locale-file conventions.

Common localization risks:

- editing many locale files before the source baseline is stable
- old and new localization keys mixed together
- placeholder count/order/type mismatch
- plural-form mismatch or missing plural categories
- newline, punctuation, or spacing differences that break UI
- sentence fragments or dynamic templates that do not work in other word orders
- RTL/LTR assumptions hidden in UI layout or punctuation
- machine translation that changes tone, product semantics, or legal meaning
- scope expansion into unrelated screens/modules

Default rules:

- lock the source-language baseline first
- keep the key scope explicit
- decide whether this round is a stopgap or a full rollout
- verify placeholders and newline/punctuation before bulk edits
- treat copy semantics as product behavior, not just text replacement
- when plural/RTL/legal wording is risky, require human review before broad rollout
