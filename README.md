# MotoMind AI — Smart Mobility Platform

Milestone 1 starter code: **auth (register/login/JWT)** + **garage/vehicle CRUD**, both backend and Flutter mobile.

## What's included (Milestone 1 — ✅ done here)
- Splash → Login → Register → Home (bottom nav: Dashboard / Garage / Profile)
- Backend: Express + MongoDB (Mongoose) + JWT auth
- Garage: Add Bike screen + list of vehicles pulled live from the API
- Full folder structure for all future milestones already scaffolded

## What's NOT included yet (build these next, Milestones 2–5)
- Fuel tracker, expense tracker, service history (Milestone 2)
- Google Maps + ride tracking + analytics charts (Milestone 3)
- AI Mechanic (Gemini API) + OCR + camera diagnosis (Milestone 4)
- Push notifications, Firebase Storage, deployment (Milestone 5)

---

## 1. Backend setup

```bash
cd server
npm install
cp .env.example .env
```

Edit `.env`:
- `MONGO_URI` — get a free cluster at mongodb.com/atlas, create a database user, paste the connection string
- `JWT_SECRET` — any long random string (e.g. generate with `openssl rand -hex 32`)

Run it:
```bash
npm run dev        # requires nodemon (npm install -g nodemon), or:
npm start
```

Server runs at `http://localhost:5000`. Test it's alive:
```bash
curl http://localhost:5000
# -> {"status":"MotoMind AI API running"}
```

### API endpoints built so far
| Method | Route | Auth? | Body |
|---|---|---|---|
| POST | /api/auth/register | No | name, email, password |
| POST | /api/auth/login | No | email, password |
| GET | /api/auth/me | Yes | — |
| POST | /api/vehicles | Yes | nickname, make, model, year, fuelType |
| GET | /api/vehicles | Yes | — |
| GET | /api/vehicles/:id | Yes | — |
| PUT | /api/vehicles/:id | Yes | any vehicle field |
| DELETE | /api/vehicles/:id | Yes | — |

Auth routes need `Authorization: Bearer <token>` header (token comes back from register/login).

---

## 2. Mobile (Flutter) setup

Prerequisites: Flutter SDK installed, Android Studio or Xcode, an emulator or physical device.

```bash
cd mobile
flutter pub get
```

Point the app at your backend — edit `lib/core/constants/app_constants.dart`:
- Android emulator → keep `http://10.0.2.2:5000/api` (this is how the emulator reaches your laptop's localhost)
- Physical device → use your laptop's local IP, e.g. `http://192.168.1.5:5000/api` (same wifi network)
- Deployed backend (Render/Railway) → use that HTTPS URL

Run it:
```bash
flutter run
```

You should be able to: see splash → register a new account → land on home → go to Garage tab → add a bike → see it in the list.

---

## 3. Recommended commit plan (matches your original plan)

```
git init
git add .
git commit -m "Initial project setup: backend + Flutter skeleton"

# as you build each piece:
git commit -m "Add authentication flow (backend + mobile)"
git commit -m "Implement bottom navigation"
git commit -m "Create garage module (add/list vehicles)"
git commit -m "Integrate MongoDB APIs"
# ... continue through your milestones
```

---

## 4. Suggested build order from here

1. **Test Milestone 1 end-to-end** (register → login → add bike → see it persist) before adding anything else
2. **Milestone 2**: add `FuelLog` and `ServiceLog` routes/controllers (models already scaffolded in `server/src/models/`) + matching Flutter screens under `features/dashboard/`
3. **Milestone 3**: add `google_maps_flutter` map screen + `Trip` model routes; use `fl_chart` (already in pubspec) for analytics
4. **Milestone 4**: this is your standout resume feature — a Node route that calls the Gemini API, parses an uploaded photo (multer for upload, then pass to Gemini vision) and returns a diagnosis
5. **Milestone 5**: Firebase setup (`flutterfire configure`), push notifications, deploy backend to Render/Railway, deploy app via Play Store internal testing track

## For your resume, once this is further along
This project alone can replace your generic "Full-Stack Web Projects" bullet — it's mobile + backend + AI in one, which is a much stronger signal for AI/ML-focused startups in Bangalore. Once Milestone 4 (AI Mechanic) works, that's your strongest interview talking point.
