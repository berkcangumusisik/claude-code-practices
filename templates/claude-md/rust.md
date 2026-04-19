# Project Memory

## Stack
- Rust stable (edition 2024)
- Axum 0.8 (HTTP) + Tokio 1
- SQLx 0.8 + Postgres
- `tracing` for logs
- `thiserror` 2 for library errors, `anyhow` for binaries

## Conventions
- Workspace layout: one crate per bounded context, binaries under `crates/<name>-bin`.
- Library crates return `Result<T, CrateError>` with `thiserror`.
- Binaries use `anyhow::Result` at the top level; convert at the boundary.
- No `unwrap()` / `expect()` in library code. OK in tests and in `main()` for startup-only failures.
- Prefer `&str` in function args; return `String` only when ownership is needed.
- Async functions must be cancel-safe or documented as not.

## Gotchas
<!-- fill in -->
- `sqlx::query!` needs `DATABASE_URL` at compile time unless `SQLX_OFFLINE=true` and `.sqlx/` is committed.
- Tokio's default runtime has a thread limit; do not call blocking code without `spawn_blocking`.
- `#[derive(Clone)]` on a handler captures the whole state — wrap with `Arc` if it grows.

## Useful Commands
- Run: `cargo run -p <bin-crate>`
- Test one: `cargo test -p <crate> --test <file> -- --nocapture <name>`
- Check fast: `cargo check --workspace`
- Lint: `cargo clippy --workspace --all-targets -- -D warnings`
- Format: `cargo fmt --all`

## Do Not
- Do not add a dependency without checking it compiles on the MSRV.
- Do not introduce `async_trait` where associated-type-bounds work.
- Do not `.await` while holding a sync lock (`std::sync::Mutex`).
