VERSION 3: Opens directly to Collection A versus Collection B. No centerpiece selection or introductory screen.

# Groundskeeper — Steam Screenshot Collection Study

## Running on Windows
1. Extract `groundskeeper-study-corrected.zip`.
2. Install Node.js 20 or newer from https://nodejs.org if not already installed.
3. Open the inner `groundskeeper-study` folder containing `server.js`.
4. Click the Windows File Explorer address bar, type `cmd`, and press Enter.
5. Run `node server.js`.
6. Open http://localhost:3000 in your browser. Keep the terminal running.

No npm install is required; the server uses only built-in Node modules.

## Study flow
Exactly four decisions per participant:
1. Collection A vs Collection B.
2. Winner vs Collection C.
3. Winner vs Collection D.
4. Winner vs Collection E.

Each collection always contains its original HeroScreenshot[A-E] plus Supplement[A-E]1–5. Clicking a supplementary thumbnail changes the large *preview*, but never changes the collection itself or votes for a screenshot. The participant must click a **Choose Collection** button to vote for the entire collection.

The order is deliberately fixed (A/B/C/D/E), matching the requested flow. **Methodological limitation:** early collections participate in more comparisons and the fixed order may influence outcomes. For a research paper, document this limitation, or randomize the collection order in a future revision.

## Results
Each completed response is appended to `data/responses.jsonl`. JSON lines include a generated session ID, four matchups, the final collection winner and optional comment. This file belongs to the computer/server running Node, not a participant's device.

## Email notifications (optional)
Recipient default: kaanugurlu85@gmail.com.
Email sending is **not active by default**. For live delivery, set environment variables `RESEND_API_KEY` and `EMAIL_FROM` (verified sender domain/address with Resend) before starting the server. Example in Windows cmd:
```
set RESEND_API_KEY=re_your_real_api_key
set EMAIL_FROM=Study <study@your-verified-domain.example>
node server.js
```
Without those variables, responses are still stored in `data/responses.jsonl` but are not emailed. Do not put the API key in website JavaScript.

For protected data export, set `ADMIN_TOKEN` (a secret random string) in the server environment. GET `/api/results` requires `Authorization: Bearer YOUR_ADMIN_TOKEN`. Never publish that token or API keys.

## Sharing the website
`localhost:3000` is only reachable on your own machine. Deploy this Node server and its persistent `data` folder on a host with persistent storage to collect votes from other people. Ephemeral free hosting may delete local result files; use a persistent volume or database for production. Verify email delivery with a test submission before inviting participants. Use HTTPS and explain consent/data use to participants.

## Research note
This study measures overall preferences for five complete screenshot collections, *not* the isolated effect of lighting, composition, or any single screenshot. The initial order is fixed. Report the four comparisons and avoid treating this sequential contest as a full five-item ranking.
