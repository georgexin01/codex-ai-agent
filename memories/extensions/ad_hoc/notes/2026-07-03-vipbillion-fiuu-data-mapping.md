VIPBillion FIUU mapping rule:
- Convert VIPBillion booking data into the htdocs_wiper/Fiuu payment request shape when sending to FIUU.
- On return/notify, convert FIUU response fields back into the VIPBillion booking data structure and update the booking row with the mapped values.
- Keep the mapping internal to the website flow; do not expose merchant, verify, or secret keys in the booking form or client-side code.
