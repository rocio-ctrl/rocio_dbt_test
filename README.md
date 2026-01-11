# dbt Project Setup (BigQuery + Snowflake)

## Requirements
- Python 3.9+
- Git
- (Optional) `gcloud` for BigQuery authentication

## 1) Create and activate a virtual environment
```bash
python3 -m venv .venv
source .venv/bin/activate
```

## 2) Install dependencies from requirements.txt (if available)
```bash
pip install -r requirements.txt
```

## 3) Install dbt Core and adapters
```bash
pip install --upgrade pip
pip install dbt-bigquery dbt-snowflake
```

## 4) Create profiles.yml

By default, dbt looks for the file at:

`~/.dbt/profiles.yml`

Example with both outputs:

```yaml
my_project:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: oauth
      project: YOUR_GCP_PROJECT
      dataset: YOUR_DATASET
      threads: 4
      timeout_seconds: 300
      location: US

    snowflake_dev:
      type: snowflake
      account: YOUR_ACCOUNT
      user: YOUR_USER
      password: YOUR_PASSWORD
      role: YOUR_ROLE
      database: YOUR_DATABASE
      warehouse: YOUR_WAREHOUSE
      schema: YOUR_SCHEMA
      threads: 4
      client_session_keep_alive: false
```

Make sure the `profile:` in `dbt_project.yml` matches `my_project`.

## 5) BigQuery authentication (if applicable)
```bash
gcloud auth application-default login
```

## 6) Verify installation and connection
```bash
dbt --version
dbt debug --target snowflake_dev
```

If you want to use BigQuery:
```bash
dbt debug --target dev
```

## 7) Run models
```bash
dbt run --target snowflake_dev
```

## Notes
To change the target:
```bash
dbt run --target <nombre_del_output>
```

If you decide to store profiles.yml inside the repo, export:
```bash
export DBT_PROFILES_DIR="$PWD/.dbt"
```
