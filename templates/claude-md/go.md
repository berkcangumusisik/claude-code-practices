# Project Memory

## Stack
- Go 1.26
- Standard library HTTP (`net/http` + `ServeMux` with method-based routing)
- `sqlc` for database access (Postgres)
- `slog` for structured logging
- `testing` + `testify` for tests

## Conventions
- Package layout: `cmd/<binary>/`, `internal/<domain>/`, `pkg/` only for truly shared libraries.
- Errors are values — wrap with `fmt.Errorf("...: %w", err)`. No panics in request paths.
- Context is the first arg on any function that does I/O.
- No `init()` for business logic. Only for registering things that truly must be global (rare).
- Interfaces live with the **consumer**, not the producer.
- Table-driven tests. One `TestXxx` per behavior.

## Gotchas
<!-- fill in -->
- `sqlc generate` must be run after editing `query.sql`. CI will fail otherwise.
- `context.Background()` in tests is fine; in request handlers always use `r.Context()`.
- Slices passed to goroutines: copy before the loop, or capture the index.

## Useful Commands
- Run: `go run ./cmd/server`
- Test one package: `go test ./internal/user/... -run TestCreate -v`
- Race detector: `go test ./... -race`
- Lint: `golangci-lint run`
- Generate: `go generate ./... && sqlc generate`

## Do Not
- Do not import `internal/` packages across service boundaries.
- Do not use `log` stdlib — always `slog` with the request's logger.
- Do not ignore errors. If truly safe to skip, assign to `_` with a comment saying why.
