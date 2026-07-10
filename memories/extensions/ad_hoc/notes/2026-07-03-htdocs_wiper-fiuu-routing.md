Use the htdocs_wiper FIUU routing pattern for VIPBillion website work:
- Do not send website checkout directly to `pg.e2pay.co.id`.
- Build the payment redirect from the booking payload and send it to `pay.fiuu.com/RMS/pay/{merchantId}` with query parameters.
- Keep `returnipn.php?treq=0&sa=...` only on the return/result pages as the IPN acknowledgement step.
- Never extract or reuse secret keys from another site; keep merchant, verify, and secret values in the project's own config.
