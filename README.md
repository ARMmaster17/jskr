# JSKR
I created JSKR to replace my overly-complicated Excel spreadsheets that I used when tracking job applications. Think of it like a CRM for job-seekers, or a reverse ATS.

## Features

- Job lead tracking.
- Event tracking with status updates (e.g. interview + offer extended).
- Helpful stats that break down results by source.
- Intelligent recommendations on where to go for next application.

## Roadmap
- API (kind of works at the moment).
- Metrics for goal tracking (e.g. 10 applications per day).
- Visual overhaul.
- Integration with Indeed API for market analysis.

## Getting Started
You'll need to register a new OAuth application on GitHub, as that is what JSKR uses for user authentication. The callback URL is `<schema>://<hostname>/users/auth/github/callback`.
### Developer
```bash
git clone https://github.com/ARMmaster17/jskr.git
cd jskr
export GITHUB_APP_ID=<OAuth_APP_ID>
export GITHUB_APP_SECRET=<OAuth_APP_SECRET>
export HOST_URL=http://localhost:3000
bundle install
bin/rails db:migrate
bin/rails server
```
### Local Testing
```bash
git clone https://github.com/ARMmaster17/jskr.git
cd jskr
cat << EOF >> .env
GITHUB_APP_ID=<OAuth_APP_ID>
GITHUB_APP_SECRET=<OAuth_APP_SECRET>
HOST_URL=http://localhost:3000
EOF
docker-compose up
```

### Production
Pre-build Docker images are available under the "Packages" tab of this repository. You'll need to provide your own Postgres server, and pass the following environment variables:

| RAILS_ENV              | "production"                                                             |
|------------------------|--------------------------------------------------------------------------|
| RAILS_LOG_TO_STDOUT    | `enabled`                                                                |
| HOST_URL               | `<schema>://<hostname>`                                                  |
| RAILS_MASTER_KEY       | Generate this yourself or copy from config/master.key                    |
| JSKR_DB_HOST           | Hostname of PSQL instance                                                |
| JSKR_DB_USER           | PSQL username                                                            |
| JSKR_DATABASE_PASSWORD | PSQL password                                                            |
| JSKR_DB_DATABASE       | PSQL database name                                                       |
| DATABASE_URL           | Should follow the format `postgresql://JSKR_DB_HOST:5432/JSKR_DB_DATABASE` |
| GITHUB_APP_ID          | OAuth app ID from GitHub                                                 |
| GITHUB_APP_SECRET      | OAuth app secret from GitHub                                             |

Example Kubernetes manifest files are coming soon.