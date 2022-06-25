# PHP Obfuscate

My attempt to write PHP code using only symbols, no alphanumerical
characters.

Rules:

- All files must contain of symbols only, eg (){}[]!,.$+- et cetera
- No alphanumerical characters allowed (a-z, A-Z, 0-9), except for this
  readme file
- Runs PHP 8.0.8
- Output of the file must match exactly (case-sensitive)
- error\_reporting is 0
- Anything goes (eval(), web requests, reading files)
- Every file is evaluated as PHP code, no need to include the <?php tag
  or return
