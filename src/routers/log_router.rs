use crate::services::{get_logs, post_log};
use axum::{
    Router,
    routing::{get, post},
};

pub fn log_router() -> Router {
    Router::new()
        .route("/logs", get(get_logs))
        .route("/logs", post(post_log))
}
