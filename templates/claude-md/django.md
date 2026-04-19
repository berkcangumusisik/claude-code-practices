# Project Memory

## Stack
- Django 5.2 LTS + Python 3.14
- Postgres, Redis
- Django REST Framework
- pytest + pytest-django
- Celery (background jobs)
- `uv` for dependency management

## Conventions
- One app per bounded context. Apps live under `apps/`.
- Business logic in `services.py`, not in views or models.
- Views are thin: parse input, call service, serialize output.
- Serializers in `serializers.py`, no inline serializers in views.
- Migrations are reviewed — never `--fake` without a note in the PR.
- Settings split: `settings/base.py`, `settings/dev.py`, `settings/prod.py`.

## Gotchas
<!-- fill in -->
- `AUTH_USER_MODEL = "accounts.User"` — always import via `get_user_model()`.
- Signals live in `apps/<app>/signals.py` and are registered in `AppConfig.ready()`.
- Celery tasks must be idempotent; retries are on.

## Useful Commands
- Dev: `python manage.py runserver`
- Test one file: `pytest apps/<app>/tests/test_<name>.py -x`
- Migrations: `python manage.py makemigrations && python manage.py migrate`
- Shell: `python manage.py shell_plus`
- Install: `uv sync`
- Lint + type: `ruff check . && mypy .`

## Do Not
- Do not put queries inside serializer methods — use `select_related` / `prefetch_related` in the view.
- Do not call external APIs synchronously inside a request. Use a Celery task.
- Do not edit migrations after they are merged.
