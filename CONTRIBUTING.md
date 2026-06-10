# Contributing

## Branching

- `main`: production-ready releases
- `develop`: integration branch
- `feature/<short-name>`: new features
- `fix/<short-name>`: bug fixes
- `release/<version>`: release stabilization
- `hotfix/<short-name>`: urgent production fixes

## Pull Requests

Every pull request should include:

- Clear summary
- Linked ticket or task
- Screenshots for UI changes
- Migration notes for database changes
- Test results

## Code Standards

Backend:

- Follow Laravel conventions.
- Keep controllers thin.
- Put business logic in services.
- Use policies and permissions for authorization.
- Add feature tests for API behavior.

Flutter:

- Use feature-first structure.
- Keep widgets focused.
- Use Riverpod controllers for state.
- Keep API calls inside repositories.

Admin Dashboard:

- Keep API clients separate from UI components.
- Prefer typed interfaces.
- Keep route-level authorization explicit.

## Commit Style

Use concise conventional commit messages:

```text
feat: add restaurant payout approval
fix: validate coupon usage limit
test: cover order checkout flow
docs: update deployment guide
```

## Review Checklist

- Tests pass.
- No secrets committed.
- No generated build artifacts committed.
- Database migrations are reversible.
- API changes are documented.
- UI states include loading, empty, and error cases.
