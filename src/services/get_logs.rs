pub async fn get_logs() -> String {
    return "Hello, World! get_logs".to_string();
    // pub async fn get_logs(logs: SharedLogs) -> impl IntoResponse {
    // let logs = logs.lock().unwrap();
    // Json(logs.clone())
}
