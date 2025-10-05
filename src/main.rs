use axum::{Router, routing::get};
mod routers;
mod services;

#[tokio::main]
async fn main() {
    // build our application with a single route
    let app = Router::new()
        .merge(routers::log_router())
        .route("/", get(|| async { "Hello, World!" }))
        .route("/health", get(|| async { "OK" }));
    // .route("/logs", get(services::get_logs));

    // run our app with hyper, listening globally on port 3000
    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app).await.unwrap();
}
